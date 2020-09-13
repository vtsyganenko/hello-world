#ifndef C_H
#define C_H

#include <memory>

class A;

class C
{
public:
    C();
    ~C();
    void setA(std::shared_ptr<A> a);

    void callA();   // let A call us
    void method();  // called from A

private:
    std::weak_ptr<A> ptrA_;
};

#endif // C_H
