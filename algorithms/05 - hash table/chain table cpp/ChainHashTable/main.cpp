#include "chainhashtable.h"

#include <iostream>
#include <ctime>

struct Team
{
    int points;
    std::string name;

    bool operator==(const Team& other) const
    {
        return name == other.name;
    }
};

unsigned int getRandomUInt(unsigned int from, unsigned int to)
{
    unsigned int r = static_cast<unsigned int>(std::rand());
    unsigned int random = from + r % to;
    return random;
}

float getRandomFloat(float to = 1.0)
{
    return (static_cast <float> (std::rand())) / (static_cast <float> (RAND_MAX/to));
}

std::string getRandomString()
{
    std::vector<std::string> colors = {"white", "red", "orange", "yellow", "green",
                                       "blue", "violet", "brown", "grey", "black"};
    std::string str = colors[getRandomUInt(0, 9)] + " " + colors[getRandomUInt(0,9)];
    return str;
}

//----------------------------------------------------------------------------

// HASH WITH INT

void example_hash_int_simple()
{
    std::cout << __FUNCTION__ << std::endl;

    ChainHashTable<unsigned int, std::string> table;
    for(uint8_t k=0; k<=7; ++k)
    {
        unsigned int key = getRandomUInt(1, 100);
        std::string value = getRandomString();
        table.add(key, value);
        std::cout << "-----------------------------------" << std::endl;
    }

    table.print();
    std::cout << std::endl;
}

void example_hash_int_expansion()
{
    std::cout << __FUNCTION__ << std::endl;

    ChainHashTable<unsigned int, std::string> table;
    for(uint8_t k=0; k<=20; ++k)
    {
        unsigned int key = getRandomUInt(1, 100);
        std::string value = getRandomString();
        table.add(key, value);
        std::cout << "-----------------------------------" << std::endl;
    }

    table.print();
    std::cout << std::endl;
}

void example_hash_int_with_userhash()
{
    std::cout << __FUNCTION__ << std::endl;

    ChainHashTable<unsigned int, std::string, DivisionHash<unsigned int>> table;
    for(uint8_t k=0; k<=7; ++k)
    {
        unsigned int key = getRandomUInt(1, 100);
        std::string value = getRandomString();
        table.add(key, value);
        std::cout << "-----------------------------------" << std::endl;
    }

    table.print();
    std::cout << std::endl;
}

void example_hash_int_comparsion()
{
    std::cout << __FUNCTION__ << std::endl;

    std::vector< std::pair<unsigned int, std::string> > data;
    for(uint8_t k=0; k<=6; ++k)
    {
        unsigned int key = getRandomUInt(1, 100);
        std::string value = getRandomString();
        data.push_back( std::make_pair(key, value) );
    }

    std::cout << "test data:" << std::endl;
    for(const auto& pair : data)
        std::cout << pair.first << " " << pair.second << std::endl;

    ChainHashTable<unsigned int, std::string,
            DivisionHash<unsigned int>> div_table;
    for(const auto& pair : data)
        div_table.add(pair.first, pair.second);

    ChainHashTable<unsigned int, std::string,
            MultiplicationHashVol1<unsigned int>> mult_1_table;
    for(const auto& pair : data)
        mult_1_table.add(pair.first, pair.second);

    ChainHashTable<unsigned int, std::string,
            MultiplicationHashVol2<unsigned int>> mult_2_table;
    for(const auto& pair : data)
        mult_2_table.add(pair.first, pair.second);

    std::cout << std::endl;
    std::cout << "RESULTS:" << std::endl;
    std::cout << "DivisionHash:" << std::endl;
    div_table.print();
    std::cout << "MultiplicationHashVol1:" << std::endl;
    mult_1_table.print();
    std::cout << "MultiplicationHashVol2:" << std::endl;
    mult_2_table.print();

    std::cout << std::endl;
}

//----------------------------------------------------------------------------

// HASH WITH STRING

void example_hash_string_simple()
{
    std::cout << __FUNCTION__ << std::endl;

    ChainHashTable<std::string, float> table;
    for(uint8_t k=0; k<=5; ++k)
    {
        std::string key = getRandomString();
        float value = getRandomFloat();
        table.add(key, value);
        std::cout << "-----------------------------------" << std::endl;
    }

    table.print();
    std::cout << std::endl;
}

void example_hash_string_expansion()
{
    std::cout << __FUNCTION__ << std::endl;

    ChainHashTable<std::string, float> table;
    for(uint8_t k=0; k<=20; ++k)
    {
        std::string key = getRandomString();
        float value = getRandomFloat();
        table.add(key, value);
        std::cout << "-----------------------------------" << std::endl;
    }

    table.print();
    std::cout << std::endl;
}

void example_hash_string_with_userhash()
{
    std::cout << __FUNCTION__ << std::endl;

    ChainHashTable<std::string, float, StringMethodHashVol2<std::string>> table;
    for(uint8_t k=0; k<=5; ++k)
    {
        std::string key = getRandomString();
        float value = getRandomFloat();
        table.add(key, value);
        std::cout << "-----------------------------------" << std::endl;
    }

    table.print();
    std::cout << std::endl;
}

void example_hash_string_comparsion()
{
    std::cout << __FUNCTION__ << std::endl;

    std::vector< std::pair<std::string, float> > test_data;
    for(uint8_t k=0; k<=6; ++k)
    {
        std::string key = getRandomString();
        float value = getRandomFloat();
        test_data.push_back( std::make_pair(key, value) );
    }

    std::cout << "test data:" << std::endl;
    for(const auto& pair : test_data)
        std::cout << pair.first << " " << pair.second << std::endl;

    ChainHashTable<std::string, float,
            StringMethodHashVol1<std::string>> str_table_1;
    for(const auto& pair : test_data)
        str_table_1.add(pair.first, pair.second);

    ChainHashTable<std::string, float,
            StringMethodHashVol2<std::string>> str_table_2;
    for(const auto& pair : test_data)
        str_table_2.add(pair.first, pair.second);

    std::cout << std::endl;
    std::cout << "RESULTS:" << std::endl;
    std::cout << "StringMethodHashVol1:" << std::endl;
    str_table_1.print();
    std::cout << "StringMethodHashVol2:" << std::endl;
    str_table_2.print();
    std::cout << std::endl;
}

//----------------------------------------------------------------------------

void example_hash_int_find()
{
    std::cout << __FUNCTION__ << std::endl;

    std::vector< std::pair<unsigned int, std::string> > test_data;
    ChainHashTable<unsigned int, std::string> table;
    for(uint8_t k=0; k<=7; ++k)
    {
        unsigned int key = getRandomUInt(1, 100);
        std::string value = getRandomString();
        test_data.push_back( std::make_pair(key, value) );
        table.add(key, value);
    }
    std::cout << std::endl << "test hash table:" << std::endl;
    table.print();

    unsigned int valid_key = test_data[4].first;
    auto pair1 = table.find(valid_key);
    std::cout << "result for valid: " << valid_key << " "
              << "is [" << pair1.first << ", "
              << pair1.second << "]" << std::endl;

    unsigned int invalid_key = getRandomUInt(200, 300);
    std::pair<unsigned int, std::string> pair2;
    try {
        pair2 = table.find(invalid_key);
    }
    catch(std::exception& e)
    {
        std::cout << "Exception! " << e.what() << std::endl;
    }
    std::cout << "result for invalid: " << invalid_key << " "
              << "is [" << pair2.first << ", "
              << pair2.second << "]" << std::endl;

    std::cout << std::endl;
}

void example_hash_string_find()
{
    std::cout << __FUNCTION__ << std::endl;

    std::vector< std::pair<std::string, float> > test_data;
    ChainHashTable<std::string, float> table;
    for(uint8_t k=0; k<=7; ++k)
    {
        std::string key = getRandomString();
        float value = getRandomFloat();
        test_data.push_back( std::make_pair(key, value) );
        table.add(key, value);
    }
    std::cout << std::endl << "test hash table:" << std::endl;
    table.print();

    std::string valid_key = test_data[4].first;
    auto pair1 = table.find(valid_key);
    std::cout << "result for valid: " << valid_key << " "
              << "is [" << pair1.first << ", "
              << pair1.second << "]" << std::endl;

    std::string invalid_key("invalid key");
    std::pair<std::string, float> pair2;
    try {
        pair2 = table.find(invalid_key);
    }
    catch(std::exception& e)
    {
        std::cout << "Exception! " << e.what() << std::endl;
    }
    std::cout << "result for invalid: " << invalid_key << " "
              << "is [" << pair2.first << ", "
              << pair2.second << "]" << std::endl;

    std::cout << std::endl;
}

//----------------------------------------------------------------------------

int main()
{
    std::srand(static_cast<unsigned int>(std::time(nullptr)));
    std::cout.setf(std::ios::fixed);

    // ...

    return 0;
}
