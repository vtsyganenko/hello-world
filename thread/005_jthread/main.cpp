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

struct F1 {
    void operator ()() {
        for(int i=0; i<10; ++i) {
            work("thread with F1 works with value " + std::to_string(i));
            std::this_thread::sleep_for(100ms);
        }
    }
    ~F1() {
        work("F1 destructor");
    }
};

struct F2 {
    void operator ()() {
        for(int i=0; i<10; ++i) {
            work("thread with F2 works with value " + std::to_string(i));
            std::this_thread::sleep_for(100ms);
        }
    }
    ~F2() {
        work("F2 destructor");
    }
};

int main(int argc, const char* argv[]) {
    std::cout << "Before threads started" << std::endl;

    {
        // create and start thread 1
        std::jthread t1 { F1{} };
        // create and start thread 2
        std::jthread t2 { F2{} };

        work("All threads are started");

        std::this_thread::sleep_for(300ms);

        // .join() is called then we go out of scope
        work("End of scope");
    }

    std::cout << "After threads finished" << std::endl;
    return 0;
}
