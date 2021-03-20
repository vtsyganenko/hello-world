#ifndef MESSAGEQUEUE_H
#define MESSAGEQUEUE_H

#include "common.h"

#include <queue>
#include <string>
#include <mutex>

// queue of received messages
class MessageQueue
{
public:
    MessageQueue();

    void push(const MessageInfo& info);
    bool isFilled();
    bool first(MessageInfo& msg);
    void pop();

private:
    std::queue<MessageInfo> q_;
    std::mutex m_;
};

#endif // MESSAGEQUEUE_H
