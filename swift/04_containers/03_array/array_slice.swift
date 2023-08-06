let array = Array(1...10)
print(array)
print(type(of:array))

let slice = array[2...5]
print(slice)
print(type(of:slice))
print()

var mutableArray = Array(1...10)
print("array:", mutableArray)
let sliceStart = 2
let sliceFinish = 5
var slice1 = mutableArray[sliceStart...sliceFinish]
print("slice:", slice1)
print("slice indexes:")
print("[", terminator:" ")
for i in sliceStart...sliceFinish {
    print(i, terminator:" ")
}
print("]")
for i in sliceStart...sliceFinish {
    slice1[i] = 10
}
print("slice after modifying:", slice1)
print("array", mutableArray)
print()

print("array:", mutableArray)
var slice2 = mutableArray[sliceStart...sliceFinish]
print("slice:", slice2)
mutableArray.removeAll()
print("after array removal:")
print(mutableArray)
print("slice:", slice2)
print()

mutableArray = Array(1...10)
print(mutableArray)
let part1 = mutableArray.dropFirst(3)
print(part1)
print(type(of:part1))
// below string doesn't work
//let part2: Array<Int> = mutableArray.dropFirst()
let part2: Array<Int> = Array( mutableArray.dropFirst() )
print(part2)
print(type(of:part2))
