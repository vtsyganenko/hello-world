// basic properties and methods

// count
let arr1 = [1, 2, 3, 4, 5]
print(arr1)
print("count", arr1.count)
print("isEmpty", arr1.isEmpty)
print()

let arr2 : [Int] = []
print(arr2)
print("count", arr2.count)
print("isEmpty", arr2.isEmpty)
print()

let arr3 = [UInt]()
print(arr3)
print("count", arr3.count)
print("isEmpty", arr3.isEmpty)
print()

// get slice by .count
print(arr1)
let arr4 = arr1[arr1.count-3...arr1.count-1]
print(arr4)
let arr5 = arr1[0...arr1.count-3]
print(arr5)
print()

// get slice by suffix and prefix
print(arr1)
let arr6 = arr1.suffix(2)
print("suffix(2)", arr6)
let arr7 = arr1.prefix(3)
print("prefix(3)", arr7)
print()

// first and last
print(arr1)
print("first", arr1.first!)
print("last", arr1.last!)
print(arr2)
print("first", arr2.first ?? 0)
print("last", arr2.last ?? 0)
print()

// modify
var arr = [1, 2, 3, 4, 5, 6]
print(arr)
arr.append(7)
print(arr)
arr.insert(10, at:2)
print(arr)
arr.remove(at:2)
print(arr)
arr.removeFirst()
print(arr)
arr.removeLast()
print(arr)
let arr8 = arr.dropFirst(2)
print("after dropFirst(2)", arr, arr8)
let arr9 = arr.dropLast(2)
print("after dropLast(2)", arr, arr9)
let arr81 = arr.dropFirst()
print("after dropFirst()", arr, arr81)
let arr91 = arr.dropLast()
print("after dropLast()", arr, arr91)
print()

// contains
print(arr)
print("arr.contains(4)", arr.contains(4))
print("arr.contains(10)", arr.contains(10))
print()

// min & max
arr = [10, 2, -9, -1, 0, 13, 44, 10, 3, 21]
print(arr)
print("min", arr.min()!)
print("max", arr.max()!)
print()

class Dog {
    let age : UInt
    init(age:UInt) {
        self.age = age
    }
    func info() {
        print("Dog(\(age))")
    }
}

var arr10 = [Dog(age:2), Dog(age:5), Dog(age:5), Dog(age:10)]
for i in 0...arr10.count-1 {
    arr10[i].info()
}
print()

// 'min()' requires that 'Dog' conform to 'Comparable'
//let youngest = arr10.min()
//youngest.info()

class Cat : Comparable {
    let age : UInt
    init(age:UInt) {
        self.age = age
    }
    func info() {
        print("Cat(\(age))")
    }
}

func < (lhs:Cat, rhs:Cat) -> Bool {
    return lhs.age < rhs.age
}

func == (lhs:Cat, rhs:Cat) -> Bool {
    return lhs.age == rhs.age
}

var arr11 = [Cat(age:2), Cat(age:5), Cat(age:5), Cat(age:10)]
for i in 0...arr11.count-1 {
    arr11[i].info()
}
print()

let youngest = arr11.min()!
print("youngest cat:")
youngest.info()

let oldest = arr11.max()!
print("oldest cat:")
oldest.info()
print()

// reverse
arr = [1, 2, 3, 4, 5, 6]
print(arr)
arr.reverse()
print(arr)
print()

// sorting
var arrayMutable = [23, 1, 123, -1, 0, 23, 10, -3, 8]
print(arrayMutable)
let arrayImmutable = arrayMutable
print(arrayImmutable)

let sortedMutable = arrayMutable.sorted()
let sortedImmutable = arrayImmutable.sorted()
print("after .sorted()")
print("sortedMutable:", sortedMutable, "arrayMutable", arrayMutable)
print("sortedImmutable:", sortedImmutable, "arrayImmutable", arrayImmutable)

arrayMutable.sort()
print("after .sort() - only for mutable")
print(arrayMutable)
print()

// random element
print(arrayImmutable)
print("some random elements from the array:")
print(arrayImmutable.randomElement()!)
print(arrayImmutable.randomElement()!)
print(arrayImmutable.randomElement()!)
print(arrayImmutable.randomElement()!)
