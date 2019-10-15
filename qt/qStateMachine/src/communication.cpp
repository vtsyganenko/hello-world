#include "communication.h"

#include <iostream>

Communication::Communication(QObject *parent) : QObject(parent)
{
}

Communication::~Communication()
{
  t_.join();
  std::cout << "~Communication()" << std::endl;
}

void Communication::start()
{
  std::cout << "Press 1,2,3,4 for command or q for exit:" << std::endl;

  auto l = [this]()
  {
    while(1)
    {
      std::string input;
      std::cin >> input;
      int res = 0;

      if(input == "q")
      {
        break;
      }

      try
      {
        res = std::stoi(input);
      }
      catch(std::exception& e)
      {
        std::cout << "wrong input!" << std::endl;
        continue;
      }

      switch(res)
      {
      case 1:
        emit command_1();
        break;
      case 2:
        emit command_2();
        break;
      case 3:
        emit command_3();
        break;
      case 4:
        emit command_4();
        break;
      default:
        std::cout << "wrong command!" << std::endl;
        break;
      };

    }
    std::cout << "thread end" << std::endl;
    emit exit();
  };

  t_ = std::thread(l);
}

