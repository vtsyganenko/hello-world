#ifndef USERDATA_H
#define USERDATA_H

#include "hash_interface.h"
#include "multiplication.h"

#include <iostream>

struct Team
{
    std::string name;
    unsigned int points;

    Team() : name(std::string()), points(0) {}
    Team(std::string n, unsigned int p) : name(n), points(p) {}

    bool operator==(const Team& other) const
    {
        return name == other.name;
    }

    friend std::ostream& operator << (std::ostream& s, const Team& team);
};

std::ostream& operator << (std::ostream& s, const Team& team)
{
    s << "(" << team.name << ", " << team.points << ")";
    return s;
}

template <class T>
struct TeamHash : public HashInterface<T>
{
    explicit TeamHash(std::size_t tableSize)
        : HashInterface<T>(tableSize), mult_hash_(tableSize)
    {
        const bool isCorrectType = std::is_same<T, Team>::value;
        static_assert(isCorrectType, "StringMethodHashVol1: key type shall be Team!");
    }

    std::size_t operator()(const T& key_obj) override
    {
        std::cout << "TeamHash with [" << key_obj << "]" << std::endl;
        auto key_int = key_obj.points;
        std::cout << "key int " << key_int << std::endl;

        std::size_t hash = mult_hash_(key_int);
        std::cout << "hash after div " << hash << std::endl;
        return hash;
    }

    void updateTableSize(std::size_t newSize)
    {
        mult_hash_.updateTableSize(newSize);
    }

private:
    MultiplicationHashVol2<unsigned int> mult_hash_;
};

#endif // USERDATA_H
