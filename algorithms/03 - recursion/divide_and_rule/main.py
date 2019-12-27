#!/bin/python3

def recursion_total_calc(array, current_total=0):
    if len(array) == 0:
        return current_total
    else:
        return recursion_total_calc(array, current_total + array.pop(0))


def test(array):
    print("array is", array, end=" ")
    print("total is", recursion_total_calc(arr))


# main
arr = []
test(arr)
arr = [12]
test(arr)
arr = [1, 3, 5, 2]
test(arr)
