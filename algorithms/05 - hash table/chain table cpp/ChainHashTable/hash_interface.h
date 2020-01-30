#ifndef HASH_INTERFACE_H
#define HASH_INTERFACE_H

#include <cstdlib>

template <class T>
struct HashInterface
{
    explicit HashInterface(std::size_t tableSize)
        : tableSize_(tableSize)
    {
    }

    // shall return calculated hash(key)
    virtual std::size_t operator()(const T& key) = 0;

    void updateTableSize(std::size_t newSize)
    {
        tableSize_ = newSize;
    }

protected:
    std::size_t tableSize_;     // size of hash table array
};

#endif // HASH_INTERFACE_H
