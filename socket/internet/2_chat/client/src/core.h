#ifndef CORE_H
#define CORE_H

#include <QObject>

#include "eventqueue.h"
#include "receiver.h"
#include "client.h"

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
    void sendMessage(const QString& msg);
    void stopWork();

private:
    QTimer* t_;

    EventQueue queue_;
    Receiver* r_;
    Client* mt_;


    //Client client_;

    std::condition_variable cv_;
    std::mutex m_;
    std::thread t1;
    std::thread t2;

    bool exit_flag_;

    void callback(const std::string& message);
};

#endif // CORE_H
