#ifndef MYCLASS_H
#define MYCLASS_H

#include <stdint.h>
#include <ostream>

class MyClass {
public:
    MyClass();
    MyClass(uint32_t value);

    MyClass(const MyClass& other);
    MyClass(MyClass&& other);

    MyClass& operator = (const MyClass& other);
    MyClass& operator = (MyClass&& other);

    friend std::ostream& operator << (std::ostream& out, const MyClass& obj);

private:
    uint32_t mValue = 0;
    uint32_t* mPtr = nullptr;
};

#endif // MYCLASS_H
