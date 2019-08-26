#ifndef CORE_H
#define CORE_H

#include <QObject>

#include "messagequeue.h"
#include "mainthread.h"

#include <thread>
#include <condition_variable>

class QTimer;

// qt wrapper for background work
class Core : public QObject
{
    Q_OBJECT
public:
    explicit Core(QObject *parent = nullptr);
    ~Core();

signals:
    void data(QString message);

public slots:
    void stopWork();

private:
    QTimer* t_;

    MessageQueue queue_;

    MainThread* mt_;

    std::condition_variable cv_;
    std::mutex m_;
    std::thread t1;
    std::thread t2;

    bool exit_flag_;

    void callback(const std::string& message);
};

#endif // CORE_H
