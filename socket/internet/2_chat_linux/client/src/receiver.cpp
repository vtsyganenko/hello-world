#include "receiver.h"

#include "common.h"

#include <string.h>
#include <iostream>

Receiver::Receiver(int socket, Callback cb)
    : socket_(socket), call_(cb)
{
    // set up a signal handger - this uses for exit
    struct sigaction sa;
    sa.sa_sigaction = signal_handler;
    sa.sa_flags = SA_SIGINFO;
    sigaction(SIGINT, &sa, nullptr);
}

void Receiver::operator()()
{
    char bufer[MESSAGE_SIZE];
    while(true)
    {
        memset(&bufer, 0, sizeof(bufer));
        int receive_bytes = recvfrom(socket_, bufer, sizeof(bufer), 0,
                                     nullptr, nullptr);
        if(receive_bytes < 0)
        {
            error("receive error");
        }
        else
        {
            std::cout << "Receiver: " << sizeof(bufer) << " bytes [" << receive_bytes << "]" << std::endl;
        }

        call_(std::string(bufer));
    }
}
