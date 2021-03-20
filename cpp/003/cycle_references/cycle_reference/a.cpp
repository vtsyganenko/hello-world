#include "a.h"

#include "b.h"
#include "c.h"

#include <iostream>

A::A()
{
    ptrB_ = std::make_shared<B>(10);
    // no shared_from_this in constructor!
}

A::~A()
{
    std::cout << "~A()" << std::endl;
}

void A::init()
{
    ptrB_->init(shared_from_this());
}

void A::callB()
{
    std::cout << "A::callB" << std::endl;
    ptrB_->method();
}

void A::method()
{
    std::cout << "A::method" << std::endl;
}

void A::setC(std::shared_ptr<C> c)
{
    ptrC_ = c;
}

void A::callC()
{
    if(auto c = ptrC_.lock())
    {
        std::cout << "A::callC ok" << std::endl;
        c->method();
    }
    else
    {
        std::cout << "A::callC no ptr!" << std::endl;
    }
}
