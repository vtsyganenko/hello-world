#ifndef MESSAGEQUEUE_H
#define MESSAGEQUEUE_H

#include "event.h"

#include <queue>
#include <string>
#include <mutex>

// queue for exchange data between two threads
class EventQueue
{
public:
    EventQueue();

    void push(const Event& s);    // push data to queue
    bool isFilled();                    // is queue not empty
    bool first(Event& s);         // get top element
    void pop();                         // pop top element

private:
    std::queue<Event> q_;
    std::mutex m_;
};

#endif // MESSAGEQUEUE_H
