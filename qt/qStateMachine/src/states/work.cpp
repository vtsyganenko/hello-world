#include "work.h"

#include <iostream>

Work::Work(Communication &c, QState *parent)
  : BaseState(StateId::WORK, c, parent)
{

}

void Work::onEntry(QEvent *event)
{
  BaseState::onEntry(event);

  std::cout << "Work on entry" << std::endl;

  connect(&communication_, SIGNAL(command_2()), SLOT(onCommand2()));
  connect(&communication_, SIGNAL(command_3()), SLOT(onCommand3()));
}

void Work::onExit(QEvent *event)
{
  BaseState::onExit(event);

  communication_.disconnect(this);
}

void Work::onCommand2()
{
  emit goToStopping();
}

void Work::onCommand3()
{
  emit goToError();
}

