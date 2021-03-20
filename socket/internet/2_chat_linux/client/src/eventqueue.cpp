#include "eventqueue.h"

EventQueue::EventQueue()
{
}

void EventQueue::push(const Event &s)
{
    std::lock_guard<std::mutex> guard(m_);
    q_.push(s);
}

bool EventQueue::isFilled()
{
    std::lock_guard<std::mutex> guard(m_);
    return !q_.empty();
}

bool EventQueue::first(Event &s)
{
    std::lock_guard<std::mutex> guard(m_);
    if(!q_.empty())
    {
        s = q_.front();
        return true;
    }
    return false;
}

void EventQueue::pop()
{
    std::lock_guard<std::mutex> guard(m_);
    if(!q_.empty()) q_.pop();
}
