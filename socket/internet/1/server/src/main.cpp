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
    //const char* SOCK_PATH = "../../socket";

    int socket_fd = socket(AF_INET, SOCK_DGRAM, 0);
    if(socket_fd == -1) error("socket not created");
    else std::cout << "socket fd = " << socket_fd << std::endl;

    // address settings
    struct sockaddr_in addr;
    memset(&addr, 0, sizeof(addr));
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = inet_addr("127.0.0.1");
    addr.sin_port = htons(60000);


    // delete name from filesystem before bind
    //unlink(SOCK_PATH);



    int bind_res = bind(socket_fd, (struct sockaddr*)&addr, sizeof(addr));
    if(bind_res == -1) error("bind fail");
    else std::cout << "bind result " << bind_res << std::endl;

//    int listen_res = listen(socket_fd, 0);
//    if(listen_res == -1) error("listen fail");
//    else std::cout << "listen result " << listen_res << std::endl;

    int client_socket_fd = 0;
    ssize_t readingSize = 0;
    while(true)
    {
//        struct sockaddr_un clientInfo;
//        memset(&clientInfo, 0, sizeof(clientInfo));
//        socklen_t clientInfoSize = sizeof(clientInfo);
//        if((client_socket_fd = accept(socket_fd, (struct sockaddr*)&clientInfo, &clientInfoSize)) == -1)

        //client_socket_fd = accept(socket_fd, nullptr, nullptr);
        //if(client_socket_fd == -1) error("accept error");
        //else std::cout << "client socket fd = " << client_socket_fd << std::endl;

        std::cout << "Server ready to read" << std::endl;

        struct sockaddr_in client_addr;
        memset(&client_addr, 0, sizeof(client_addr));

        socklen_t client_len = sizeof(client_addr);

        while( (readingSize = recvfrom(socket_fd, buf, sizeof(buf), 0, (struct sockaddr*)&client_addr, &client_len)) > 0 )
        {
            std::cout << "read " << readingSize << " bytes: [" << buf << "]" << std::endl;

/*
            std::string s(buf);
            if(!s.empty())
            {
                s.pop_back(); // del \n at the end
                std::cout << "processing string: [" << s << "] size = " << s.size() << std::endl;

                // "protocol"
                if(s == std::string("exit"))
                {
                    std::cout << "exit command from client" << std::endl;
                    close(client_socket_fd);
                    close(socket_fd);
                    exit(EXIT_SUCCESS);
                }
            }
            */
            // clear buf
            memset(&buf, 0, sizeof(buf));
        }

        if (readingSize == -1) error("reading error");

        if(readingSize == 0)
        {
            printf("EOF (client disconnected)\n");
            close(client_socket_fd);
            break;
        }
    }



    close(socket_fd);
    std::cout << "Server stopped" << std::endl;
    return 0;
}
