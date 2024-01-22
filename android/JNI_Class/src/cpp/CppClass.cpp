#include "CppClass.h"

#include <iostream>

CppClass::CppClass() {
    std::cout << "CppClass::CppClass()" << std::endl;
}

CppClass::CppClass(int x, int y) : _x(x), _y(y) {
    std::cout << "CppClass::CppClass(" << x << ", " << y << ")" << std::endl;
}

void CppClass::setX(int x) {
    std::cout << "CppClass::setX(" << x << ")" << std::endl;
    _x = x;
}

void CppClass::setY(int y) {
    std::cout << "CppClass::setY(" << y << ")" << std::endl;
    _y = y;
}

int CppClass::sum() {
    std::cout << "CppClass::sum()" << std::endl;
    return _x + _y;
}
