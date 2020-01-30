#ifndef MULTIPLICATION_H
#define MULTIPLICATION_H

#include <iostream>

#include "hash_interface.h"

#include <cassert>      // assert
#include <limits>       // numeric_limits & CHAR_BIT
#include <cmath>        // log2, pow
#include <type_traits>  // is_integral


struct MultiplicationHashVol1
{
    explicit MultiplicationHashVol1(std::size_t tableSize)
        : indexType_(IndexType::TYPE_8), tableSize_(tableSize)
    {
        std::cout << "MultiplicationHashVol1 ctor" << std::endl;
        updateTableSize(tableSize);
    }

    void updateTableSize(std::size_t tableSize)
    {
        std::cout << "updateTableSize: size = " << tableSize << std::endl;

        auto bitwidth = determineBitWidth(tableSize);
        std::cout << "bitwidth = " << bitwidth << std::endl;

        auto extent = static_cast<std::size_t>(std::log2(tableSize));
        std::cout << "n = " << extent << std::endl;

        double gold = (std::sqrt(5) - 1) / 2;
        coefficient_ = std::pow(2, bitwidth) * gold;
        std::cout << "K = " << coefficient_ << std::endl;

        shift_ = bitwidth - extent;
        std::cout << "shift = " << shift_ << std::endl;
    }

    template<typename T>
    std::size_t calc(T key) noexcept(false) // throw incorrect_key_type_exception
    {
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
    }

private:
    enum class IndexType { TYPE_8, TYPE_16, TYPE_32 };
    IndexType indexType_;

    std::size_t tableSize_;
    double coefficient_;
    std::size_t shift_;

    std::size_t determineBitWidth(std::size_t tableSize)
    {
        std::cout << "determine index bitwidth by table size " << tableSize << std::endl;

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

    std::size_t operator()(const T& key) /*noexcept(false)*/ override // throw incorrect_key_type_exception
    {
        std::size_t hash = static_cast<std::size_t>(
                    std::floor(this->tableSize_ * std::fmod(key * A_, 1)));

        std::cout << "call MultiplicationHashVol2() with key " << key
                  << " hash is " << hash << std::endl;

        assert(hash < this->tableSize_);
        return hash;
    }

private:
    double A_;                  // constant based on gold ratio
};

#endif // MULTIPLICATION_H
