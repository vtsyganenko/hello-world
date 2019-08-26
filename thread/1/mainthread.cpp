#include "mainthread.h"

#include "messagequeue.h"

#include <thread>
#include <chrono>

#include <iostream>

MainThread::MainThread(MessageQueue *q, std::condition_variable &cv, bool &exit)
    : queue_(q), cv_(cv), exit_(exit)
{
    counter_ = 0;
}

void MainThread::operator()()
{
    while(!exit_)
    {
        std::cout << "work cycle" << std::endl;
        std::string message("current num is " + std::to_string(++counter_));
        queue_->push(message);

        cv_.notify_one();
        std::cout << "notified" << std::endl;
        std::this_thread::sleep_for(std::chrono::seconds(2));
        std::cout << "sleep end" << std::endl;
    }

    std::cout << "main thread end" << std::endl;
}
