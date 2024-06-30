#include <thread>
#include <iostream>


using namespace std::chrono_literals; // c++ 14

std::mutex workMutex;

// this function imitates work task
void work(const std::string& message) {
    workMutex.lock();
    std::cout << message << std::endl;
    workMutex.unlock();
}

// function could be passed to thread
void f() {
    for(int i=0; i<10; ++i) {
        work("thread with f() works with value " + std::to_string(i));
        std::this_thread::sleep_for(100ms);
    }
}

// functional object (functor) could be passed to thread
struct F {
    void operator ()() {
        for(int i=0; i<10; ++i) {
            work("thread with F works with value " + std::to_string(i));
            std::this_thread::sleep_for(100ms);
        }
    }
};

int main(int argc, const char* argv[]) {
    std::cout << "Before threads started" << std::endl;

    // create and start thread 1
    std::thread t1 { f };
    // create and start thread 2
    std::thread t2 { F{} };
    // create and start thread 3 (with lambda)
    std::thread t3 { []() {
        for(int i=0; i<10; ++i) {
            work("thread with lambda works with value " + std::to_string(i));
            std::this_thread::sleep_for(100ms);
        }
    } };

    work("All threads are started");

    // wait for t1
    t1.join();
    // wait for t2
    t2.join();
    // wait for t3
    t3.join();

    std::cout << "After threads finished" << std::endl;
    return 0;
}
