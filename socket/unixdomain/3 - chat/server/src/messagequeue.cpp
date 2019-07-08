#include "messagequeue.h"

MessageQueue::MessageQueue()
{

}

void MessageQueue::push(const MessageInfo &info)
{
    std::lock_guard<std::mutex> guard(m_);
    q_.push(info);
}

bool MessageQueue::isFilled()
{
    std::lock_guard<std::mutex> guard(m_);
    return !q_.empty();
}

bool MessageQueue::first(MessageInfo &msg)
{
    std::lock_guard<std::mutex> guard(m_);
    if(!q_.empty())
    {
        msg = q_.front();
        return true;
    }
    return false;
}

void MessageQueue::pop()
{
    std::lock_guard<std::mutex> guard(m_);
    if(!q_.empty()) q_.pop();
}
