#ifndef WORK_H
#define WORK_H

#include "basestate.h"

class Work : public BaseState
{
  Q_OBJECT

public:
  explicit Work(Communication& c,
                QState* parent = nullptr);

signals:
  void goToStopping();
  void goToError();

protected:
  void onEntry(QEvent *event);
  void onExit(QEvent *event);

private slots:
  void onCommand2();
  void onCommand3();

};

#endif // WORK_H
