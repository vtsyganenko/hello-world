#ifndef STRING_METHOD_H
#define STRING_METHOD_H

#include <iostream>

#include "multiplication.h"

#include <cassert>      // assert
#include <cstring>      // strlen
#include <cmath>        // pow

/*
 *
 *
 *
 *    std::string s("hello");
    const char* str = "ddfdsf";
    std::cout << std::boolalpha
              << std::is_same<decltype (str), std::string>::value << std::endl;
 *
*/
struct StringMethodHashVol1
{
    explicit StringMethodHashVol1(std::size_t tableSize)
        : mult_hash_(tableSize)
    {
    }

    unsigned long long convertStringKeyToInt(const char* key_str)
    {
        auto extent = strlen(key_str) - 1;
        unsigned int base = 128;
        std::size_t key = 0;
        while(*key_str)
        {
            key += *key_str * std::pow(base, extent--);
            key_str++;
        }

        return key;
    }

    std::size_t calc(const char* key_str)
    {
        auto key_int = convertStringKeyToInt(key_str);
        std::size_t hash = mult_hash_.calc(key_int);
        return hash;
    }

private:
    MultiplicationHashVol1 mult_hash_;
};

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

#endif // STRING_METHOD_H
