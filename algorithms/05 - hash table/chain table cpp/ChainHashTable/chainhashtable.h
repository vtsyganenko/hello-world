#ifndef CHAINHASHTABLE_H
#define CHAINHASHTABLE_H

#include "hash.h"

#include <iostream>

#include <list>
#include <vector>
#include <deque>
#include <algorithm>
#include <exception>
#include <sstream>

template <class T>
struct NoValueFound : public std::exception
{
    NoValueFound(T key) : key_(key)
    {
        std::stringstream stream;
        stream << key_;
        key_str_ = stream.str();
    }

    virtual const char* what() const noexcept
    {
        std::string s = std::string("No value found for key: ") + key_str_;
        return s.c_str();
    }

private:
    T key_;
    std::string key_str_;
};

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

    bool del(const Key& key);

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
    typedef Node<Key, Type> NodeType;
    std::vector< NodeType* > array_;

    std::size_t tableSize_;
    std::size_t elementsCount_;
    HashFunc hash_;


    void increaseElementsCount();
    void decreaseElementsCount();

    void checkFillFactorAndUpdateTable(double factor);

    NodeType* findNodeWithKey(Key key);
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
bool ChainHashTable<Key, Type, HashFunc>::del(const Key& key)
{
    NodeType* node = findNodeWithKey(key);
    if(!node)
    {
        return false;
    }

    auto& list = node->nodeChain;
    std::size_t original_size = list.size();
    auto new_end = std::remove_if(list.begin(), list.end(),
                        [key](const Element<Key, Type>& elem)
    {
        return elem.key == key;
    });
    list.erase(new_end, list.end());

    std::size_t deleted = original_size - list.size();
    std::cout << "deleted " << deleted << " elements" << std::endl;
    for(std::size_t i = 0; i<deleted; ++i)
        decreaseElementsCount();

    if(list.empty())
    {
        std::cout << "we need to delete node!" << std::endl;
        auto it = std::find(array_.begin(), array_.end(), node);
        if(it != array_.end())
        {
            std::cout << "node is found" << std::endl;
            delete (*it);
            (*it) = nullptr;
        }
    }
    return true;
}

template <class Key, class Type, class HashFunc>
std::pair<Key, Type> ChainHashTable<Key, Type, HashFunc>::find(const Key& key)
{
    std::cout << "find: key = " << key << std::endl;
    std::pair<Key, Type> result;

    if(NodeType* node = findNodeWithKey(key))
    {
        const auto& list = node->nodeChain;
        auto it = std::find_if(list.begin(), list.end(),
                  [key](const Element<Key, Type>& elem)
        {
            return elem.key == key;
        });
        if(it != list.end()) {
            result.first = (*it).key;
            result.second = (*it).value;
        }
        else {
            // no element
            NoValueFound<Key> e(key);
            throw e;
        }
    }
    else {
        // no element
        NoValueFound<Key> e(key);
        throw e;
    }

    return result;
}

template <class Key, class Type, class HashFunc>
void ChainHashTable<Key, Type, HashFunc>::print()
{
    std::cout << "Elements count is " << elementsCount_ << std::endl;
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
    if(elementsCount_)
        elementsCount_--;

    std::cout << "decreaseElementsCount() new size is " << elementsCount_ << std::endl;
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

template <class Key, class Type, class HashFunc>
typename ChainHashTable<Key, Type, HashFunc>::NodeType *ChainHashTable<Key, Type, HashFunc>::findNodeWithKey(Key key)
{
    std::cout << "findNodeWithKey: key = " << key << std::endl;
    std::size_t hash = hash_(key);

    if(hash < array_.size())
    {
        return array_[hash];
    }

    return nullptr;
}

#endif // CHAINHASHTABLE_H
