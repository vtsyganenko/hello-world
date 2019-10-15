#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QStateMachine>

#include "communication.h"

class Controller : public QObject
{
  Q_OBJECT

public:
  explicit Controller(Communication& c);

private:
  QStateMachine machine_;
};

#endif // CONTROLLER_H
