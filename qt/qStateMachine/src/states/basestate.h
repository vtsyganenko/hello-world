#ifndef BASESTATE_H
#define BASESTATE_H

#include <QState>

#include "communication.h"

enum StateId
{
  WAIT,
  WORK,
  ERROR,
  STOPPING
};

class BaseState : public QState
{
public:
  explicit BaseState(StateId id,
                     Communication& comm,
                     QState* parent = nullptr);

protected:
  StateId id_;
  Communication& communication_;


  void onEntry(QEvent* event);
  void onExit(QEvent* event);

private:
  std::string StateToString(StateId id);

};

#endif // BASESTATE_H
