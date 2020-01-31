#ifndef STRING_METHOD_H
#define STRING_METHOD_H

#include "division.h"
#include "multiplication.h"

#include <cassert>      // assert
#include <cstring>      // strlen
#include <cmath>        // pow

template <class T>
struct StringMethodHashVol1 : public HashInterface<T>
{
    explicit StringMethodHashVol1(std::size_t tableSize)
        : HashInterface<T>(tableSize), div_hash_(tableSize)
    {
        const bool isCorrectType =
            (std::is_same<T, const char*>::value) || (std::is_same<T, std::string>::value);
        static_assert(isCorrectType, "StringMethodHashVol1: key type shall be text!");
    }

    std::size_t operator()(const T& key_str) override
    {
        std::cout << "StringMethodHashVol1 with [" << key_str << "]" << std::endl;

        auto key_int = convertStringKeyToInt(key_str);
        std::cout << "key int " << key_int << std::endl;

        std::size_t hash = div_hash_(key_int);
        std::cout << "hash after div " << hash << std::endl;
        return hash;
    }

    void updateTableSize(std::size_t newSize)
    {
        div_hash_.updateTableSize(newSize);
    }

private:
    DivisionHash<unsigned long long> div_hash_;

    unsigned long long convertStringKeyToInt(const char* key_str)
    {
        auto extent = strlen(key_str) - 1;
        unsigned int base = 128;
        unsigned long long key = 0;
        while(*key_str)
        {
            key += *key_str * std::pow(base, extent--);
            key_str++;
        }
        return key;
    }

    unsigned long long convertStringKeyToInt(const std::string& key_str)
    {
        return convertStringKeyToInt(key_str.c_str());
    }
};

template <class T>
struct StringMethodHashVol2 : public HashInterface<T>
{
    explicit StringMethodHashVol2(std::size_t tableSize)
        : HashInterface<T>(tableSize), mult_hash_(tableSize)
    {
        const bool isCorrectType =
            (std::is_same<T, const char*>::value) || (std::is_same<T, std::string>::value);
        static_assert(isCorrectType, "StringMethodHashVol1: key type shall be text!");
    }

    std::size_t operator()(const T& key_str) override
    {
        unsigned long long key_int = convertStringKeyToInt(key_str);
        std::cout << "StringMethodHashVol2 with [" << key_str << "] "
                  << "converted = " << key_int << std::endl;

        std::size_t hash = mult_hash_(key_int);
        std::cout << "hash = " << hash << std::endl;
        return hash;
    }

    void updateTableSize(std::size_t newSize)
    {
        mult_hash_.updateTableSize(newSize);
    }

private:
    MultiplicationHashVol2<unsigned long long> mult_hash_;

    unsigned long long convertStringKeyToInt(const char* s)
    {
        const unsigned int p = 53;
        unsigned long long key = 0, p_pow = 1;
        auto len = strlen(s);
        for(std::size_t i=0; i<len; ++i)
        {
            key += (s[i] - 'a' + 1) * p_pow;
            p_pow *= p;
        }
        return key;
    }

    unsigned long long convertStringKeyToInt(const std::string& key_str)
    {
        return convertStringKeyToInt(key_str.c_str());
    }
};

#endif // STRING_METHOD_H
