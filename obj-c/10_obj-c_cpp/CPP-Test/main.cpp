//
//  main.cpp
//  CPP-Test
//
//  Created by Виталий Цыганенко on 04.12.2021.
//

#include "cpp_class.h"

#include <iostream>

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Test for StringGetter cpp class:" << std::endl;
    StringGetter getter;
    std::cout << "Before adding 5 values:" << std::endl;
    std::cout << getter.getResult() << std::endl;
    
    getter.addValue(10);
    getter.addValue(11);
    getter.addValue(72);
    getter.addValue(60);
    getter.addValue(290);
    
    std::cout << "After adding 5 values:" << std::endl;
    std::cout << getter.getResult() << std::endl;
    getter.clearValues();
    std::cout << "After clearing:" << std::endl;
    std::cout << getter.getResult() << std::endl;
    return 0;
}

