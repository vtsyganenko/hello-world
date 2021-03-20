#include "client.h"

#include "eventqueue.h"
#include "receiver.h"
#include "common.h"

#include <sys/socket.h>

#include <netinet/ip.h>
#include <arpa/inet.h>

#include <string.h>
#include <unistd.h>

#include <thread>
#include <chrono>
#include <iostream>

Client::Client()
{
    queue_ = nullptr;
    cv_ = nullptr;
    exit_ = nullptr;

    socket_ = 0;
}

Client::Client(EventQueue *q, std::condition_variable *cv, bool *exit, Receiver *r)
    : queue_(q), cv_(cv), exit_(exit), receiver_(r)
{


    socket_ = socket(AF_INET, SOCK_DGRAM, 0);
    if(socket_ == -1) error("socket not created");
    else std::cout << "socket fd = " << socket_ << std::endl;

    // address settings

    memset(&addr_, 0, sizeof(addr_));
    addr_.sin_family = AF_INET;
    addr_.sin_addr.s_addr = inet_addr("127.0.0.1");
    addr_.sin_port = htons(60000);



    auto receiver_callback = [this](const std::string& data)
    {
        Event event;
        event.data = data;
        queue_->push(event);

        cv_->notify_one();
    };

    receiver_ = new Receiver(socket_, receiver_callback);

    //receiverThread_ = new std::thread(*receiver_);

 //   receiverThread_ = new std::thread([](){ std::this_thread::sleep_for(std::chrono::seconds(10)); });


//    receiverThread_ = new std::thread([]()
//    { std::this_thread::sleep_for(std::chrono::seconds(2)); });

    receiverThread_ = new std::thread([this]()
        { receiver_->operator()(); });




    // test send
    /*
    std::string msg("hello");
    auto size = msg.size() * sizeof(unsigned char);

    std::cout << "send res: "
              << sendto(socket_, msg.c_str(), size, 0,
                       (struct sockaddr*)&addr, sizeof(addr))
              << std::endl;


*/
}

Client::~Client()
{
    std::cout << "CLIENT destructor" << std::endl;



/*
    pthread_kill(receiverThread_->native_handle(), SIGINT);
    */
    /*
    if(receiverThread_->joinable())
        receiverThread_->join();

    delete receiverThread_;
*/
   // delete receiver_;

    pthread_cancel(receiverThread_->native_handle());
    receiverThread_->join();


    delete receiverThread_;


    close(socket_);

}

void Client::operator()()
{
    counter_ = 0;

    while(*exit_ == false)
    {

/*
        std::cout << "work cycle" << std::endl;
        std::string message("current num is " + std::to_string(++counter_));

        Event ev;
        ev.data = message;
        queue_->push(ev);

        cv_->notify_one();
        std::cout << "notified" << std::endl;
        */
        std::this_thread::sleep_for(std::chrono::seconds(2));
        //std::cout << "sleep end" << std::endl;


    }

    std::cout << "main thread end" << std::endl;
}

Client::Client(const Client &other)
{

}

Client &Client::operator=(const Client &other)
{
    return *this;
}

void Client::send(const std::string &message)
{
    std::cout << "send!" << std::endl;
    auto size = message.size() * sizeof(unsigned char);

    std::cout << "send res: "
              << sendto(socket_, message.c_str(), size, 0,
                       (struct sockaddr*)&addr_, sizeof(addr_))
              << std::endl;
}
