#include "messagequeue.h"

MessageQueue::MessageQueue()
{
}

void MessageQueue::push(const std::string &s)
{
    std::lock_guard<std::mutex> guard(m_);
    q_.push(s);
}

bool MessageQueue::isFilled()
{
    std::lock_guard<std::mutex> guard(m_);
    return !q_.empty();
}

bool MessageQueue::first(std::string &s)
{
    std::lock_guard<std::mutex> guard(m_);
    if(!q_.empty())
    {
        s = q_.front();
        return true;
    }
    return false;
}

void MessageQueue::pop()
{
    std::lock_guard<std::mutex> guard(m_);
    if(!q_.empty()) q_.pop();
}
