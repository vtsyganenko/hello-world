#include "mydynamiclib.h"

int mult(int value1, int value2) {
    return value1 * value2;
}

int divide(int value1, int value2) {
    if(!value2) 
        return 0;
    return value1 / value2;
}
