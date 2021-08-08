#ifndef MTCOUT_H
#define MTCOUT_H

#include <iostream>
#include <iomanip>
#include <thread>
#include <mutex>

// blocking inheritor of cout
class mtcout : public std::ostringstream
{
public:
    mtcout() {
        fillTime();
        fillThreadID();
    }
    ~mtcout() {
        std::lock_guard<std::mutex> lock(mutex());
        std::cout << str() << std::endl;
    }

private:
    std::mutex& mutex() {
        static std::mutex mutex;
        return mutex;
    }

    void fillTime() {
        using namespace std::chrono;
        const auto current_time_point { system_clock::now() } ;

        const auto current_time_t { system_clock::to_time_t(current_time_point) };
        const auto current_localtime { *std::localtime(&current_time_t) };

        const auto current_time_since_epoch { current_time_point.time_since_epoch() };
        const auto current_milliseconds { duration_cast<milliseconds>(current_time_since_epoch).count() % 1000 };

        *this << "[" << std::put_time (&current_localtime, "%T")
              << "." << std::setw (3) << std::setfill ('0') << current_milliseconds
              << "] ";
    }

    void fillThreadID() {
        *this << "(" << std::this_thread::get_id() << ") ";
    }

};

// log macro
#define LOG(...) { mtcout{} << __VA_ARGS__; }

#endif // MTCOUT_H
