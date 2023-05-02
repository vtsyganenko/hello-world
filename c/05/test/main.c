#include <stdio.h>

#include "mystaticlib.h"
#include "mydynamiclib.h"

int main(int argc, const char* argv[]) {
    
    int val1 = 100;
    int val2 = 15;

    printf("%d + %d = %d\n", val1, val2, plus(val1, val2));
    printf("%d - %d = %d\n", val1, val2, minus(val1, val2));
    printf("%d * %d = %d\n", val1, val2, mult(val1, val2));
    printf("%d / %d = %d\n", val1, val2, divide(val1, val2));

    return 0;
}
