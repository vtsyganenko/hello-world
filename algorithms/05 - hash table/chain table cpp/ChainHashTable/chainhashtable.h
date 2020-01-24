#ifndef CHAINHASHTABLE_H
#define CHAINHASHTABLE_H

#include "hash.h"


#include <iostream>
#include <list>
#include <vector>




template <class Key, class Type, class HashFunc = Hash<Key>>
class ChainHashTable
{
public:
    ChainHashTable();
    ~ChainHashTable();

    void add(const Key& key, const Type& value);

    void print();

private:
    template <class T>
    struct Node
    {
        std::list<T> chain;
    };
    std::vector< Node<Type>* > data_;

    std::size_t n_;
    HashFunc hash_;

};

template <class Key, class Type, class HashFunc>
ChainHashTable<Key, Type, HashFunc>::ChainHashTable()
    : n_(128), hash_(HashFunc(n_))
{
    // lets start hash table with size 128
    std::cout << "ChainHashTable ctor" << std::endl;
    data_.resize(n_, nullptr);
}

template <class Key, class Type, class HashFunc>
ChainHashTable<Key, Type, HashFunc>::~ChainHashTable()
{
    for(auto i=0; i<data_.size(); ++i)
    {
        if(data_[i]) delete data_[i];
    }
}

template <class Key, class Type, class HashFunc>
void ChainHashTable<Key, Type, HashFunc>::add(const Key& key, const Type& value)
{
    std::cout << "add: key = " << key << " value = " << value << std::endl;

    std::size_t hash = hash_(key);
    std::cout << "add: hash = " << hash << std::endl;

    if(data_[hash])
    {
        data_[hash]->chain.push_back(value);
    }
    else
    {
        data_[hash] = new Node<Type>;
        data_[hash]->chain.push_back(value);
    }

}

template <class Key, class Type, class HashFunc>
void ChainHashTable<Key, Type, HashFunc>::print()
{
    for(int i=0; i<data_.size(); ++i)
    {
        if(data_[i])
        {
            std::cout << "hash [" << i << "] value [";
            for(const auto& elem : data_[i]->chain)
            {
                std::cout << elem << "; ";
            }
            std::cout << "]" << std::endl;
        }
    }
}

#endif // CHAINHASHTABLE_H
