#include "chainhashtable.h"

#include <iostream>
#include <ctime>

#include "division.h"
#include <bitset>

struct Team
{
    int points;
    std::string name;

    bool operator==(const Team& other) const
    {
        return name == other.name;
    }
};

unsigned int getRandom(unsigned int from, unsigned int to)
{
    unsigned int r = static_cast<unsigned int>(std::rand());
    unsigned int random = from + r % to;
    return random;
}

int main()
{
/*
    double a = 15046439;
    double b = 158.217;

    double c = a * b;
    std::cout << c << std::endl;

    unsigned char aa = static_cast<unsigned char>(c);
    std::cout << +aa << std::endl;

    std::bitset<64> bs(c);
    std::cout << bs << std::endl;

    return 0;
*/

    //std::srand(std::time(nullptr));


    // default hash for uint
    ChainHashTable<const char*, std::string> table;
    table.add("redwhite", "spartak");
    table.add("whiteblue", "dynamo");
    table.add("bluered", "cska");

    //table.add("redwhite", "spartak");
    //table.add("bluewhite", "dynamo");
    //table.add("redblue", "cska");

    table.print();
/*
    // hash is chosen by user
    ChainHashTable<unsigned int, std::string, DivisionHash<unsigned int>> table2;
    table2.add(10, "spartak");
    table2.add(20, "dynamo");
    table2.add(30, "cska");
    table2.print();
*/


    return 0;
}
