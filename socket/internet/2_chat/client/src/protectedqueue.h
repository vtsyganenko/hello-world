#ifndef PROTECTEDQUEUE_H
#define PROTECTEDQUEUE_H

#include <queue>
#include <mutex>

// queue template for data exchange between threads

template<typename T>
class ProtectedQueue
{
public:
    ProtectedQueue(){}

    // push data to queue
    void push(const T& element){
        std::lock_guard<std::mutex> guard(m_);
        q_.push(element);
    }

    // is queue not empty
    bool is_filled(){
        std::lock_guard<std::mutex> guard(m_);
        return !q_.empty();
    }

    // get top element
    bool first(T& element){
        std::lock_guard<std::mutex> guard(m_);
        if(!q_.empty())
        {
            element = q_.front();
            return true;
        }
        return false;
    }

    // pop out top element
    void pop(){
        std::lock_guard<std::mutex> guard(m_);
        if(!q_.empty()) q_.pop();
    }

private:
    std::queue<T> q_;
    std::mutex m_;
};

#endif // PROTECTEDQUEUE_H
