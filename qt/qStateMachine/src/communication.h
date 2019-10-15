#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <QObject>

#include <thread>

class Communication : public QObject
{
  Q_OBJECT
public:
  explicit Communication(QObject *parent = 0);
  ~Communication();

  void start();

signals:
  void command_1();
  void command_2();
  void command_3();
  void command_4();

  void exit();

private:
  std::thread t_;

};

#endif // COMMUNICATION_H
