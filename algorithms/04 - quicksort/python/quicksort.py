#!/bin/python3


def quick_sort(array):
    #print("-----------------------------------")
    #print("call quicksort with", array)
    if len(array) < 2:
        #print("base case")
        return array
    else:
        pivot_index = len(array) // 2
        pivot = array[pivot_index]
        array.pop(pivot_index)
        #print("pivot is array[", pivot_index, "] =", pivot)

        # left part - elements which are smaller than pivot
        left_part = []
        # right part - elements which are greater than pivot
        right_part = []
        for element in array:
            if element < pivot:
                left_part.append(element)
            else:
                right_part.append(element)

        #print(left_part, pivot, right_part)
        return quick_sort(left_part) + [pivot] + quick_sort(right_part)


def test_quick_sort(array):
    print("before:", array)
    print("after: ", quick_sort(array))


# main
arr = []
test_quick_sort(arr)
arr = [18]
test_quick_sort(arr)
arr = [23, 12, 0, 14, 7, 58, 30]
test_quick_sort(arr)
arr = [5, 5, 5, 5, 5]
test_quick_sort(arr)
arr = [-3, 4, 1, 23, 12, 0, 9, 8]
test_quick_sort(arr)
arr = [-3, 4, 1, 23, 12, 0, 9, 8, 23, 12, 0, 14, 7, 58, 30]
test_quick_sort(arr)
