#ifndef HASH_H
#define HASH_H

#include <iostream>

#include "division.h"
#include "multiplication.h"
#include "string_method.h"

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

    std::size_t operator()(const int& key){
        return calc(key);
    }
};

template <>
struct Hash<unsigned int> : public MultiplicationHashVol2
{
    explicit Hash(std::size_t tableSize): MultiplicationHashVol2(tableSize) {}

    std::size_t operator()(const unsigned int& key){
        return calc(key);
    }

    void updateTableSize(std::size_t newSize)
    {
        updateTableSize1(newSize);
    }
};

template <>
struct Hash<const char*> : public StringMethodHashVol2
{
    explicit Hash(std::size_t tableSize): StringMethodHashVol2(tableSize) {}

    std::size_t operator()(const char* key){
        return calc(key);
    }
};

template <>
struct Hash<std::string> : public StringMethodHashVol1
{
    explicit Hash(std::size_t tableSize): StringMethodHashVol1(tableSize) {}

    std::size_t operator()(const std::string& key){
        return calc(key.c_str());
    }
};

#endif // HASH_H
