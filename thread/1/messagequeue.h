#ifndef MESSAGEQUEUE_H
#define MESSAGEQUEUE_H

#include <queue>
#include <string>
#include <mutex>

// queue for exchange data between two threads
class MessageQueue
{
public:
    MessageQueue();

    void push(const std::string& s);    // push data to queue
    bool isFilled();                    // is queue not empty
    bool first(std::string& s);         // get top element
    void pop();                         // pop top element

private:
    std::queue<std::string> q_;
    std::mutex m_;
};

#endif // MESSAGEQUEUE_H
