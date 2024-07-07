#include "queue.h"

#include <iostream>
#include <chrono>
#include <mutex>
#include <thread>

using namespace std::chrono_literals;


std::mutex log_mutex;
void log(const std::string& message) {
    std::lock_guard<std::mutex> lock(log_mutex);
    std::cout << std::this_thread::get_id() << ": " << message << std::endl;
}

std::mutex main_mutex;
std::condition_variable cv;
bool exit_flag = false;

void producer(const std::string& name, int ms, Queue& q) {
    for(int i=0; i<5; ++i) {
        std::this_thread::sleep_for(std::chrono::milliseconds(ms));

        std::lock_guard<std::mutex> lock(main_mutex);

        q.push(name, std::to_string(ms));
        
        log(name + " puts data");

        cv.notify_one();
    }
}

void consumer(Queue& q) {
    while(!exit_flag) {
        std::unique_lock<std::mutex> lock(main_mutex);

        cv.wait(lock, [&q] { return q.hasData() || exit_flag; } );

        if(!exit_flag) {
            auto data = q.pop();
            log("consumer handled message " + data.second + " from " + data.first);
        }
        else 
            log("consumer exits");
    }
}

int main(int argc, const char* argv[]) {

    Queue queue;

    std::thread consumer_thread(consumer, std::ref(queue));

    std::vector<std::thread> threads;
    std::thread producer_1_thread(producer, "producer 1", 500, std::ref(queue));
    threads.push_back(std::move(producer_1_thread));

    std::thread producer_2_thread(producer, "producer 2", 250, std::ref(queue));
    threads.push_back(std::move(producer_2_thread));

    std::thread producer_3_thread(producer, "producer 3", 750, std::ref(queue));
    threads.push_back(std::move(producer_3_thread));

    for(auto& t : threads) { t.join(); };

    exit_flag = true;
    cv.notify_one();

    consumer_thread.join();

    return 0;
}
