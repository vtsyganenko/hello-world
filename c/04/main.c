#include <stdio.h>
#include <stdint.h>
#include <string.h>

typedef union {
    struct {
        int32_t value;
    };
    uint8_t bytes[4];
} Data;

int main(int argc, const char* argv[]) {
    
    Data data;
    printf("input integer value:\n");
    scanf("%d", &data.value);

    printf("bytes for value %d are [%d %d %d %d]\n", data.value, 
        data.bytes[0], data.bytes[1], data.bytes[2], data.bytes[3]);

    // check
    int32_t value;
    value = data.bytes[3];
    value = value << 8 | (uint8_t)data.bytes[2];
    value = value << 8 | (uint8_t)data.bytes[1];
    value = value << 8 | (uint8_t)data.bytes[0];
    printf("value from bytes: %d\n", value);

    // check
    Data data1;
    memcpy(data1.bytes, data.bytes, 4);
    printf("%d \n", data1.value);

    return 0;
}
