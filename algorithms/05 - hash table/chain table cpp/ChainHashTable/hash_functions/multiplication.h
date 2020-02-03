#ifndef MULTIPLICATION_H
#define MULTIPLICATION_H

#include <iostream>
#include <bitset>

#include "hash_interface.h"

#include <cassert>      // assert
#include <limits>       // numeric_limits & CHAR_BIT
#include <cmath>        // log2, pow
#include <type_traits>  // is_integral

template <class T>
struct MultiplicationHashVol1 : public HashInterface<T>
{
    explicit MultiplicationHashVol1(std::size_t tableSize)
        : HashInterface<T>(tableSize), indexType_(IndexType::TYPE_8)
    {
        static_assert(std::is_integral<T>::value,
                      "MultiplicationHashVol1: key type shall be integral!");
        updateTableSize(tableSize);
    }

    void updateTableSize(std::size_t tableSize)
    {
        auto bitwidth = determineBitWidth(tableSize);

        auto extent = static_cast<std::size_t>(std::log2(tableSize));

        double gold = (std::sqrt(5) - 1) / 2;
        coefficient_ = std::pow(2, bitwidth) * gold;

        shift_ = bitwidth - extent;

        this->tableSize_ = tableSize;
        std::cout << "MultiplicationHashVol1::updateTableSize with " << tableSize
                  << std::endl
                  << "bitwidht(" << bitwidth << ") n(" << extent
                  << ") coef(" << coefficient_ << ") shift(" << shift_
                  << ")" << std::endl;
    }

    std::size_t operator()(const T& key) override
    {
        std::cout << "MultiplicationHashVol1 " << key << std::endl;

        std::size_t hash = 0;
        switch (indexType_) {
            case IndexType::TYPE_8:
                {
                /*
                auto v = coefficient_ * key;
                std::bitset<32> bs1(v);
                unsigned char x = static_cast<unsigned char>(v);
                std::bitset<8> bs2(x);
                auto res = x >> shift_;
                std::bitset<8> bs3(res);
                std::cout << "calc hash with type8: coef is (" << coefficient_ << ") "
                          << "key*coef = " << v << " " << bs1 << " "
                          << "casted = " << +x << " " << bs2 << " "
                          << "after shift to " << shift_ << " = " << +res << " "
                          << bs3 << std::endl;
                */
                hash = static_cast<unsigned char>(coefficient_ * key) >> shift_;
                }
                break;
            case IndexType::TYPE_16:
                hash = static_cast<unsigned short>(coefficient_ * key) >> shift_;
                break;
            case IndexType::TYPE_32:
                hash = static_cast<unsigned int>(coefficient_ * key) >> shift_;
                break;
        };

        std::cout << "hash is " << hash << std::endl;
        assert(hash < this->tableSize_);
        return hash;
    }

private:
    enum class IndexType { TYPE_8, TYPE_16, TYPE_32 };
    IndexType indexType_;

    double coefficient_;
    std::size_t shift_;

    std::size_t determineBitWidth(std::size_t tableSize)
    {
        // table size 256 means that index change from 0 to 255 i.e. 255 values
        unsigned int count_of_8_bit_indexes = std::numeric_limits<unsigned char>::max() + 1;
        unsigned int count_of_16_bit_indexes = std::numeric_limits<unsigned short>::max() + 1;

        if(tableSize <= count_of_8_bit_indexes)
        {
            indexType_ = IndexType::TYPE_8;
            return sizeof(unsigned char) * CHAR_BIT;    // 8
        }
        else if(tableSize <= count_of_16_bit_indexes)
        {
            indexType_ = IndexType::TYPE_16;
            return sizeof(unsigned short) * CHAR_BIT;   // 16
        }
        else
        {
            indexType_ = IndexType::TYPE_32;
            return sizeof(unsigned int) * CHAR_BIT;     // 32
        }
    }
};

//-----------------------------------------------------------------------------------------

template <class T>
struct MultiplicationHashVol2 : public HashInterface<T>
{
    explicit MultiplicationHashVol2(std::size_t tableSize)
        : HashInterface<T>(tableSize)
    {
        static_assert(std::is_integral<T>::value,
                      "MultiplicationHashVol2: key type shall be integral!");
        A_ = (std::sqrt(5) - 1) / 2;
    }

    std::size_t operator()(const T& key) override
    {
        std::cout << "MultiplicationHashVol2 with " << key << std::endl;

        // very big key can provide that fractional part does not fit
        // => std::fmod(key_d * A_, 1) may be 0 or 0.5
        // => hash will be 0 or tableSize/2
        // so we cut key
        long double key_d = static_cast<uint32_t>(key);
        std::cout << "mult res = " << this->tableSize_ * std::fmod(key_d * A_, 1) << std::endl;

        std::size_t hash = static_cast<std::size_t>(
                    std::floor(this->tableSize_ * std::fmod(key_d * A_, 1)));

        std::cout << "hash is " << hash << std::endl;
        assert(hash < this->tableSize_);
        return hash;
    }

    void updateTableSize(std::size_t tableSize)
    {
        this->tableSize_ = tableSize;
    }

private:
    long double A_;                  // constant based on gold ratio
};

#endif // MULTIPLICATION_H
