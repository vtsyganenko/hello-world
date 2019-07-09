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

// TO DO: correct exit from all thread server and client!

static std::mutex cv_mutex;
static std::condition_variable main_thread_cv;
static bool exit_flag;

void handler(int signum, siginfo_t* info, void* context)
{
    std::cout << "main get a sig " << signum << std::endl;
    exit_flag = true;
    main_thread_cv.notify_one();
}

void error(const char* msg)
{
    perror(msg);
    exit(EXIT_FAILURE);
}

int main()
{
    struct sigaction sa, source;
    sa.sa_sigaction = handler;
    sa.sa_flags = SA_SIGINFO;
    sigaction(SIGINT, &sa, nullptr);


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


    //ssize_t readingBytes = 0;

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


    exit_flag = false;

    Receiver r(socket_fd, &messageQueue, &clientBase, main_thread_cv);
    std::thread t(std::ref(r));

    std::cout << "Server ready..." << std::endl;

    while(true)
    {
        std::unique_lock<std::mutex> lock(cv_mutex);
        main_thread_cv.wait(lock, [&messageQueue]()
        { return messageQueue.isFilled() || exit_flag; });
        std::cout << "main thread wake up" << std::endl;

        if(exit_flag) break;

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
                    std::cout << "send res " << send_bytes << std::endl;
                    // DELETE ABONENT FROM BASE ON send res == -1
                    if(send_bytes == -1)
                    {
                        clientBase.deleteFrom(abonent);
                    }
                    //if(send_bytes != str_size) error("send error");

                }
            }
            messageQueue.pop();
        }
    }

    std::cout << "server stopping" << std::endl;
    //r.subscribeInterrupt();
        sigaction(SIGINT, &source, nullptr);

    std::cout << "send receiver interrupt" << std::endl;
    pthread_kill(t.native_handle(), SIGINT);
    t.join();
    close(socket_fd);
    std::cout << "Server stopped" << std::endl;
    return 0;
}
