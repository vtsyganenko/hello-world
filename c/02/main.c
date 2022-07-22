#include <stdlib.h>
#include <stdio.h>

// pass array for write by pointer to pointer
void allocArray(int** array, int size) {
    *array = calloc(size, sizeof(*array));
}

// pass array for read by pointer
void printArray(int* array, int size) {
    for(int i=0; i<size; ++i) {
        printf("%d ", array[i]);
    }
    printf("\n");
}

void oneDimensionalArrayExample() {
    printf("oneDimensionalArrayExample\n");

    int* arr = NULL;
    allocArray(&arr, 10);
    
    printArray(arr, 10);
    for(int i=0; i<10; ++i) {
        arr[i] = i+1;
    }
    printArray(arr, 10);

    int k = 4;
    printf("array[%d] = %d \n*(array + %d) = %d \n", k, arr[k], k, *(arr + k));

    free(arr);
}

//---------------------------------------------------------------------------------------

void printArray2ver1(int* array, int row, int col) {
    for(int i=0; i<row; ++i) {
        for(int j=0; j<col; ++j) {
            printf("[%d][%d] = %d ", i, j, *(array + i*col + j));
        }
        printf("\n");
    }
}

void printArray2ver2(int* array, int row, int col) {
    // explanation:
    // int arr[3][4] = {{10, 11, 12, 13}, {20, 21, 22, 23}, {30, 31, 32, 33}};
    // int (*ptr)[4];
    // ptr = arr;
    // we have pointer to int and we that it is an 2D array
    // we convert this pointer to "pointer to array of defined size"
    int (*arr)[col] = (int (*)[col]) array;

    for(int i=0; i<row; ++i) {
        for(int j=0; j<col; ++j) {
            printf("[%d][%d] = %d ", i, j, arr[i][j]);
        }
        printf("\n");
    }
}

void allocArray2(int** array, int row, int col) {
    printf("size is %lu \n", sizeof(*(*array)));
    *array = calloc(row * col, sizeof(*(*array)));
}

void twoDimensionalArrayExample1() {
    printf("twoDimensionalArrayExample1\n");

    const int ROW = 2;
    const int COL = 3;
    int array[ROW][COL];    // 2 arrays with 3 elements

    int k = 0;
    for(int i=0; i<ROW; ++i) {
        for(int j=0; j<COL; ++j) {
            array[i][j] = ++k;
        }
    }

    printf("ver 1:\n");
    printArray2ver1((int*)array, ROW, COL);
    printf("ver 2:\n");
    printArray2ver2((int*)array, ROW, COL);
}

void twoDimensionalArrayExample2() {
    printf("twoDimensionalArrayExample2\n");

    // 3 arrays with 5 elements
    const int ROW = 3;
    const int COL = 5;

    int* array = NULL;
    allocArray2(&array, ROW, COL);
    // please see explanation above
    int (*ptr)[COL] = (int (*)[COL]) array;

    int k = 0;
    for(int i=0; i<ROW; ++i) {
        for(int j=0; j<COL; ++j) {
            ptr[i][j] = ++k;
        }
    }

    printf("ver 1:\n");
    printArray2ver1((int*)array, ROW, COL);
    printf("ver 2:\n");
    printArray2ver2((int*)array, ROW, COL);

    free(array);
}

//---------------------------------------------------------------------------------------

int main(int argc, char *argv[]) 
{
    oneDimensionalArrayExample();

    twoDimensionalArrayExample1();

    twoDimensionalArrayExample2();

    return 0;
}
