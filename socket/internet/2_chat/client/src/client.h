#ifndef CLIENT_H
#define CLIENT_H

#include <condition_variable>
#include <thread>

#include <netinet/in.h>

class Receiver;
class EventQueue;
class Receiver;

// "main" thread for test
// once in 2 seconds pushed string to queue
class Client
{
public:
    Client();
    Client(EventQueue* q,
           std::condition_variable *cv,
           bool *exit,
           Receiver* r);
    ~Client();

    void operator() ();

    Client(const Client& other);
    Client& operator= (const Client& other);

    void send(const std::string& message);

private:
    EventQueue* queue_;
    std::condition_variable* cv_;
    int counter_;
    bool* exit_;

    Receiver* receiver_;
    std::thread* receiverThread_;

    int socket_;
    struct sockaddr_in addr_;
};

#endif // CLIENT_H
