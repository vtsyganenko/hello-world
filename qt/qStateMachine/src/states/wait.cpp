#include "wait.h"

#include <iostream>

Wait::Wait(Communication &c, QState *parent)
  : BaseState(StateId::WAIT, c, parent)
{

}

void Wait::onEntry(QEvent *event)
{
  BaseState::onEntry(event);

  std::cout << "Wait on entry" << std::endl;

  connect(&communication_, SIGNAL(command_1()), SLOT(onCommand1()));
}

void Wait::onExit(QEvent *event)
{
  BaseState::onExit(event);

  communication_.disconnect(this);
}

void Wait::onCommand1()
{
  emit goToWork();
}

