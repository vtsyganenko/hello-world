#ifndef B_H
#define B_H

#include <memory>

class A;

class B
{
public:
    explicit B(int value);
    ~B();
    void init(std::shared_ptr<A> a);

    void method();  // called from A

private:
    std::weak_ptr<A> ptrA_;
    int value_;

    void callA();
};

#endif // B_H
