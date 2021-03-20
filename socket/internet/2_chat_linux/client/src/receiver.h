#ifndef RECEIVER_H
#define RECEIVER_H

#include <functional>
#include <sys/types.h>
#include <signal.h>
#include <sys/socket.h>

using Callback = std::function<void(std::string)>;

class Receiver
{
public:
    Receiver(int socket, Callback cb);

    void operator() ();



private:
    const int MESSAGE_SIZE = 50;
    const int socket_;
    Callback call_;




    static void signal_handler(int signum, siginfo_t* info, void* context)
    {
        // uses for thread exit
        (void)signum;
        (void)info;
        (void)context;
        pthread_exit(nullptr);
    }



};

#endif // RECEIVER_H
