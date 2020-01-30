#ifndef COMMON_H
#define COMMON_H

#include <cmath>

#include <iostream>

bool isPrimeNumber(unsigned int num)
{
    if(num < 2)
        return false;
    else if(num == 2)
        return true;
    else {
        unsigned int root = static_cast<unsigned int>(std::ceil(std::sqrt(num)));

        bool prime = true;
        for(unsigned int i=2; i<=root; ++i)
        {
            if(num % i == 0) {
                prime = false;
                break;
            }
        }
        return prime;
    }
}

#endif // COMMON_H
