#ifndef QUEUE_H
#define QUEUE_H

#include <mutex>
#include <deque>

class Queue {
public:
    Queue(){}

    void push(const std::string& from, const std::string& msg);

    std::pair<std::string, std::string> pop();

    bool hasData();

private:
    std::mutex mtx;
    struct Message {
        std::string from;
        std::string message;
    };
    std::deque<Message> q;

};

#endif // QUEUE_H
