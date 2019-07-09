#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h> // sockaddr_un
#include <unistd.h> // getpid
#include <signal.h>
#include <string.h> // memset

#include <iostream>

#include <thread>
#include <chrono>

const int MESSAGE_SIZE = 50;

void print(std::string s)
{
    std::cout << "Input message [" << s << "]" << std::endl;
}

class Receiver
{
    const int socket_;

//    static void handler(int signum, siginfo_t* info, void* context)
//    {
//        std::cout << "get a sig " << signum << std::endl;
//    }

public:
    Receiver(const int& socket_fd): socket_(socket_fd)
    {
//        struct sigaction sa;
//        sa.sa_sigaction = handler;
//        sa.sa_flags = SA_SIGINFO;
//        sigaction(SIGINT, &sa, nullptr);
    }

    void operator() () // receiver loop
    {
        char buf[MESSAGE_SIZE];
        while(true){
            memset(&buf, 0, sizeof(buf));
            auto receive_bytes = recvfrom(socket_, buf, sizeof(buf), 0,
                                     nullptr, nullptr);

            print(buf);
        }
    }

};

void error(const char* msg)
{
    perror(msg);
    exit(EXIT_FAILURE);
}

int main()
{
    auto pid = getpid();
    std::string client_path = "/tmp/unixdomainchat/" + std::to_string(pid) + "_client";
    std::string server_path = "/tmp/unixdomainchat/server";



    print(client_path);



    int socket_fd = socket(PF_UNIX, SOCK_DGRAM, 0);
    if(socket_fd == -1) error("socket not created");
    else std::cout << "socket fd = " << socket_fd << std::endl;

    // cause we a client - bind to client path - send responce to server path
    // we already know server path

    // address settings
    struct sockaddr_un client_addr;
    memset(&client_addr, 0, sizeof(client_addr));
    client_addr.sun_family = AF_UNIX;
    strncpy(client_addr.sun_path, client_path.c_str(), sizeof(client_addr.sun_path)-1);

    // delete name from filesystem before bind
    unlink(client_path.c_str());

    // bind for client (my) address
    int bind_res = bind(socket_fd, (struct sockaddr*)(&client_addr), sizeof(client_addr));
    if(bind_res == -1) error("bind error");
    else std::cout << "bind result " << bind_res << std::endl;

    std::cout << "Client start!" << std::endl;

    // fill server address
    struct sockaddr_un server_addr;
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sun_family = AF_UNIX;
    strncpy(server_addr.sun_path, server_path.c_str(), sizeof(server_addr.sun_path)-1);



    Receiver r(socket_fd);
    std::thread t(std::ref(r));


    while(true)
    {
        std::string msg;
        std::getline(std::cin, msg);

        if(msg == "q") break;

        auto str_size = msg.size() * sizeof(unsigned char);
        //std::cout << "calculated size " << str_size << std::endl;

        auto send_bytes = sendto(socket_fd, msg.c_str(), str_size, 0,
                               (struct sockaddr*)(&server_addr), sizeof(struct sockaddr_un));
        if(send_bytes < 0) error("send error");
        else std::cout << "send " << send_bytes << " bytes" << std::endl;

    }

    std::cout << "client stopping" << std::endl;
    pthread_kill(t.native_handle(), SIGINT);

    t.join();
    std::cout << "stop" << std::endl;
    return 0;
}
