#include "core.h"

#include <QDebug>
#include <iostream>

Core::Core(QObject *parent) : QObject(parent)
{
    exit_flag_ = false;

    mt_ = new MainThread(&queue_, cv_, exit_flag_);
    t1 = std::thread(*mt_);

    // lambda for reading from queue, filled by MainThread
    auto lambda = [this]()
    {
        while(true)
        {
            std::unique_lock<std::mutex> lock(m_);
            cv_.wait(lock, [this]()
            {
                return (queue_.isFilled() || exit_flag_);
            });

            if(exit_flag_) break;

            std::string msg;
            if(queue_.first(msg))
            {
                queue_.pop();
                lock.unlock();

                // qt wrapper callback
                this->callback(msg);
            }
        }

        std::cout << "lambda end" << std::endl;
    };

    t2 = std::thread(lambda);
}

Core::~Core()
{
    if(!exit_flag_)
    {
        std::cout << "destructor" << std::endl;

        exit_flag_ = true;
        cv_.notify_one();

        t1.join();
        t2.join();
    }

    delete mt_;
}

void Core::callback(const std::string& message)
{
    std::cout << "calback in core class = " << message << std::endl;
    emit data(QString::fromStdString(message));
}

void Core::stopWork()
{
    std::cout << "STOP WORK!" << std::endl;

    if(!exit_flag_)
    {
        exit_flag_ = true;
        cv_.notify_one();
        t1.join();
        t2.join();
    }
}

