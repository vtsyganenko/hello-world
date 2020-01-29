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
    std::srand(std::time(nullptr));


    //Team d1 = {30, "Dynamo"};
    //Team d2 = {32, "Spartak"};
    //Team d3 = {35, "CSKA"};

/*
    ChainHashTable<unsigned int, std::string> table;
    table.add(10, "spartak");
    table.add(20, "dynamo");
    table.add(30, "cska");
    table.print();
*/

    /*
    ChainHashTable<std::string, double> table;
    table.add("spartak", 12.8);
    table.add("dynamo", 18.1);
    table.add("cska", 21.12);
    table.print();
    */


    /*
    ChainHashTable<const char*, int> t;

    t.add("spartak", 10);
    t.add("dynamo", 22);
    t.add("cska", 39);

    t.print();
    */



    ChainHashTable<unsigned int, std::string> table;
    for(int key =1; key<=4; ++key)
    {
        std::string name = "team_" + std::to_string(key+1000);

        table.add(key, name);
    }

    //table.print();


    return 0;
}
