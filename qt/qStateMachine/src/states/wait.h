#ifndef WAIT_H
#define WAIT_H

#include "basestate.h"

class Wait : public BaseState
{
  Q_OBJECT

public:
  explicit Wait(Communication& c,
                QState* parent = nullptr);

signals:
  void goToWork();

protected:
  void onEntry(QEvent* event);
  void onExit(QEvent *event);

private slots:
  void onCommand1();
};

#endif // WAIT_H
