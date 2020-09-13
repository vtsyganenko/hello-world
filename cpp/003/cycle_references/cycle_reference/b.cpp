#include "b.h"

#include "a.h"

#include <iostream>

B::B(int value) : value_(value)
{
}

B::~B()
{
    std::cout << "~B()" << std::endl;
}

void B::init(std::shared_ptr<A> a)
{
    ptrA_ = a;
}

void B::method()
{
    std::cout << "B::method value is " << value_ << std::endl;
    callA();
}

void B::callA()
{
    if(auto a = ptrA_.lock())
    {
        std::cout << "B::callA ok" << std::endl;
        a->method();
    }
    else
    {
        std::cout << "B::callA no ptr!" << std::endl;
    }
}
