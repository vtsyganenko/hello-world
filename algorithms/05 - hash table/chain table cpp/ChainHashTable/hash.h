#ifndef HASH_H
#define HASH_H

#include <iostream>

#include <cassert>  // assert
#include <limits>   // numeric_limits & CHAR_BIT
#include <cmath>    // log2

template <class T>
struct Hash
{
    std::size_t operator()(const T& value)
    {
        std::cout << "template hash with " << value << std::endl;
        return 0;
    }
};

template <>
struct Hash<int>
{
    explicit Hash(std::size_t tableSize)
        : tableSize_(tableSize)
    {
        std::cout << "Hash - int specialization" << std::endl;
        updateTableSize(tableSize);
    }

    void updateTableSize(std::size_t tableSize)
    {
        std::cout << "size = " << tableSize << std::endl;

        auto bitwidth = determineBitWidth(tableSize);
        std::cout << "bitwidth = " << bitwidth << std::endl;

        auto extent = static_cast<std::size_t>(std::log2(tableSize));
        std::cout << "n = " << extent << std::endl;

        double gold = (std::sqrt(5) - 1) / 2;
        std::cout << "gold = " << gold << std::endl;
        coef_ = std::pow(2, bitwidth) * gold;
        std::cout << "K = " << coef_ << std::endl;

        shift_ = 16 /*bitwidth*/ - extent; // ?
        std::cout << "shift = " << shift_ << std::endl;
    }

    std::size_t operator()(const int& value)
    {
        std::cout << "call Hash (int) with " << value << std::endl;

        std::size_t res = static_cast<std::size_t>(coef_ * value) >> shift_;
        std::cout << "res is " << res << std::endl;

        assert(res < tableSize_);
        return res;
    }

private:
    std::size_t tableSize_;
    std::size_t coef_;
    std::size_t shift_;

    std::size_t determineBitWidth(std::size_t size)
    {
        std::cout << "determint bitwidth by size " << size << std::endl;
        //std::cout << CHAR_BIT << std::endl;
        //std::cout << "max is " << +std::numeric_limits<unsigned char>::max() << std::endl;

        auto count_of_8_bit = std::numeric_limits<unsigned char>::max() + 1;
        auto count_of_16_bit = std::numeric_limits<unsigned short int>::max() + 1;

        std::cout << count_of_8_bit << " " << count_of_16_bit << std::endl;

        if(size <= count_of_8_bit)
        {
            std::cout << "res is 8" << std::endl;
            return sizeof(unsigned char) * CHAR_BIT;
        }
        else if(size <= count_of_16_bit)
        {
            std::cout << "res is 16" << std::endl;
            return sizeof(unsigned short int) * CHAR_BIT;
        }
        else
        {
            std::cout << "res is 32" << std::endl;
            return sizeof(unsigned int) * CHAR_BIT;
        }
    }
};

#endif // HASH_H
