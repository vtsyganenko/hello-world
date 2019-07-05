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
    const char* SOCK_CLIENT_PATH = "../../socket_client";
    const char* SOCK_SERVER_PATH = "../../socket_server";

    int socket_fd = socket(PF_UNIX, SOCK_DGRAM, 0);
    if(socket_fd == -1) error("socket not created");
    else std::cout << "socket fd = " << socket_fd << std::endl;

    // cause we a client - bind to client path - send responce to server path
    // we already know server path

    // delete name from filesystem before bind
    unlink(SOCK_CLIENT_PATH);

    // address settings
    struct sockaddr_un client_addr;
    memset(&client_addr, 0, sizeof(client_addr));
    client_addr.sun_family = AF_UNIX;
    strncpy(client_addr.sun_path, SOCK_CLIENT_PATH, sizeof(client_addr.sun_path)-1);

//    int connect_res = connect(socket_fd, (struct sockaddr*)&client_addr, sizeof(client_addr.sun_path));
//    if(connect_res == -1) error("connect error");
//    else std::cout << "connect result " << connect_res << std::endl;
//    std::cout << "Client ready to send:" << std::endl;

    int bind_res = bind(socket_fd, (struct sockaddr*)(&client_addr), sizeof(struct sockaddr_un));
    if(bind_res == -1) error("bind error");

    // fill server address
    struct sockaddr_un server_addr;
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sun_family = AF_UNIX;
    strncpy(server_addr.sun_path, SOCK_SERVER_PATH, sizeof(server_addr.sun_path)-1);


    ssize_t bytes = 0;
    /*
    const char* data = "Hello from client";
    std::cout << "data =[" << data << std::endl;
    std::cout << "sizeof data " << sizeof(data) << " sizeof struct " << sizeof(struct sockaddr_un) << std::endl;
    bytes = sendto(socket_fd, data, 17, 0,
                  (struct sockaddr*)(&server_addr), sizeof(struct sockaddr_un));

    std::cout << "send " << bytes << " bytes" << std::endl;
*/
    char info[] = "Important information";
    std::cout << "info size " << sizeof(info) << std::endl;
    int size = sizeof(info);

    bytes = sendto(socket_fd, info, size, 0,
                   (struct sockaddr*)(&server_addr), sizeof(struct sockaddr_un));

    std::cout << "send " << bytes << " bytes" << std::endl;




    recvfrom(socket_fd, buf, sizeof(buf), 0,
             nullptr, nullptr);
    std::cout << "responce from server [" << buf << "] " << sizeof(buf) << std::endl;

    /*



    ssize_t readingSize = 0;
    // reading from stdin
    while( (readingSize = read(STDIN_FILENO, buf, sizeof(buf))) > 0)
    {
        // and send it to server
        if (write(socket_fd, buf, readingSize) != readingSize)
        {
            error("write error");
            exit(EXIT_FAILURE);
        }

        if(readingSize < 0) error("reading error");
    }
*/
    close(socket_fd);
    std::cout << "Client stopped" << std::endl;
    return 0;
}
