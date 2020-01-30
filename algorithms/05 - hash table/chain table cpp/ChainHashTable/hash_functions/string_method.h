#ifndef STRING_METHOD_H
#define STRING_METHOD_H

#include <iostream>

#include "multiplication.h"

#include <cassert>      // assert
#include <cstring>      // strlen
#include <cmath>        // pow

template <class T>
struct StringMethodHashVol1 : public HashInterface<T>
{
    explicit StringMethodHashVol1(std::size_t tableSize)
        : HashInterface<T>(tableSize), mult_hash_(tableSize)
    {
        static_assert(std::is_same<T, const char*>::value,
                      "StringMethodHashVol1: key type shall be const char*!");
    }

    std::size_t operator()(const T& key_str) override
    {
        std::cout << "call Hash StringMethodHashVol1 with "
                  << key_str << std::endl;

        auto key_int = convertStringKeyToInt(key_str);




        std::cout << "key int " << key_int << std::endl;
        // last 8 can be only 0 so it gives null hash
        // take first 8
        key_int >>= 32;
        std::cout << "key processed " << key_int << std::endl;

        std::size_t hash = mult_hash_(key_int);
        std::cout << "hash after mult " << hash << std::endl;
        return hash;
    }

    void updateTableSize(std::size_t newSize)
    {
        std::cout << "StringMethodHashVol1::updateTableSize " << newSize << std::endl;
        mult_hash_.updateTableSize(newSize);
    }

private: // Vol 1 gives 0 hash!
    MultiplicationHashVol1<unsigned long long> mult_hash_;

    unsigned long long convertStringKeyToInt(const char* key_str)
    {
        std::cout << "convertStringKeyToInt " << key_str << std::endl;

        auto extent = strlen(key_str) - 1;
        unsigned int base = 128;
        //std::size_t key = 0;
        unsigned long long key = 0;
        while(*key_str)
        {
            key += *key_str * std::pow(base, extent--);
            key_str++;
        }

        std::cout << "ret " << key << std::endl;

        return key;
    }
};
/*
struct StringMethodHashVol2
{
    explicit StringMethodHashVol2(std::size_t tableSize)
        : tableSize_(tableSize)
    {
    }

    unsigned long long convertStringKeyToInt(const char* s)
    {
        const unsigned int p = 53;
        long long key = 0, p_pow = 1;
        auto len = strlen(s);
        for(std::size_t i=0; i<len; ++i)
        {
            key += (s[i] - 'a' + 1) * p_pow;
            p_pow *= p;

            std::cout << "key = " << key << " p = " << p_pow << std::endl;
        }

        return key;
    }

    std::size_t calc(const char* key_str)
    {
        std::size_t hash = 0;

        hash = static_cast<std::size_t>(convertStringKeyToInt(key_str));

        assert(hash < tableSize_);
        return hash;
    }

private:
    std::size_t tableSize_;
};
*/
#endif // STRING_METHOD_H
