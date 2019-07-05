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
    const char* SOCK_PATH = "../../socket";

    int socket_fd = socket(AF_UNIX, SOCK_STREAM, 0);
    if(socket_fd == -1) error("socket not created");
    else std::cout << "socket fd = " << socket_fd << std::endl;

    // address settings
    struct sockaddr_un addr;
    memset(&addr, 0, sizeof(addr));
    addr.sun_family = AF_UNIX;
    strncpy(addr.sun_path, SOCK_PATH, sizeof(addr.sun_path)-1);

    // delete name from filesystem before bind
    unlink(SOCK_PATH);

    int bind_res = bind(socket_fd, (struct sockaddr*)&addr, sizeof(addr));
    if(bind_res == -1) error("bind fail");
    else std::cout << "bind result " << bind_res << std::endl;

    int listen_res = listen(socket_fd, 0);
    if(listen_res == -1) error("listen fail");
    else std::cout << "listen result " << listen_res << std::endl;

    int client_socket_fd = 0;
    ssize_t readingSize = 0;
    while(true)
    {
        /*
        struct sockaddr_un clientInfo;
        memset(&clientInfo, 0, sizeof(clientInfo));
        socklen_t clientInfoSize = sizeof(clientInfo);
        if((client_socket_fd = accept(socket_fd, (struct sockaddr*)&clientInfo, &clientInfoSize)) == -1)
        */
        client_socket_fd = accept(socket_fd, nullptr, nullptr);
        if(client_socket_fd == -1) error("accept error");
        else std::cout << "client socket fd = " << client_socket_fd << std::endl;

        std::cout << "Server ready to read" << std::endl;

        while( (readingSize = read(client_socket_fd, buf, sizeof(buf))) > 0 )
        {
            std::cout << "read " << readingSize << " bytes: [" << buf << "]" << std::endl;


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
