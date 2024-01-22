#include "CppClass.h"

#include <iostream>

int main(int argc, const char* argv[]) {
    std::cout << "test for CppClass!" << std::endl;

    std::cout << "create CppClass()" << std::endl;
    CppClass obj1;
    int sum = obj1.sum();
    std::cout << "sum() is " << sum << std::endl;
    std::cout << "set x=1 y=2" << std::endl;
    obj1.setX(1);
    obj1.setY(2);
    sum = obj1.sum();
    std::cout << "sum() is " << sum << std::endl;

    std::cout << "create CppClass(10, 20)" << std::endl;
    CppClass obj2(10, 20);
    sum = obj2.sum();
    std::cout << "sum() is " << sum << std::endl;
    std::cout << "set x=100 y=200" << std::endl;
    obj2.setX(100);
    obj2.setY(200);
    sum = obj2.sum();
    std::cout << "sum() is " << sum << std::endl;

    return 0;
}
