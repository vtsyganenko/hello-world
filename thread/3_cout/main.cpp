#include "mtcout.h"

#include <vector>

void threadFunc(int threadNumber) {
    using namespace std::chrono_literals;
    { mtcout{} << "Started thread number " << threadNumber; }
    std::this_thread::sleep_for(200ms);
    LOG("Thread " << threadNumber << " is working...")
    std::this_thread::sleep_for(200ms);
    LOG("Finished thread number " << threadNumber)
}

int main()
{
    size_t THREAD_COUNT { 5 };
    std::vector<std::thread> threads;
    for(size_t i=0; i<THREAD_COUNT; ++i) {
        threads.emplace_back(threadFunc, i+1);
    }

    for(size_t i=0; i<THREAD_COUNT; ++i) {
        threads[i].join();
    }

    return 0;
}
