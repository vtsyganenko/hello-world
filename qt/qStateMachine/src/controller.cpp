#include "controller.h"

#include "wait.h"
#include "work.h"
#include "stopping.h"
#include "error.h"

#include <iostream>

Controller::Controller(Communication &c)
{
  Wait* wait = new Wait(c);
  Work* work = new Work(c);
  Stopping* stopping = new Stopping(c);
  Error* error = new Error(c);

  machine_.addState(wait);
  machine_.addState(work);
  machine_.addState(stopping);
  machine_.addState(error);

  wait->addTransition(wait, SIGNAL(goToWork()), work);

  work->addTransition(work, SIGNAL(goToStopping()), stopping);
  work->addTransition(work, SIGNAL(goToError()), error);

  stopping->addTransition(stopping, SIGNAL(goToWait()), wait);

  error->addTransition(error, SIGNAL(goToWait()), wait);

  machine_.setInitialState(wait);

  machine_.start();
}
