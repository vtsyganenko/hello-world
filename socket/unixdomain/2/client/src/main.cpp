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
    const int MSG_SIZE = 30;
    char buf[MSG_SIZE];
    const char* SOCK_CLIENT_PATH = "../../socket_client";  // my address
    const char* SOCK_SERVER_PATH = "../../socket_server";  // server address

    int socket_fd = socket(PF_UNIX, SOCK_DGRAM, 0);
    if(socket_fd == -1) error("socket not created");
    else std::cout << "socket fd = " << socket_fd << std::endl;

    // cause we a client - bind to client path - send responce to server path
    // we already know server path

    // address settings
    struct sockaddr_un client_addr;
    memset(&client_addr, 0, sizeof(client_addr));
    client_addr.sun_family = AF_UNIX;
    strncpy(client_addr.sun_path, SOCK_CLIENT_PATH, sizeof(client_addr.sun_path)-1);

    // delete name from filesystem before bind
    unlink(SOCK_CLIENT_PATH);

//    int connect_res = connect(socket_fd, (struct sockaddr*)&client_addr, sizeof(client_addr.sun_path));
//    if(connect_res == -1) error("connect error");
//    else std::cout << "connect result " << connect_res << std::endl;
//    std::cout << "Client ready to send:" << std::endl;

    // bind for client (my) address
    int bind_res = bind(socket_fd, (struct sockaddr*)(&client_addr), sizeof(client_addr));
    if(bind_res == -1) error("bind error");
    else std::cout << "bind result " << bind_res << std::endl;

    std::cout << "Client start!" << std::endl;

    // fill server address
    struct sockaddr_un server_addr;
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sun_family = AF_UNIX;
    strncpy(server_addr.sun_path, SOCK_SERVER_PATH, sizeof(server_addr.sun_path)-1);



    /*
    const char* data = "Hello from client";
    std::cout << "data =[" << data << std::endl;
    std::cout << "sizeof data " << sizeof(data) << " sizeof struct " << sizeof(struct sockaddr_un) << std::endl;
    bytes = sendto(socket_fd, data, 17, 0,
                  (struct sockaddr*)(&server_addr), sizeof(struct sockaddr_un));

    std::cout << "send " << bytes << " bytes" << std::endl;
*/
    ssize_t send_bytes = 0;
    ssize_t receive_bytes = 0;

    char info[] = "Important information !";
    std::cout << "info size " << sizeof(info) << std::endl;

    send_bytes = sendto(socket_fd, info, sizeof(info), 0,
                   (struct sockaddr*)(&server_addr), sizeof(struct sockaddr_un));
    if(send_bytes < 0) error("send error");
    else std::cout << "send " << send_bytes << " bytes" << std::endl;

    memset(&buf, 0, sizeof(buf));
    receive_bytes = recvfrom(socket_fd, buf, sizeof(buf), 0,
                             nullptr, nullptr);
    if(receive_bytes < 0) error("receive error");
    else {
        std::cout << "responce from server " << receive_bytes << " bytes" << std::endl;
        std::cout << "data=[" << buf << "] " << sizeof(buf) << std::endl;
    }

    close(socket_fd);
    std::cout << "Client stopped" << std::endl;
    return 0;
}
