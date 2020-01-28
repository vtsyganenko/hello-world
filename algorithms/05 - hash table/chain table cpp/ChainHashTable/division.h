#ifndef DIVISION_H
#define DIVISION_H

#include <cassert>      // assert
#include <vector>

#include "common.h"
#include "exceptions.h"

struct DivisionHash
{
    explicit DivisionHash(std::size_t tableSize)
        : tableSize_(tableSize), M_(tableSize)
    {
        std::size_t max = 5;                // ofset from table size
        std::vector<std::size_t> primes;

        // find a 'max' of prime numbers
        while(tableSize--)
        {
            std::cout << "size is " << tableSize << std::endl;

            if(isPrimeNumber(tableSize))
            {
                primes.push_back(tableSize);
                if(primes.size() >= max)
                    break;
            }
        }

        for(auto k : primes)
            std::cout << k << " ";
        std::cout << std::endl;

        if(!primes.empty())
            M_ = primes.back();


        std::cout << "DivisionHash ctor" << std::endl;

        std::cout << "M = " << M_ << std::endl;
    }

    template<typename T>
    std::size_t calc(T key) noexcept(false) // throw incorrect_key_type_exception
    {
        if(std::is_integral<T>::value == false)
            throw incorrect_key_type_exception();

        std::cout << "call DivisionHash with " << key << std::endl;

        std::size_t hash = key % M_;

        std::cout << "hash is " << hash << std::endl;
        assert(hash < tableSize_);
        return hash;
    }

private:
    std::size_t tableSize_;
    unsigned int M_;    // constant for division
};

#endif // DIVISION_H
