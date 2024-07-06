#include "myclass.h"

#include <iostream>

int main(int argc, const char* argv[]) {
    std::cout << "default object: " << MyClass() << std::endl;

    std::cout << "object with 10: " << MyClass(10) << std::endl;
    std::cout << std::endl;

    std::cout << "copy ctor:" << std::endl;
    MyClass a(10);
    std::cout << "created a: " << a << std::endl;
    MyClass b(a);
    std::cout << "created b(a): " << b << std::endl;
    std::cout << "a after creation: " << a << std::endl;
    std::cout << std::endl;

    std::cout << "move ctor:" << std::endl;
    MyClass c(10);
    std::cout << "created c: " << c << std::endl;
    MyClass d(std::move(c));
    std::cout << "created d(move(c)): " << d << std::endl;
    std::cout << "c after creation: " << c << std::endl;
    std::cout << std::endl;

    std::cout << "assignment operator:" << std::endl;
    MyClass e(5);
    std::cout << "created e: " << e << std::endl;
    MyClass f;
    f = e;
    std::cout << "f = e, f: " << f << " e: " << e << std::endl;
    std::cout << std::endl;

    std::cout << "move assignment operator:" << std::endl;
    MyClass g(6);
    std::cout << "created g: " << g << std::endl;
    MyClass h;
    h = std::move(g);
    std::cout << "h = move(g), h: " << h << " g: " << g << std::endl;

    return 0;
}
