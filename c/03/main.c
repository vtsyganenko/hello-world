#include <stdio.h>
#include <stdint.h>
#include <string.h>

void two_bytes_value() {
    printf("two_bytes_value()\n");
    
    // "A big-endian system stores the most significant byte of a word at the smallest memory address
    // and the least significant byte at the largest."
    // "A little-endian system, in contrast, stores the least-significant byte at the smallest address."

    // show this on array example
    // uint8_t array[2]
    // array[0] - smallest memory address

    // младший байт - содержащий нулевой бит
    // big-endian (BE) - от старшего к младшему, как привычная запись арабскими цифрами 123
    // little-endian (LE) - от младшего к старшему
    
    // let's take value 500
    // windows calc shows value in big-endian:
    // dec:                          500
    // binary:       0000 0001 1111 0100
    // bytes in dec: 1         244
    // for BE: [1, 244]
    // i.e. 1 - most-significant byte, 244 - least-significant byte

    uint16_t value = 500;
    printf("value: %d \n", value);
    // let's split value to bytes by pointer
    // remember that x86 or Apple ARM use little-endian:
    uint8_t byte[2] = {0,};
    uint16_t* ptr = (uint16_t*)byte;
    *ptr = value;
    printf("split value to bytes by pointer: [%d, %d] \n", byte[0], byte[1]);
    // for LE: [244, 1]

    //-----------------------------------------------------------------------------------

    // convert from bytes to value
    uint16_t res = 0;
    
    // from BE:
    byte[0] = 1;
    byte[1] = 244;
    printf("manual convertation BE bytes [%d, %d] to value:\n", byte[0], byte[1]);

    // Независимо от архитектуры (big-endian, или little-endian) числа в двоичном виде
    // представляются слева направо, от более значащего бита к менее значащему. 
    // (т.е. в двоичном виде, например для сдвига - BE)
    // binary representation of a number always use BE (from the left to right, like in calculator) 
    // so we put bytes by bitwise operations to positions as in the BE case

    // case 1 - use bitwise operations
    // bitwise OR "adds" value byte[0] to value res and it takes "right" place
    res = res | byte[0];
    // shift 8 bits to the left -> value byte[0] takes its place ("left")
    res = res << 8;
    // another bitwise OR adds value byte[1]
    res = res | byte[1];
    printf("case 1 res = %d \n", res);

    // case 2 - in one line
    res = 0;
    res = ((uint16_t)byte[0]<<8)|(uint16_t)(byte[1]);
    printf("case 2 res = %d \n", res);
    
    // from LE:
    byte[0] = 244;
    byte[1] = 1;
    printf("manual convertation LE bytes [%d, %d] to value:\n", byte[0], byte[1]);

    // we need to place most-significant byte to first place
    // case 1 - use bitwise operations
    res = 0;
    res = res | byte[1];
    res = res << 8;
    res = res | byte[0];
    printf("case 1 res = %d \n", res);

    // case 2 - in one line
    res = 0;
    res = (uint16_t)(byte[0])|((uint16_t)byte[1]<<8);
    printf("case 2 res = %d \n", res);

    // case 3 - use pointer (only for LE since our computer is LE)
    res = 0;
    uint16_t* ptr1 = (uint16_t*)byte;
    res = *ptr1;
    printf("case 3 res = %d \n", res);

    //-----------------------------------------------------------------------------------

    // from value to bytes
    uint8_t output[2] = {0,};

    // for LE:
    // case 1
    res = 500;
    output[0] = (uint8_t)res;
    output[1] = (uint8_t)(res >> 8);
    printf("manual convertation value %d to LE bytes [%d, %d]\n", res, output[0], output[1]);
    memset(output, 0, sizeof(uint8_t)*2);

    // case 2
    uint16_t* ptr2 = (uint16_t*)output;
    *ptr2 = res;
    printf("manual convertation value %d to LE bytes [%d, %d]\n", res, output[0], output[1]);
    memset(output, 0, sizeof(uint8_t)*2);

    // for BE:
    res = 500;
    output[0] = (uint8_t)(res >> 8);
    output[1] = (uint8_t)res;
    printf("manual convertation value %d to BE bytes [%d, %d]\n", res, output[0], output[1]);

    printf("\n");
}

void four_bytes_value() {
    printf("four_bytes_value()\n");

    // let's operate with value 56700900
    // from calculator (BE):
    // binary:      0000 0011 0110 0001 0010 1111 1110 0100
    // dec:         3         97        47        228

    uint32_t value = 56700900;
    printf("value: %d \n", value);
    // let's split value to bytes by pointer
    // remember that x86 or Apple ARM use little-endian
    uint8_t byte[4] = {0,};
    uint32_t* ptr = (uint32_t*)byte;
    *ptr = value;
    printf("split value to bytes by pointer: [%d, %d, %d, %d] \n", byte[0], byte[1], byte[2], byte[3]);
    // for LE: [228, 47, 97, 3]

    //-----------------------------------------------------------------------------------

    // convert from bytes to value
    uint32_t res = 0;
    
    // from BE:
    byte[0] = 3;
    byte[1] = 97;
    byte[2] = 47;
    byte[3] = 228;
    printf("manual convertation BE bytes [%d, %d, %d, %d] to value:\n", byte[0], byte[1], byte[2], byte[3]);

    // case 1
    res = res | byte[0];
    res = res << 8;
    res = res | byte[1];
    res = res << 8;
    res = res | byte[2];
    res = res << 8;
    res = res | byte[3];
    printf("case 1 res = %d \n", res);

    // case 2
    res = 0;
    res = ((uint32_t)byte[0]<<24)|((uint32_t)byte[1]<<16)|((uint32_t)byte[2]<<8)|(uint32_t)(byte[3]);
    printf("case 2 res = %d \n", res);

    // from LE:
    byte[0] = 228;
    byte[1] = 47;
    byte[2] = 97;
    byte[3] = 3;
    printf("manual convertation LE bytes [%d, %d, %d, %d] to value:\n", byte[0], byte[1], byte[2], byte[3]);

    // case 1
    res = 0;
    res = res | byte[3];
    res = res << 8;
    res = res | byte[2];
    res = res << 8;
    res = res | byte[1];
    res = res << 8;
    res = res | byte[0];
    printf("case 1 res = %d \n", res);

    // case 2
    res = 0;
    res = ((uint32_t)byte[3]<<24)|((uint32_t)byte[2]<<16)|((uint32_t)byte[1]<<8)|(uint32_t)(byte[0]);
    printf("case 2 res = %d \n", res);

    // case 3 - use pointer (only for LE since our computer is LE)
    res = 0;
    uint32_t* ptr1 = (uint32_t*)byte;
    res = *ptr1;
    printf("case 3 res = %d \n", res);

    //-----------------------------------------------------------------------------------

    // from value to bytes
    uint8_t output[4] = {0,};

    // for LE:
    // case 1
    res = 56700900;
    output[0] = (uint8_t)res;
    output[1] = (uint8_t)(res >> 8);
    output[2] = (uint8_t)(res >> 16);
    output[3] = (uint8_t)(res >> 24);
    printf("manual convertation value %d to LE bytes [%d, %d, %d, %d]\n", res, 
        output[0], output[1], output[2], output[3]);
    memset(output, 0, sizeof(uint8_t)*4);

    // case 2
    uint32_t* ptr2 = (uint32_t*)output;
    *ptr2 = res;
    printf("manual convertation value %d to LE bytes [%d, %d, %d, %d]\n", res, 
        output[0], output[1], output[2], output[3]);
    memset(output, 0, sizeof(uint8_t)*4);

    // for BE:
    res = 56700900;
    output[0] = (uint8_t)(res >> 24);
    output[1] = (uint8_t)(res >> 16);
    output[2] = (uint8_t)(res >> 8);
    output[3] = (uint8_t)res;
    printf("manual convertation value %d to BE bytes [%d, %d, %d, %d]\n", res,
        output[0], output[1], output[2], output[3]);

}

int main(int argc, const char* argv[]) {
    
    // test for endianness
    uint16_t x = 1;
    printf("system is %s-endian\n\n", *((uint8_t *) &x) ? "little" : "big");
    // we take little byte and if contains 1 - it is little-endian (from little)

    two_bytes_value();

    four_bytes_value();

    return 0;
}
