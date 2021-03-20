#!/bin/python3
# Exercises for "divide and rule" approach


# 1. sum of array
def recursion_total_calc(array, current_total=0):
    if len(array) == 0:
        return current_total
    else:
        return recursion_total_calc(array, current_total + array.pop(0))


def test_recursion_total_calc(array):
    print("array is", array, end=" ")
    print("total is", recursion_total_calc(array))


# 2. count of elements
def recursion_count_calc(array, current_count=0):
    if not array:
        return current_count
    else:
        return recursion_count_calc(array[1:], current_count + 1)


def test_recursion_count_calc(array):
    print("array is", array, end=" ")
    print("count is", recursion_count_calc(array))


# 3. list maximum
def recursion_maximum_find(array, current_max=0):
    if not array:
        return None

    maximum = lambda a, b: a if a >= b else b

    if len(array) == 1:
        return maximum(array[0], current_max)
    else:
        return recursion_maximum_find(array[1:], maximum(array[0], current_max))


def test_recursion_maximum_find(array):
    print("array is", array, end=" ")
    print("max is", recursion_maximum_find(array))


# main
# 1
arr = []
test_recursion_total_calc(arr)
arr = [12]
test_recursion_total_calc(arr)
arr = [1, 3, 5, 2]
test_recursion_total_calc(arr)
# 2
arr = []
test_recursion_count_calc(arr)
arr = [12]
test_recursion_count_calc(arr)
arr = [1, 2, 3, 4, 5, 0]
test_recursion_count_calc(arr)
# 3
arr = []
test_recursion_maximum_find(arr)
arr = [12]
test_recursion_maximum_find(arr)
arr = [1, 2, 3, 34, 5, 0]
test_recursion_maximum_find(arr)
