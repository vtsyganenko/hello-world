#include "c.h"

#include "a.h"

#include <iostream>

C::C()
{
}

C::~C()
{
    std::cout << "~C()" << std::endl;
}

void C::setA(std::shared_ptr<A> a)
{
    ptrA_ = a;
}

void C::callA()
{
    if(auto a = ptrA_.lock())
    {
        std::cout << "C::callA ok" << std::endl;
        a->method();
    }
    else
    {
        std::cout << "C::callA no ptr!" << std::endl;
    }
}

void C::method()
{
    std::cout << "C::method" << std::endl;
}
