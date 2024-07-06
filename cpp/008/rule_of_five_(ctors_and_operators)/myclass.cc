#include "myclass.h"

#include <iostream>

MyClass::MyClass() {
}

MyClass::MyClass(uint32_t value): mValue(value) {
    mPtr = new uint32_t[mValue];
    for(uint32_t i=0; i<mValue; ++i) {
        mPtr[i] = mValue;
    }
}

MyClass::MyClass(const MyClass& other) {
    mValue = other.mValue;
    mPtr = new uint32_t[mValue];
    for(uint32_t i=0; i<mValue; ++i) {
        mPtr[i] = other.mPtr[i];
    }
}

MyClass::MyClass(MyClass&& other) {
    mValue = other.mValue;
    mPtr = other.mPtr;
    other.mValue = 0;
    other.mPtr = nullptr;
}

MyClass& MyClass::operator = (const MyClass& other) {
    if(this != &other) {
        delete[] mPtr;

        mValue = other.mValue;
        mPtr = new uint32_t[mValue];
        for(uint32_t i=0; i<mValue; ++i) {
            mPtr[i] = other.mPtr[i];
        }
    }
    return *this;
}

MyClass& MyClass::operator = (MyClass&& other) {
    if(this != &other) {
        delete[] mPtr;

        mValue = other.mValue;
        mPtr = other.mPtr;
        other.mValue = 0;
        other.mPtr = nullptr;
    }
    return *this;
}

std::ostream& operator << (std::ostream& out, const MyClass& obj) {
    out << "[" << obj.mValue << "]: [";
    for(uint32_t i=0; i<obj.mValue; ++i) {
        out << obj.mPtr[i] << (i == obj.mValue - 1 ? "" : " ");
    }
    out << "]";
    return out;
}
