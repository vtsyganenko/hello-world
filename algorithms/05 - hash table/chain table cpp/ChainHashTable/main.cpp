#include "chainhashtable.h"

#include <iostream>
#include <unordered_map>

struct Team
{
    int points;
    std::string name;

    bool operator==(const Team& other) const
    {
        return name == other.name;
    }
};

int main()
{
    //Team d1 = {30, "Dynamo"};
    //Team d2 = {32, "Spartak"};
    //Team d3 = {35, "CSKA"};

    ChainHashTable<unsigned int, std::string> table;

    table.add(10, "spartak");
    table.add(20, "dynamo");
    table.add(30, "cska");
//    table.add(31, "cska");
//    table.add(32, "cska");
//    table.add(33, "cska");
//    table.add(34, "cska");
//    table.add(35, "cska");
//    table.add(36, "cska");

    table.print();

    return 0;
}
