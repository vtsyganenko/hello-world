#include "stopping.h"

#include <QTimerEvent>

#include <iostream>

Stopping::Stopping(Communication &c, QState *parent)
  : BaseState(StateId::STOPPING, c, parent)
{

}

void Stopping::onEntry(QEvent *event)
{
  BaseState::onEntry(event);

  std::cout << "Stopping on entry" << std::endl;

  timerId_ = startTimer(3000);
}

void Stopping::onExit(QEvent *event)
{
  BaseState::onExit(event);

  killTimer(timerId_);
}

void Stopping::timerEvent(QTimerEvent *event)
{
  if(event->timerId() == timerId_)
  {
    emit goToWait();
  }
}
