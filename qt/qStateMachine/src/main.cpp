#include <QCoreApplication>

#include "communication.h"

#include "controller.h"

#include <iostream>

int main(int argc, char *argv[])
{
  QCoreApplication a(argc, argv);

  Communication comm;
  comm.start();

  Controller c(comm);

  QObject::connect(&comm, SIGNAL(exit()), &a, SLOT(quit()));

  return a.exec();
}

