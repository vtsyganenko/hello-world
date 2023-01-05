#include <stdio.h>
#include <stdint.h>

int main(int argc, const char* argv[]) {
    
    // lets operate with value 500
    // 500
    // binary:       0000 0001 1111 0100
    // bytes in dec: 1         244

    // case 1
    uint8_t a = 1;
    uint8_t b = 244;

    uint16_t res = 0;
    // bitwise OR "adds" value a to value res
    res = res | a;
    // shift 8 bytes to free space
    res = res << 8;
    // another bitwise OR
    res = res | b;

    printf("%d \n", res);

    // case 2
    // little endian (x86_64 and arm64)
    uint8_t arr[2] = {b, a};

    uint16_t* ptr = (uint16_t*)arr;

    printf("%d \n", *ptr);
}
