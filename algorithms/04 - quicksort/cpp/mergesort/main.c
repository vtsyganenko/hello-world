#include <stdio.h>
#include <stdlib.h>

void print_array(const int* array, unsigned int size)
{
    if(array && size) {
        printf("%d: [", size);
        for(unsigned int i=0; i<size; ++i)
        {
            printf("%d", array[i]);
            if(i == size-1)
                printf("]\n");
            else
                printf(", ");
        }
    }
    else {
        printf("0: []\n");
    }
}

// swap elements in array, which size is 2
void swap_array_2(int* array, unsigned int size)
{
    if(size == 2)
    {
        int buf = array[0];
        array[0] = array[1];
        array[1] = buf;
    }
}

// divide array to left and right parts
void divide_array(const int* array, const unsigned int size, int** left, unsigned int* left_size, int** right, unsigned int* right_size)
{
    //printf("divide_array\n");
    if(size == 0)
    {
        (*left) = NULL;
        *left_size = 0;
        (*right) = NULL;
        *right_size = 0;
        return;
    }

    unsigned int left_part_size = size / 2;
    unsigned int right_part_size = size - left_part_size;

    *left = malloc(left_part_size * sizeof(int));
    //printf("call malloc addr %p size %d \n", (void*)(*left), left_part_size);
    for(unsigned int i=0; i< left_part_size; ++i)
    {
        (*left)[i] = array[i];
    }

    *right = malloc(right_part_size * sizeof(int));
    //printf("call malloc addr %p size %d \n", (void*)(*right), right_part_size);
    int right_index = 0;
    for(unsigned int i=left_part_size; i<size; ++i)
    {
        (*right)[right_index++] = array[i];
    }

    *left_size = left_part_size;
    *right_size = right_part_size;
}

// merge two sorted arrays into one
void merge_sorted_arrays(const int* array1, const unsigned int len1, const int* array2, const unsigned int len2, int* result_array, unsigned int* result_len)
{
    //printf("merge_sorted_arrays\n");
    //printf("left: ");
    //print_array(array1, len1);
    //printf("right: ");
    //print_array(array2, len2);
    unsigned int full_length = len1 + len2;
    if(full_length == 0)
    {
        result_array = NULL;
        *result_len = 0;
        return;
    }

    // for clear test
    for(unsigned int i=0; i<full_length; ++i)
        result_array[i] = 0;

    unsigned int index1 = 0;
    unsigned int index2 = 0;
    unsigned int indexR = 0;
    while(index1 < len1 && index2 < len2)
    {
        if(array1[index1] < array2[index2])
        {
            result_array[indexR] = array1[index1];
            indexR++;
            index1++;
        }
        else if(array2[index2] < array1[index1])
        {
            result_array[indexR] = array2[index2];
            indexR++;
            index2++;
        }
        else
        {
            result_array[indexR] = array1[index1];
            indexR++;
            index1++;
            result_array[indexR] = array2[index2];
            indexR++;
            index2++;
        }
    }

    // find residue
    if(indexR != full_length) {
        if(index1 != len1) {
            unsigned int residue = len1 - index1;
            for(unsigned int i=0; i<residue; ++i)
            {
                result_array[indexR] = array1[index1];
                indexR++;
                index1++;
            }
        }
        if(index2 != len2) {
            unsigned int residue = len2 - index2;
            for(unsigned int i=0; i<residue; ++i)
            {
                result_array[indexR] = array2[index2];
                indexR++;
                index2++;
            }
        }
    }

    *result_len = full_length;
}

int* merge_sort(int* array, unsigned int size)
{
    //printf("-----------------\n");
    //printf("merge_sort:  ");
    //print_array(array, size);

    if(size == 2)
    {
        if(array[0] > array[1])
            swap_array_2(array, size);
        return array;
    }
    else if(size > 2)
    {
        // divide
        int* left = NULL;
        unsigned int left_size = 0;
        int* right = NULL;
        unsigned int right_size = 0;
        divide_array(array, size, &left, &left_size, &right, &right_size);

        // sort
        left = merge_sort(left, left_size);
        right = merge_sort(right, right_size);

        // merge sorted lists
        merge_sorted_arrays(left, left_size, right, right_size, array, &size);

        free(left);
        //printf("call free addr %p \n", (void*)(left));
        free(right);
        //printf("call free addr %p \n", (void*)(right));

        return array;
    }
    else
    {
        return array;
    }
}

void test_merge_sort(int* array, unsigned int size)
{
    printf("before ");
    print_array(array, size);
    merge_sort(array, size);
    printf("after ");
    print_array(array, size);
    printf("-----------------\n");
}

int main()
{

    int arr0[] = {};
    test_merge_sort(arr0, 0);

    int arr1[] = {18};
    test_merge_sort(arr1, 1);

    int arr2[] = {10, 44, 6, 9, 1, 22, 8, 0};
    test_merge_sort(arr2, 8);

    int arr3[] = {23, 14, 0, 14, -7, -58, 0};
    test_merge_sort(arr3, 7);

    int arr4[] = {-3, 4, 1, 23, 12, 0, 9, 8, 23, 12, 0, 14, 7, 58, 30};
    test_merge_sort(arr4, 15);

    printf("end!\n");
    return 0;
}
