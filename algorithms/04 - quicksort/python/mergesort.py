#!/bin/python3

def swap2(array):
    if len(array) == 2:
        buf = array[0]
        array[0] = array[1]
        array[1] = buf
    return array

def merge2(array1, array2):
    result = []
    while array1 and array2:
        if array1[0] < array2[0]:
            result.append(array1.pop(0))
        elif array2[0] < array1[0]:
            result.append(array2.pop(0))
        else:
            result.append(array1.pop(0))
            result.append(array2.pop(0))
    return result + array1 + array2

def merge_sort(array):
    length = len(array)
    if length == 2:
        if array[0] > array[1]:
            return swap2(array)
        else:
            return array
    elif length > 2:
        middle = len(array) // 2
        left_part = array[:middle]
        right_part = array[middle:]
        return merge2(merge_sort(left_part), merge_sort(right_part))
    else:
        return array


def test_merge_sort(array):
    print("before:", array)
    print("after: ", merge_sort(array))


# main
arr = []
test_merge_sort(arr)
arr = [18]
test_merge_sort(arr)
arr = [23, 12, 0, 14, 7, 58, 30]
test_merge_sort(arr)
arr = [5, 5, 5, 5, 5]
test_merge_sort(arr)
arr = [-3, 4, 1, 23, 12, 0, 9, 8]
test_merge_sort(arr)
arr = [-3, 4, 1, 23, 12, 0, 9, 8, 23, 12, 0, 14, 7, 58, 30]
test_merge_sort(arr)
