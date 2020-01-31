#ifndef CHAINHASHTABLE_H
#define CHAINHASHTABLE_H

#include "hash.h"

#include <iostream>

#include <list>
#include <vector>
#include <deque>
#include <algorithm>

// table scheme:
// array:
// [hash 0] - Node* { list(Element) }
// [hash 1] - nullptr
// [hash 2] - Node* { list(Element, Element) }
// [hash 3] - Node* { list(Element) }
// [hash 4] - nulptr
// ...

template <class Key, class Type, class HashFunc = DefaultHash<Key>>
class ChainHashTable
{
public:
    ChainHashTable();
    ~ChainHashTable();

    void add(const Key& key, const Type& value);

    std::pair<Key, Type> find(const Key& key);

    void print();

private:
    template <class KeyType, class ValueType>
    struct Element
    {
        KeyType     key;
        ValueType   value;
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
    void decreaseElementsCount();

    void checkFillFactorAndUpdateTable(double factor);
};

template <class Key, class Type, class HashFunc>
ChainHashTable<Key, Type, HashFunc>::ChainHashTable()
    : tableSize_(16), elementsCount_(0), hash_(HashFunc(tableSize_))
{
    // lets start hash table with size 16
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
    assert(hash < array_.size());

    if(array_[hash] == nullptr)
    {
        array_[hash] = new Node<Key, Type>;
    }
    array_[hash]->nodeChain.push_back( {key, value} );

    increaseElementsCount();
}

template <class Key, class Type, class HashFunc>
std::pair<Key, Type> ChainHashTable<Key, Type, HashFunc>::find(const Key& key)
{
    std::cout << "find: key = " << key << std::endl;
    std::pair<Key, Type> result;

    std::size_t hash = hash_(key);

    std::cout << " h = " << hash << std::endl;

    if(hash < array_.size())
    {
        if(array_[hash] == nullptr)
        {
            // no element

        }
        else
        {
            const auto& list = array_[hash]->nodeChain;
            auto it = std::find_if(list.begin(), list.end(),
                      [key](const Element<Key, Type>& elem)
            {
                return elem.key == key;
            });
            if(it != list.end())
            {
                result.first = (*it).key;
                result.second = (*it).value;
            }
            else
            {
                // not found

            }
        }
    }

    return result;
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
    std::cout << "increaseElementsCount table(" << tableSize_ << ") "
              << "elements(" << elementsCount_ << ") "
              << "factor(" << factor << ")" << std::endl;

    checkFillFactorAndUpdateTable(factor);
}

template <class Key, class Type, class HashFunc>
void ChainHashTable<Key, Type, HashFunc>::decreaseElementsCount()
{

}

template <class Key, class Type, class HashFunc>
void ChainHashTable<Key, Type, HashFunc>::checkFillFactorAndUpdateTable(double factor)
{
    static double max_factor = 0.7;

    if(factor > max_factor)
    {
        std::cout << "before: " << std::endl;
        print();

        // create list of all elements
        std::vector< Element<Key, Type> > elements;
        elements.reserve(elementsCount_);

        for(std::size_t i=0; i<array_.size(); ++i)
        {
            if(array_[i]){
                for(const auto elem : array_[i]->nodeChain)
                {
                    elements.push_back(elem);
                }
            }
        }

        //std::cout << "ELEMENTS:" << std::endl;
        //for(const auto a : elements)
        //    std::cout << "[" << a.key << ", " << a.value << "] ";
        //std::cout << std::endl;

        // clean data array
        array_.clear();
        elementsCount_ = 0;
        tableSize_ *= 2;
        array_.resize(tableSize_, nullptr);

        // NEED update a table size in hash object (for generation new hashes)
        hash_.updateTableSize(tableSize_);

        // add old elements to new array
        for(const auto& elem : elements)
        {
            this->add(elem.key, elem.value);
        }

        std::cout << std::endl << "after: " << std::endl;
        print();
    }
}

#endif // CHAINHASHTABLE_H
