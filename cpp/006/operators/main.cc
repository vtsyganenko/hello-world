#include "fraction.h"

#include <iostream>

int main(int argc, char* argv[]) {
    (void)argc;
    (void)argv;

    Fraction fr1;
    std::cout << "fr1: " << fr1 << std::endl;
    fr1.setNumerator(1);
    fr1.setDenominator(2);

    Fraction fr2(1, 4);
    std::cout << "fr1: " << fr1 << " fr2: " << fr2 << std::endl;

    auto fr3 = fr1 * fr2;
    std::cout << fr1 << " * " << fr2 << " = " << fr3 << std::endl;

    return 0;
}
