#include <iostream>
#include <vector>

#include "hellotext.h"

int main()
{
    // hello!
    //std::cout << "Hello!" << std::endl;
    //std::cout << "World" << std::endl;
    std::cout << hello() << std::endl;

    // first part of code
    int a = 10;
    int b = a * 2;
    std::cout << "b = " << b << std::endl;

    // second part of code
    std::vector<int> v = {1, 2, 3};
    std::cout << "vector: ";
    for(auto& elem : v)
        std::cout << elem << " ";
    std::cout << std::endl;

    return 0;
}

