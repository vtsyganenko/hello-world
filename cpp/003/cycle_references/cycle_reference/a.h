#ifndef A_H
#define A_H

#include <memory>

class B;
class C;

class A : public std::enable_shared_from_this<A>
{
public:
    A();
    ~A();
    void init();

    void callB();   // let B call us
    void method();  // called from B or C

    void setC(std::shared_ptr<C> c);
    void callC();   // let C call us

private:
    std::shared_ptr<B> ptrB_;
    std::weak_ptr<C> ptrC_;
};

#endif // A_H
