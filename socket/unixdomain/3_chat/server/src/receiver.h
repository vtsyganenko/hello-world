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
    ~Receiver() { std::cout << "Receiver destruct" << std::endl; }

    // receiver loop
    void operator() ();

private:
    const int socket_;
    MessageQueue* messages_;
    ClientBase* clientsBase_;
    std::condition_variable& cv_;

};

#endif // RECEIVER_H
