#include "basestate.h"

#include <iostream>

BaseState::BaseState(StateId id, Communication &comm, QState* parent)
  : id_(id), communication_(comm)
{

}

void BaseState::onEntry(QEvent *event)
{
  std::cout << "BaseState: entry " << StateToString(id_) << std::endl;
}

void BaseState::onExit(QEvent *event)
{
  std::cout << "BaseState: exit " << StateToString(id_) << std::endl;
}

std::__cxx11::string BaseState::StateToString(StateId id)
{
  std::string res;
  switch(id)
  {
  case StateId::WAIT:
    res = "WAIT";
    break;
  case StateId::WORK:
    res = "WORK";
    break;
  case StateId::ERROR:
    res = "ERROR";
    break;
  case StateId::STOPPING:
    res = "STOPPING";
    break;
  default:
    break;
  };
  return res;
}
