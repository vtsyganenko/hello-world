#ifndef STOPPING_H
#define STOPPING_H

#include "basestate.h"

class Stopping : public BaseState
{
  Q_OBJECT

public:
  explicit Stopping(Communication& c,
                    QState* parent = nullptr);

signals:
  void goToWait();

protected:
  void onEntry(QEvent* event);
  void onExit(QEvent *event);

  void timerEvent(QTimerEvent *event);

private:
  int timerId_ = 0;

};

#endif // STOPPING_H
