#ifndef ERROR_H
#define ERROR_H

#include "basestate.h"

class Error : public BaseState
{
  Q_OBJECT

public:
  explicit Error(Communication& c,
                 QState* parent = nullptr);

signals:
  void goToWait();

protected:
  void onEntry(QEvent* event);
  void onExit(QEvent *event);

private slots:
  void onCommand2();

};

#endif // ERROR_H
