#include "chainhashtable.h"

#include <iostream>
#include <unordered_map>

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

int main()
{
    //Team d1 = {30, "Dynamo"};
    //Team d2 = {32, "Spartak"};
    //Team d3 = {35, "CSKA"};


    ChainHashTable<unsigned int, std::string> table;
    table.add(10, "spartak");
    table.add(20, "dynamo");
    table.add(30, "cska");
    table.print();


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

    /*
    StringMethodHashVol2 obj(128);

    std::cout << "key = " << obj.calc("abc") << std::endl;
    */

    //std::cout << std::boolalpha;
    //std::cout << isPrimeNumber(146) << std::endl;



    return 0;
}
