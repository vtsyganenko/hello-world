//#include <sys/types.h>
//#include <sys/socket.h>
//#include <sys/un.h>

//#include <netinet/in.h>
//#include <netinet/ip.h>
//#include <arpa/inet.h>

#include <winsock.h>

#include <string.h>
#include <unistd.h>

#include <iostream>

void error(const char* msg)
{
    perror(msg);
    exit(EXIT_FAILURE);
}

int main()
{
    WSADATA wsaData;
    if(WSAStartup(MAKEWORD(2,0), &wsaData) != 0)
    {
        std::cout << "WSA startup failed" << std::endl;
        return EXIT_FAILURE;
    }
    else
        std::cout << "WSA startup ok" << std::endl;


    char buf[25];

    int socket_fd = socket(AF_INET, SOCK_DGRAM, 0);
    if(socket_fd == -1) error("socket not created");
    else std::cout << "socket fd = " << socket_fd << std::endl;

    // address settings
    struct sockaddr_in addr;
    memset(&addr, 0, sizeof(addr));
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    addr.sin_port = htons(60000);

    ssize_t readingSize = 0;
    // reading from stdin
    while( (readingSize = read(STDIN_FILENO, buf, sizeof(buf))) > 0)
    {
        // and send it to server
        if(sendto(socket_fd, buf, readingSize, 0,
                 (struct sockaddr*)&addr, sizeof(addr)) != readingSize)
        {
            error("write error");
            exit(EXIT_FAILURE);
        }

        if(readingSize < 0) error("reading error");

        // wait for server responce
        memset(&buf, 0, sizeof(buf));
        int receive_bytes = recvfrom(socket_fd, buf, sizeof(buf), 0,
                                     nullptr, nullptr);
        if(receive_bytes < 0) error("receive error");
        else {
            std::cout << "responce from server " << receive_bytes << " bytes" << std::endl;
            std::cout << "data=[" << buf << "] " << sizeof(buf) << std::endl;
        }

        memset(&buf, 0, sizeof(buf));
    }

    closesocket(socket_fd);
    std::cout << "Client stopped" << std::endl;

    std::cout << "cleanup " << WSACleanup() << std::endl;
    return 0;
}
