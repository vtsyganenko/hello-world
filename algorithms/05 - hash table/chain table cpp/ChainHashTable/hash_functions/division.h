#ifndef DIVISION_H
#define DIVISION_H

#include "hash_interface.h"
#include "common.h"

#include <cassert>
#include <vector>

template <class T>
struct DivisionHash : public HashInterface<T>
{
    explicit DivisionHash(std::size_t tableSize)
        : HashInterface<T>(tableSize), M_(tableSize)
    {
        static_assert(std::is_integral<T>::value, "DivisionHash: key type shall be integral!");

        updateTableSize(tableSize);

        std::cout << "DivisionHash: M = " << M_ << std::endl;
    }

    std::size_t operator()(const T& key) override
    {
        std::cout << "call DivisionHash with " << key << std::endl;

        std::size_t hash = key % M_;

        std::cout << "hash is " << hash << std::endl;
        assert(hash < this->tableSize_);
        return hash;
    }

    void updateTableSize(std::size_t newSize)
    {
        std::cout << "Division hash: updateTableSize " << newSize << std::endl;

        std::size_t max = 1;                // ofset from table size
        std::vector<std::size_t> primes;
        this->tableSize_ = newSize;

        // find a 'max' of prime numbers
        while(newSize--)
        {
            if(isPrimeNumber(newSize)) {
                primes.push_back(newSize);
                if(primes.size() >= max)
                    break;
            }
        }

        for(auto k : primes)
            std::cout << k << " ";
        std::cout << std::endl;

        if(!primes.empty())
            M_ = primes.back();

        std::cout << "chosen M is " << M_ << std::endl;
    }

private:
    unsigned int M_;    // constant for division
};

#endif // DIVISION_H
