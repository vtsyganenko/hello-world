#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef uint8_t SIZE_TYPE;

void print_array(int* array, const SIZE_TYPE size) {
    for(SIZE_TYPE i=0; i<size; ++i) {
        printf("%d ", array[i]);
    }
    printf("\n");
}

int get_random(int lower, int upper) {
    int value = (rand() % (upper - lower + 1)) + lower;
    return value;
}

void bubble_sort(int* array, const SIZE_TYPE size) {
    int buffer = 0;
    uint8_t is_swapped;
    printf("sorting:\n");

    for(SIZE_TYPE j=0; j<size; ++j) {
        printf("j cycle %d \n", j);
        is_swapped = 0;

        for(SIZE_TYPE i=1; i < size - j; ++i) {
            printf("i cycle %d; ", i);
            if(array[i] < array[i-1]) {
                buffer = array[i];
                array[i] = array[i-1];
                array[i-1] = buffer;
                is_swapped = 1;
            }
        }
        printf("\n");

        if(!is_swapped) break;
    }
}

int main(int argc, char* argv[]) {

    const SIZE_TYPE SIZE = 10;
    int array[SIZE];

    srand(time(0));
    for(SIZE_TYPE i=0; i<SIZE; ++i) {
        array[i] = get_random(-100, 100);
    }

    print_array(array, SIZE);

    bubble_sort(array, SIZE);

    print_array(array, SIZE);

    return 0;
}
