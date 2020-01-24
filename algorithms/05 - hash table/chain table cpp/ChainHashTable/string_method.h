#ifndef STRING_METHOD_H
#define STRING_METHOD_H

#include <iostream>

#include "exceptions.h"
#include <cstring>
#include <cmath>        // pow

struct StringMethodHashVol1
{
    explicit StringMethodHashVol1(std::size_t tableSize)
    {

    }

    std::size_t convertStringKeyToNumber(const char* str)
    {
        auto length = strlen(str);

        std::cout << "str is [" << str << "]" << ", length = " << length << std::endl;

        auto extent = length - 1;
        unsigned int base = 128;

        unsigned int h = 0;
        while(*str)
        {
            std::cout << "step: " << *str << " (" << +(*str) << ") "
                      << "extent = " << extent
                      << std::endl;

            h += *str * std::pow(base, extent--);
            str++;
        }

        return h;
    }


    template<typename T>
    std::size_t calc(T key) noexcept(false) // throw incorrect_key_type_exception
    {
        //if(std::is_integral<T>::value == false)
        //    throw incorrect_key_type_exception();

        /*
        std::cout << "call Hash MultiplicationHashVol1 with " << key << std::endl;

        std::size_t hash = 0;
        switch (indexType_) {
            case IndexType::TYPE_8:
                hash = static_cast<unsigned char>(coefficient_ * key) >> shift_;
                break;
            case IndexType::TYPE_16:
                hash = static_cast<unsigned short>(coefficient_ * key) >> shift_;
                break;
            case IndexType::TYPE_32:
                hash = static_cast<unsigned int>(coefficient_ * key) >> shift_;
                break;
        };

        std::cout << "hash is " << hash << std::endl;
        assert(hash < tableSize_);
        return hash;
        */
        return 0;
    }
};

#endif // STRING_METHOD_H
