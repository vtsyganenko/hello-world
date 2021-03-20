#!/bin/python3
from enum import Enum

""" Hash table with open addressing (closed hashing) """


""" Enum shows status of cell in hash table array """
class CellState(Enum):
    EMPTY = 0
    FILLED = 1
    DELETED = 2


""" Objects which constituents hash table array """
class Element:
    def __init__(self, key, value):
        self.key = key
        self.value = value
        self.state = CellState(CellState.EMPTY)

    def __str__(self):
        return f"[{self.key}, {self.value}, {self.state}]"

    def __repr__(self):
        return str(self)

    def isEmpty(self):
        return self.state == CellState.EMPTY

    def isDeleted(self):
        return self.state == CellState.DELETED


"""" Main hash table class """
class HashTable:
    def __init__(self, default_key, default_value, max_data_size):
        self.array = []
        self.m = max_data_size * 3
        self.default_value = default_value
        for i in range(0, self.m):
            self.array.append(Element(default_key, default_value))

    def add(self, key, value):
        print("add", key, value)
        i = 0
        while i < self.m:
            h = self.__hash_linear(key, i)
            print("step: h =", h, "i =", i)
            if self.array[h].isEmpty() or self.array[h].isDeleted():
                self.array[h].key = key
                self.array[h].value = value
                self.array[h].state = CellState.FILLED
                return True
            i = i + 1
        return False

    def find(self, key):
        print("find", key)
        result_negative = (False, self.default_value)
        i = 0
        while i < self.m:
            h = self.__hash_linear(key, i)
            print("step: h =", h, "i =", i)
            if self.array[h].isEmpty():
                return result_negative
            elif self.array[h].isDeleted():
                continue
            elif self.array[h].key == key:
                return (True, self.array[h].value)
            i = i + 1
        return result_negative

    def delete(self, key):
        print("find", key)
        i = 0
        while i < self.m:
            h = self.__hash_linear(key, i)
            print("step: h =", h, "i =", i)
            if self.array[h].isEmpty():
                return False
            elif self.array[h].key == key:
                self.array[h].state = CellState.DELETED
                return True
            i = i + 1
        return False

    def print(self):
        print("Hash table size", len(self.array), ":")
        for i in range(0, self.m):
            print(i, self.array[i])

    def __hash(self, key):
        return key % self.m

    def __hash_linear(self, key, i):
        return (self.__hash(key) + i) % self.m


""" test cases """


def add_elements():
    tbl = HashTable(0, "", 5)
    tbl.add(100, "hello")
    tbl.add(200, "world")
    tbl.add(300, "color")
    tbl.add(400, "machine")
    tbl.add(500, "light")
    tbl.print()


def find_elements():
    tbl = HashTable(0, "", 5)
    tbl.add(100, "hello")
    tbl.add(200, "world")
    tbl.add(300, "color")
    tbl.add(400, "machine")
    tbl.add(500, "light")
    tbl.print()

    res = tbl.find(600)
    print("result of del(600)", res)
    res = tbl.find(300)
    print("result of del(300)", res)


def del_elements():
    tbl = HashTable(0, "", 5)
    tbl.add(100, "hello")
    tbl.add(200, "world")
    tbl.add(300, "color")
    tbl.add(400, "machine")
    tbl.add(500, "light")
    tbl.print()

    res = tbl.delete(600)
    print("result of del(600)", res)
    res = tbl.delete(500)
    print("result of del(500)", res)
    tbl.print()

    tbl.add(500, "new value")
    tbl.print()


""" main """

print("hash example")
del_elements()
