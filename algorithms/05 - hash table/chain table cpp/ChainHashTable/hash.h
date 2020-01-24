#ifndef HASH_H
#define HASH_H

#include <iostream>

#include "multiplication.h"

template <class T>
struct Hash
{
    std::size_t operator()(const T& value)
    {
        std::cout << "template hash with " << value << std::endl;
        return 0;
    }
};

//---------------------------------------------------------------------

template <>
struct Hash<int> : public MultiplicationHashVol1
{
    explicit Hash(std::size_t tableSize): MultiplicationHashVol1(tableSize) {}

    std::size_t operator()(const int& value){
        return calc(value);
    }
};

template <>
struct Hash<unsigned int> : public MultiplicationHashVol1
{
    explicit Hash(std::size_t tableSize): MultiplicationHashVol1(tableSize) {}

    std::size_t operator()(const unsigned int& value){
        return calc(value);
    }
};

#endif // HASH_H
