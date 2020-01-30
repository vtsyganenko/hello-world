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
        std::cout << "template hash with " << value << std::endl;
        return 0;
    }
};

//---------------------------------------------------------------------
/*
template <>
struct Hash<int> : public MultiplicationHashVol1
{
    explicit Hash(std::size_t tableSize): MultiplicationHashVol1(tableSize) {}

    std::size_t operator()(const int& key){
        return calc(key);
    }
};
*/

template <>
struct DefaultHash<unsigned int> : public MultiplicationHashVol1<unsigned int>
{
    explicit DefaultHash(std::size_t tableSize)
        : MultiplicationHashVol1<unsigned int>(tableSize) {}
};

/*
template <>
struct DefaultHash<unsigned int> : public MultiplicationHashVol2
{
    explicit DefaultHash(std::size_t tableSize): MultiplicationHashVol2(tableSize) {}

    std::size_t operator()(const unsigned int& key){
        return calc(key);
    }

    void updateTableSize(std::size_t newSize)
    {
        updateTableSize1(newSize);
    }
};
*/

template <>
struct DefaultHash<const char*> : public StringMethodHashVol1<const char*>
{
    explicit DefaultHash(std::size_t tableSize)
        : StringMethodHashVol1<const char*>(tableSize) {}
};

#endif // HASH_H
