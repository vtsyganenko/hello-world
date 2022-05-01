#include "fraction.h"

#include <iostream>

int main(int argc, char* argv[]) {
    (void)argc;
    (void)argv;

    //Fraction fr1(1, 9, 2);
    //std::cout << "fr1: " << fr1 << std::endl;
    //fr1.setNumerator(1);
    //fr1.setDenominator(2);

    //Fraction fr2(22, 3, 9);
    //std::cout << "fr2: " << fr2 << std::endl;

    //auto fr3 = fr1 * fr2;
    //std::cout << fr1 << " * " << fr2 << " = " << fr3 << std::endl;

    Fraction fr2(26, 169);
    std::cout << "fr2: " << fr2 << std::endl;

    return 0;
}
