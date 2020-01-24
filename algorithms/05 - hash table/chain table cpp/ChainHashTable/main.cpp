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


    StringMethodHashVol1 s(100);

    auto h1 = s.convertStringKeyToNumber("spartak");
    std::cout << "h = " << h1 << std::endl << std::endl;
    auto h2 = s.convertStringKeyToNumber("dynamo");
    std::cout << "h = " << h2 << std::endl << std::endl;
    auto h3 = s.convertStringKeyToNumber("cska");
    std::cout << "h = " << h3 << std::endl << std::endl;

    return 0;
}
