#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>

#include <netinet/in.h>
#include <netinet/ip.h>
#include <arpa/inet.h>

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

    int bind_res = bind(socket_fd, (struct sockaddr*)&addr, sizeof(addr));
    if(bind_res == -1) error("bind fail");
    else std::cout << "bind result " << bind_res << std::endl;

    ssize_t readingSize = 0;
    while(true)
    {
        std::cout << "Server ready to read" << std::endl;

        struct sockaddr_in client_addr;
        memset(&client_addr, 0, sizeof(client_addr));
        socklen_t client_len = sizeof(client_addr);

        while( (readingSize = recvfrom(socket_fd, buf, sizeof(buf), 0, (struct sockaddr*)&client_addr, &client_len)) > 0 )
        {
            std::cout << "new incoming message:" << std::endl;
            std::cout << "port " << ntohs(client_addr.sin_port) << " address " << inet_ntoa(client_addr.sin_addr) << std::endl;
            std::cout << "len " << client_len << " reading size " << readingSize << std::endl;
            std::cout << "read " << readingSize << " bytes: [" << buf << "]" << std::endl;

            // if message is "q" then exit
            std::string s(buf);
            if(!s.empty())
            {
                s.pop_back(); // del \n at the end
                std::cout << "processing string: [" << s << "] size = " << s.size() << std::endl;

                // "protocol"
                if(s == std::string("q"))
                {
                    std::cout << "exit command from client" << std::endl;
                    close(socket_fd);
                    exit(EXIT_SUCCESS);
                }
            }

            // process data
            for(int i=0; i<readingSize; ++i)
                buf[i] = toupper((unsigned char) buf[i]);
            std::cout << "buf size " << sizeof(buf) << std::endl;

            // sending back
            int send = sendto(socket_fd, buf, readingSize, 0,
                             (struct sockaddr*)&client_addr, client_len);
            if(send != readingSize) error("send error");
            else std::cout << "send " << send << " bytes" << std::endl;

            // clear buf
            memset(&buf, 0, sizeof(buf));
        }

        if (readingSize == -1) error("reading error");

        if(readingSize == 0)
        {
            printf("EOF (client disconnected)\n");
            break;
        }
    }

    close(socket_fd);
    std::cout << "Server stopped" << std::endl;
    return 0;
}
