#include "myfixture.h"

#include <iostream>
#include <ctime>

MyFixture::MyFixture()
{
  std::cout << "MyFixture setup" << std::endl;
  value_ = 2.5;
}

MyFixture::~MyFixture()
{
  std::cout << "MyFixture teardown" << std::endl;
}

long int MyFixture::getCurrentTime()
{
  std::time_t result = std::time(nullptr);
  std::cout << "MyFixture::getCurrentTime() " << result << std::endl;
  return static_cast<long int>(result);
}
