#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>

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
    memset(&buf, 0, sizeof(buf));
    const char* SOCK_SERVER_PATH = "../../socket_server";
    //const char* SOCK_CLIENT_PATH = "../../socket_client";


    int socket_fd = socket(AF_UNIX, SOCK_DGRAM, 0);
    if(socket_fd == -1) error("socket not created");
    else std::cout << "socket fd = " << socket_fd << std::endl;

    // cause we a server - bind to server path - send responce to client path
    // we may not know a client path - we get it from recvfrom function

    // address settings
    struct sockaddr_un serv_addr;
    memset(&serv_addr, 0, sizeof(serv_addr));
    serv_addr.sun_family = AF_UNIX;
    strncpy(serv_addr.sun_path, SOCK_SERVER_PATH, sizeof(serv_addr.sun_path)-1);

    // delete name from filesystem before bind
    unlink(SOCK_SERVER_PATH);

    int bind_res = bind(socket_fd, (struct sockaddr*)&serv_addr, sizeof(serv_addr));
    if(bind_res == -1) error("bind fail");
    else std::cout << "bind result " << bind_res << std::endl;

    std::cout << "Server ready to read" << std::endl;

    ssize_t readingBytes = 0;

    // client address (client path)
    struct sockaddr_un client_addr;
    memset(&client_addr, 0, sizeof(client_addr));
    socklen_t len;
    while(true)
    {
        len = sizeof(struct sockaddr_un);

        readingBytes = recvfrom(socket_fd, buf, sizeof(buf), 0,
                                (struct sockaddr*)(&client_addr), &len);
        if(readingBytes < 1) error("read error");


        std::cout << "read " << readingBytes << " bytes: [" << buf << "]" << std::endl;
        std::cout << client_addr.sun_path << std::endl;


        for(int i=0; i<readingBytes; ++i)
            buf[i] = toupper((unsigned char) buf[i]);

        sendto(socket_fd, buf, readingBytes, 0,
               (struct sockaddr*)&client_addr, len);

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
        //}

            /*
        if (readingBytes == -1) error("reading error");

        if(readingBytes == 0)
        {
            printf("EOF (client disconnected)\n");
            close(client_socket_fd);
            break;
        }*/
    }

    close(socket_fd);
    std::cout << "Server stopped" << std::endl;
    return 0;
}
