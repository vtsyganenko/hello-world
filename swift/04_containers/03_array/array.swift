// creation with literal
let arr1 = [10, 20, 30, 40, 50]
print(arr1)
var arr2 = ["alfa", "betta", "gamma", "delta"]
print(arr2)

// creation with Array(arrayLiteral:)
let arr3 = Array(arrayLiteral: 100, 200, 300, 400)
print(arr3)
var arr4 = Array(arrayLiteral: "a", "b", "c", "d", "e", "f")
print(arr4)

// creation with Array(Sequence)
let arr5 = Array(1..<10)
print(arr5)
//let arr6 = Array(1.0...2.0)
// not a Sequence

// creation with Array(repeating:count:)
let arr7 = Array(repeating: "Hello", count: 10)
print(arr7)
class Dog {
    //...
}
let arr8 = Array(repeating: Dog(), count:5)
print(arr8)
print()

//-------------------------------------------------------------------

// access to elements

let arr9 = Array(1...10)
print(arr9)
print("arr[0]", arr9[0])
print("arr[5]", arr9[5])
print("arr[9]", arr9[9])
print()

var arr10 = ["a", "b", "c", "d"]
print(arr10)
arr10[1] = "Hello"
print(arr10)
// we changed array [1] element
var elem = arr10[3]
elem = "World"
print(arr10)
// we changed only variable elem
print()

var arr11 = Array(1...10)
print(arr11)
arr11[2...4] = [100]
print(arr11)
arr11[5...7] = [200, 200, 200]
print(arr11)
arr11[5...] = [0]
print(arr11)
print()

//-------------------------------------------------------------------

// type of array

let arr12 = ["a", "b", "c", "d", "e"]
print(arr12)
print(type(of:arr12))
let arr13 : Array<Character> = ["a", "b", "c", "d", "e"]
print(arr13)
print(type(of:arr13))
let arr14 = [10.1, 12.0, -4.2, -0.8]
print(arr14)
print(type(of:arr14))
let arr15 : [Float] = [10.1, 12.0, -4.2, -0.8]
print(arr15)
print(type(of:arr15))
print()

//-------------------------------------------------------------------

// array is a value types

var a = Array(1...5)
print("array a:", a)
var b = a
print("array b is copy of a:", b)
print("update array b:")
b[2] = 100
print("b:", b)
print("a:", a)
print()

//-------------------------------------------------------------------

// creation of empty array
let emptyArray : [String] = []
print(emptyArray)
let anotherEmptyArray = [String]()
print(anotherEmptyArray)
print()

//-------------------------------------------------------------------

// comparing arrays

let array1 = Array(1...5)
print(array1)
print(type(of:array1))
print( array1 == [1, 2, 3, 4, 5] )  // true
var array2 = Array(repeating:0, count:5)
for i in 0..<5 {
    array2[i] = i+1
}
print(array2)
print( array1 == array2 )   // true

// < or > is not applying

//-------------------------------------------------------------------

// concat arrays
let arrayA = ["a", "b", "c"]
print(arrayA)
let arrayB = ["d", "e"]
print(arrayB)
var arrayC = arrayA + arrayB
print(arrayC)
arrayC += ["f", "g", "h"]
print(arrayC)

