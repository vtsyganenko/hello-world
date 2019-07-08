#ifndef RECEIVER_H
#define RECEIVER_H

#include "common.h"

#include <signal.h>
#include <iostream>
#include <condition_variable>

class MessageQueue;
class ClientBase;

class Receiver
{
public:
    Receiver(const int& socket_fd,
             MessageQueue* queue,
             ClientBase* base,
             std::condition_variable& cv);

    // receiver loop
    void operator() ();

private:
    const int socket_;
    MessageQueue* messages_;
    ClientBase* clientsBase_;
    std::condition_variable& cv_;

    static void handler(int signum, siginfo_t* info, void* context)
    {
        std::cout << "receiver get a sig " << signum << std::endl;
    }
};

#endif // RECEIVER_H
