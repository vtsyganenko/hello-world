#include "common.h"
#include "receiver.h"
#include "messagequeue.h"
#include "clientbase.h"

#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>

#include <string.h>
#include <unistd.h>

#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>



void error(const char* msg)
{
    perror(msg);
    exit(EXIT_FAILURE);
}

int main()
{

    const int MSG_SIZE = 50;
    //char buf[MSG_SIZE];
    const char* SOCK_SERVER_PATH = "/tmp/unixdomainchat/server";
    //const char* SOCK_CLIENT_PATH = "../../socket_client"; - not need for server



    int socket_fd = socket(AF_UNIX, SOCK_DGRAM, 0);
    if(socket_fd == -1) error("socket not created");
    else std::cout << "socket fd = " << socket_fd << std::endl;

    // cause we a server - bind to server path - send responce to client path
    // we may not know a client path - we get it from recvfrom function

    // my address settings
    struct sockaddr_un serv_addr;
    memset(&serv_addr, 0, sizeof(serv_addr));
    serv_addr.sun_family = AF_UNIX;
    strncpy(serv_addr.sun_path, SOCK_SERVER_PATH, sizeof(serv_addr.sun_path)-1);

    // delete name from filesystem before bind
    unlink(SOCK_SERVER_PATH);

    // bind for server (my) address
    int bind_res = bind(socket_fd, (struct sockaddr*)&serv_addr, sizeof(serv_addr));
    if(bind_res == -1) error("bind fail");
    else std::cout << "bind result " << bind_res << std::endl;

    std::cout << "Server ready..." << std::endl;
    ssize_t readingBytes = 0;

    // client address (client path)
//    struct sockaddr_un client_addr;
//    memset(&client_addr, 0, sizeof(client_addr));
//    socklen_t len = sizeof(struct sockaddr_un);


    /*
    ClientInfo client;
    while(true)
    {
        memset(&buf, 0, sizeof(buf));
        //len = sizeof(struct sockaddr_un);

        // read data
        //readingBytes = recvfrom(socket_fd, buf, MSG_SIZE, 0,
        //                        (struct sockaddr*)(&client_addr), &len);
        readingBytes = recvfrom(socket_fd, buf, MSG_SIZE, 0,
                                (struct sockaddr*)(&client.client_addr), &client.len);
        if(readingBytes < 1) error("read error");

        std::cout << "read " << readingBytes << " bytes: [" << buf << "]" << std::endl;
        std::cout << "from " << client.client_addr.sun_path << std::endl;

        // process data
        for(auto i=0; i<readingBytes; ++i)
            buf[i] = toupper((unsigned char) buf[i]);

        // sending back
        auto send = sendto(socket_fd, buf, readingBytes, 0,
                         (struct sockaddr*)(&client.client_addr), client.len);
        if(send != readingBytes) error("send error");
    }
    */

    MessageQueue messageQueue;
    ClientBase clientBase;

    std::mutex mutex;       // need to correct !
    std::condition_variable dataCondition;

    Receiver r(socket_fd, &messageQueue, &clientBase, dataCondition);
    std::thread t(std::ref(r));



    while(true)
    {
        std::unique_lock<std::mutex> lock(mutex);
        dataCondition.wait(lock, [&messageQueue](){ return messageQueue.isFilled(); });


        std::cout << "main thread wake up" << std::endl;
        //continue;

        MessageInfo info(nullptr, std::string());
        if(messageQueue.first(info))
        {
            std::cout << "get message" << std::endl;

            auto str_size = info.msg.size() * sizeof(unsigned char);
            std::cout << "main: client " << info.sender->client_addr.sun_path
                      << " says " << info.msg << std::endl;

            std::vector<ClientInfo*> others = clientBase.others(*info.sender);
            std::cout << "others abonents " << others.size() << std::endl;
            if(others.size() > 0)
            {
                for(auto& abonent : others)
                {
                    std::cout << "send" << std::endl;
                    auto send_bytes = sendto(socket_fd, info.msg.c_str(), str_size, 0,
                                 (struct sockaddr*)(&abonent->client_addr),
                                             abonent->len);
                    if(send_bytes != str_size) error("send error");

                }
            }
            messageQueue.pop();
        }
    }



    close(socket_fd);
    std::cout << "Server stopped" << std::endl;
    return 0;
}
