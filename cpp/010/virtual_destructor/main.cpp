#include <iostream>

class Base1 {
public:
    ~Base1() { std::cout << "~Base1()" << std::endl; }
};

class Derived1: public Base1 {
public:
    ~Derived1() { std::cout << "~Derived1()" << std::endl; }
};

class Base2 {
public:
    virtual ~Base2() { std::cout << "~Base2()" << std::endl; }
};

class Derived2: public Base2 {
public:
    virtual ~Derived2() { std::cout << "~Derived2()" << std::endl; }
};

int main(int argc, const char* argv[]) {

    std::cout << "sizeof(Base1) " << sizeof(Base1) << " sizeof(Derived1) " << sizeof(Derived1) << std::endl;

    Base1* b1 = new Base1();
    delete b1;
    std::cout << std::endl;

    Derived1* d1 = new Derived1();
    delete d1;
    std::cout << std::endl;

    Base1* e1 = new Derived1();
    delete e1;                      // only ~Base1() !
    std::cout << std::endl;

    std::cout << "sizeof(Base2) " << sizeof(Base2) << " sizeof(Derived2) " << sizeof(Derived2) << std::endl;

    Base2* b2 = new Base2();
    delete b2;
    std::cout << std::endl;

    Derived2* d2 = new Derived2();
    delete d2;
    std::cout << std::endl;

    Base2* e2 = new Derived2();
    delete e2;                      // both destructors
    std::cout << std::endl;

    return 0;
}
