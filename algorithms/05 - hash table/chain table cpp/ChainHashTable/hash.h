#ifndef HASH_H
#define HASH_H

#include <iostream>

#include "hash_interface.h"

#include "division.h"
#include "multiplication.h"
#include "string_method.h"

template <class T>
struct DefaultHash : public HashInterface<T>
{
    std::size_t operator()(const T& value)
    {
        (void)value;
        std::cout << "Hash is undefined!" << std::endl;
        return 0;
    }
};

//---------------------------------------------------------------------

template <>
struct DefaultHash<unsigned int> : public MultiplicationHashVol1<unsigned int>
{
    explicit DefaultHash(std::size_t tableSize)
        : MultiplicationHashVol1<unsigned int>(tableSize) {}
};

template <>
struct DefaultHash<const char*> : public StringMethodHashVol1<const char*>
{
    explicit DefaultHash(std::size_t tableSize)
        : StringMethodHashVol1<const char*>(tableSize) {}
};

template <>
struct DefaultHash<std::string> : public StringMethodHashVol2<std::string>
{
    explicit DefaultHash(std::size_t tableSize)
        : StringMethodHashVol2<std::string>(tableSize) {}
};

#endif // HASH_H
