#include "queue.h"

void Queue::push(const std::string& from, const std::string& msg) {
    std::lock_guard<std::mutex> lock(mtx);
    q.push_back({from, msg});
}

std::pair<std::string, std::string> Queue::pop() {
    mtx.lock();
    auto msg = q.back();
    q.pop_back();
    mtx.unlock();
    return std::make_pair(msg.from, msg.message);
}

bool Queue::hasData() {
    std::lock_guard<std::mutex> lock(mtx);
    return !q.empty();
}
