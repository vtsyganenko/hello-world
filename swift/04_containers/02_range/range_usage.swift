// 1. cycle
for i in 1...10 {
    print(i, terminator:" ")
}
print()
let start = -20
let finish = -1
// let range = -20...-1 is not compiles
let range = start...finish
for i in range {
    print(i, terminator:" ")
}
print()
print()

// 2. check range
let middleMark = 3.0..<4.0
let value = 3.5
if middleMark.contains(value) {
    print(middleMark, "contains", value)
}
print()

// 3. array creation
let array = Array(1...5)
let array1 = Array(start...finish)
let array2 = Array(0...0)
print(array)
print(array1)
print(array2)
print()

// 4. array slice
let array3 = Array(10..<20)
print(array3)
let range1 = ...3
print(range1)
print(array3[range1])
let range2 = 7...
print(range2)
print(array3[range2])
let range3 = 2...4
print(range3)
print(array3[range3])
let range4 = 0..<4
print(range4)
print(array3[range4])
