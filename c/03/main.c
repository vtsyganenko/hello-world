#include <stdio.h>
#include <stdint.h>

void two_bytes_value() {
    printf("two_bytes_value\n");

    // lets operate with value 500
    // 500
    // binary:       0000 0001 1111 0100
    // bytes in dec: 1         244
    //               a         b
    uint8_t a = 1;
    uint8_t b = 244;

    // case 1 - use bitwise operations
    uint16_t res = 0;
    // bitwise OR "adds" value "a" to value "res"
    // it takes "right" or [0] byte (little endian)
    res = res | a;
    // shift 8 bytes to left -> value "a" takes its place
    res = res << 8;
    // another bitwise OR adds value "b"
    res = res | b;

    printf("%d \n", res);

    // case 2 - use pointer
    // little endian (x86_64 and arm64)
    uint8_t arr[2] = {b, a};
    uint16_t* ptr = (uint16_t*)arr;

    printf("%d \n", *ptr);

    // from value to bytes
    uint8_t output[2] = {0,};
    output[1] = (uint8_t)res;
    output[0] = (uint8_t)(res >>= 8);

    printf("bytes: [%d, %d] \n", output[0], output[1]);

    printf("\n");
}

void four_bytes_value() {
    printf("four_bytes_value\n");

    // lets operate with value 56,700,900
    // binary:      0000 0011 0110 0001 0010 1111 1110 0100
    // dec:         3         97        47        228
    uint8_t a = 3;
    uint8_t b = 97;
    uint8_t c = 47;
    uint8_t d = 228;

    // case 1 - use bitwise operations
    uint32_t res = 0;
    res = (res | a) << 8;
    res = (res | b) << 8;
    res = (res | c) << 8;
    res = (res | d);

    printf("%d \n", res);

    // case 2 - use pointer
    uint8_t arr[4] = {d, c, b, a};
    uint32_t* ptr = (uint32_t*)arr;

    printf("%d \n", *ptr);

    // from value to bytes
    uint8_t output[4] = {0,};
    output[3] = (uint8_t)res;
    output[2] = (uint8_t)(res >>= 8);
    output[1] = (uint8_t)(res >>= 8);
    output[0] = (uint8_t)(res >>= 8);

    printf("bytes: [%d, %d, %d, %d] \n", output[0], output[1], output[2], output[3]);

    printf("\n");
}

int main(int argc, const char* argv[]) {
    
    two_bytes_value();

    four_bytes_value();

    return 0;
}
