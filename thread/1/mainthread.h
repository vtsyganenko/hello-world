#ifndef MAINTHREAD_H
#define MAINTHREAD_H

#include <condition_variable>

class MessageQueue;

// "main" thread for test
// once in 2 seconds pushed string to queue
class MainThread
{
public:
    MainThread(MessageQueue* q,
               std::condition_variable& cv,
               bool& exit);

    void operator() ();

private:
    MessageQueue* queue_;
    std::condition_variable& cv_;
    int counter_;
    bool& exit_;
};

#endif // MAINTHREAD_H
