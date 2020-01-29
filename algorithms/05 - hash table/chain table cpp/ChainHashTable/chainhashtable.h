#ifndef CHAINHASHTABLE_H
#define CHAINHASHTABLE_H

#include "hash.h"

#include <iostream>

#include <list>
#include <vector>
#include <deque>

// table scheme:
// array:
// Node* { list(Element) }
// nullptr
// Node* { list(Element) }

template <class Key, class Type, class HashFunc = Hash<Key>>
class ChainHashTable
{
public:
    ChainHashTable();
    ~ChainHashTable();

    void add(const Key& key, const Type& value);

    void print();

private:
    template <class KeyType, class ValueType>
    struct Element
    {
        KeyType     key;
        ValueType   value;

        //Element(KeyType k, ValueType v) : key(k), value(v) {}
    };

    template <class KeyType, class ValueType>
    struct Node
    {
        std::list< Element<KeyType, ValueType> > nodeChain;
    };
    std::vector< Node<Key, Type>* > array_;

    std::size_t tableSize_;
    std::size_t elementsCount_;
    HashFunc hash_;

    void increaseElementsCount();


    void checkFillFactorAndUpdateTable(double factor);
};

template <class Key, class Type, class HashFunc>
ChainHashTable<Key, Type, HashFunc>::ChainHashTable()
    : tableSize_(4), elementsCount_(0), hash_(HashFunc(tableSize_))
{
    // lets start hash table with size 128
    std::cout << "ChainHashTable ctor" << std::endl;
    array_.resize(tableSize_, nullptr);
}

template <class Key, class Type, class HashFunc>
ChainHashTable<Key, Type, HashFunc>::~ChainHashTable()
{
    for(auto i=0; i<array_.size(); ++i)
    {
        if(array_[i]) delete array_[i];
    }
}

template <class Key, class Type, class HashFunc>
void ChainHashTable<Key, Type, HashFunc>::add(const Key& key, const Type& value)
{
    std::cout << "add: key = " << key << " value = " << value << std::endl;

    std::size_t hash = hash_(key);
    std::cout << "add: hash = " << hash << std::endl;

    //if(hash < array_.size())
    //{
    //}

    if(array_[hash] == nullptr)
    {
        array_[hash] = new Node<Key, Type>;
    }
    //array_[hash]->nodeChain.push_back( Element<Key, Type>(key, value) );
    array_[hash]->nodeChain.push_back( {key, value} );

    increaseElementsCount();
}

template <class Key, class Type, class HashFunc>
void ChainHashTable<Key, Type, HashFunc>::print()
{
    for(std::size_t i=0; i<array_.size(); ++i)
    {
        if(array_[i]){
            std::cout << "hash [" << i << "] data [";
            for(const auto& elem : array_[i]->nodeChain)
            {
                std::cout << elem.key << ", " << elem.value << "; ";
            }
            std::cout << "]" << std::endl;
        }
    }
}

template <class Key, class Type, class HashFunc>
void ChainHashTable<Key, Type, HashFunc>::increaseElementsCount()
{
    elementsCount_++;
    double factor = double(elementsCount_) / double(tableSize_);
    std::cout << "elem count " << elementsCount_ << ", size " << tableSize_
              << " K = " << factor << std::endl;

    checkFillFactorAndUpdateTable(factor);
}



template <class Key, class Type, class HashFunc>
void ChainHashTable<Key, Type, HashFunc>::checkFillFactorAndUpdateTable(double factor)
{
    std::cout << "checkFillFactorAndUpdateTable with " << factor << std::endl;
    static double max_factor = 0.7;



    if(factor > max_factor)
    {
        std::cout << "before: " << std::endl;
        print();

        std::cout << "elements count " << elementsCount_ << std::endl;

        // create list of all elements
        std::vector< Element<Key, Type> > elements;
        elements.reserve(elementsCount_);
        std::cout << "elements size " << elements.size() << std::endl;

        for(std::size_t i=0; i<array_.size(); ++i)
        {
            if(array_[i]){
                for(const auto elem : array_[i]->nodeChain)
                {
                    elements.push_back(elem);
                }
            }
        }

        std::cout << "ELEMENTS:" << std::endl;
        for(const auto a : elements)
            std::cout << "[" << a.key << ", " << a.value << "] ";
        std::cout << std::endl;

        // clean data array
        array_.clear();
        tableSize_ *= 2;
        elementsCount_ = 0;
        array_.resize(tableSize_, nullptr);

        // NEED update a table size in hash object (for generation new hashes)
        hash_.updateTableSize(tableSize_);

        for(const auto& elem : elements)
        {
            this->add(elem.key, elem.value);
        }


        std::cout << std::endl << "after: " << std::endl;
        print();
    }

}

#endif // CHAINHASHTABLE_H
