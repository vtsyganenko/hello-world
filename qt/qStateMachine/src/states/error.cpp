#include "error.h"

#include <iostream>

Error::Error(Communication &c, QState *parent)
  : BaseState(StateId::ERROR, c, parent)
{

}

void Error::onEntry(QEvent *event)
{
  BaseState::onEntry(event);

  std::cout << "Error on entry" << std::endl;

  connect(&communication_, SIGNAL(command_2()), SLOT(onCommand2()));
}

void Error::onExit(QEvent *event)
{
  BaseState::onExit(event);

  communication_.disconnect(this);
}

void Error::onCommand2()
{
  emit goToWait();
}
