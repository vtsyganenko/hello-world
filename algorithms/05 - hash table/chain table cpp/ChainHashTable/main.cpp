#include "chainhashtable.h"

#include <iostream>
#include <ctime>

#include "division.h"

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
    //std::srand(std::time(nullptr));

    //Team d1 = {30, "Dynamo"};
    //Team d2 = {32, "Spartak"};
    //Team d3 = {35, "CSKA"};



    // default hash for uint - Mult 2
    ChainHashTable<unsigned int, std::string> table;
    table.add(10, "spartak");
    table.add(20, "dynamo");
    table.add(30, "cska");
    table.print();

    ChainHashTable<unsigned int, std::string, DivisionHash<unsigned int>> table2;
    table2.add(10, "spartak");
    table2.add(20, "dynamo");
    table2.add(30, "cska");
    table2.print();

    return 0;
}
