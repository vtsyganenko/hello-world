#include <iostream>

#include "a.h"
#include "c.h"

int main()
{
    // A <->--- B and A ---<> B

    auto sa = std::make_shared<A>();
    std::cout << "Call b from a before init:" << std::endl;
    sa->callB();
    sa->init();
    std::cout << "Call b from a after init:" << std::endl;
    sa->callB();
    std::cout << std::endl;

    // A <>--- C and A ---<> C

    auto sc = std::make_shared<C>();
    std::cout << "Call b from a before set:" << std::endl;
    sa->callC();
    sc->callA();

    sc->setA(sa);
    sa->setC(sc);

    std::cout << "Call b from a after set:" << std::endl;
    sa->callC();
    sc->callA();

    return 0;
}
