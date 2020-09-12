#include <iostream>
#include <iomanip>
#include <ctime>
#include <chrono>
#include <sstream>
#include <mutex>
#include <thread>
#include <future>

std::mutex mtx;

std::string getCurrentDateTime()
{
    std::chrono::system_clock::time_point now = std::chrono::system_clock::now();
    std::time_t now_t = std::chrono::system_clock::to_time_t(now);
    std::stringstream ss;
    ss << std::put_time(std::localtime(&now_t), "%F %T");
    return ss.str();
}

void printMessage(const std::string& message)
{
    std::lock_guard<std::mutex> lock(mtx);
    std::cout << "[" << getCurrentDateTime() << "] [" << std::this_thread::get_id() << "] " << message << std::endl;
}

void example1()
{
    printMessage("Main thread start example 1");

    auto threadFunction = [](double value) -> double
    {
        printMessage("threadFunction starts work with value: " + std::to_string(value));
        std::this_thread::sleep_for(std::chrono::seconds(3));   // calculations ...
        printMessage("threadFunction ends work");
        return value*value;
    };

    double value = 25;
    std::future<double> future = std::async(std::launch::async, threadFunction, value);

    printMessage("Main thread wait for result");
    double result = future.get();
    printMessage("result = " + std::to_string(result));

    printMessage("Main thread finishes example 1");
}

void example2()
{
    printMessage("Main thread start example 2");
    std::promise<double> promise;
    std::future<double> ft = promise.get_future();

    auto threadFunction = [&promise](double value) -> void
    {
        printMessage("threadFunction starts work with value: " + std::to_string(value));
        std::this_thread::sleep_for(std::chrono::seconds(3));   // calculations ...
        printMessage("threadFunction ends work");
        promise.set_value(value*value);
    };

    double value = 25;
    std::thread t(threadFunction, value);

    printMessage("Main thread wait for result");
    double result = ft.get();
    printMessage("result = " + std::to_string(result));

    t.join();   // ! async hides this
    printMessage("Main thread finishes example 2");
}

int main()
{
    example1(); // async + future
    example2(); // thread + promise + future

    return 0;
}
