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

    int socket_fd = socket(PF_UNIX, SOCK_STREAM, 0);
    if(socket_fd == -1) error("socket not created");
    else std::cout << "socket fd = " << socket_fd << std::endl;

    // address settings
    struct sockaddr_un addr;
    memset(&addr, 0, sizeof(addr));
    addr.sun_family = AF_UNIX;
    strncpy(addr.sun_path, SOCK_PATH, sizeof(addr.sun_path)-1);

    int connect_res = connect(socket_fd, (struct sockaddr*)&addr, sizeof(addr.sun_path));
    if(connect_res == -1) error("connect error");
    else std::cout << "connect result " << connect_res << std::endl;
    std::cout << "Client ready to send:" << std::endl;

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

    close(socket_fd);
    std::cout << "Client stopped" << std::endl;
    return 0;
}
