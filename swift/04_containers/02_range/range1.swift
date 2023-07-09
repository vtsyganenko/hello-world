let range1 = 1...10
print(range1)
print("count is", range1.count)
let range2 = 1..<10
print(range2)
print("count is", range2.count)
print()

let range3 : ClosedRange<Float> = 1.0...2.0
print("range", range3, "contains -1.0", range3.contains(-1.0))
print("range", range3, "contains 0.0", range3.contains(0.0))
print("range", range3, "contains 1.0", range3.contains(1.0))
print("range", range3, "contains 1.4", range3.contains(1.4))
print("range", range3, "contains 2.0", range3.contains(2.0))
print()

let range4 = 0..<0
print(range4)
print("count", range4.count)
print("isEmpty", range4.isEmpty)
let range5 = 5..<5
print(range5)
print("count", range5.count)
print("isEmpty", range5.isEmpty)
let range6 = 0...0
print(range6)
print("count", range6.count)
print("isEmpty", range6.isEmpty)
let range7 = 5...5
print(range7)
print("count", range7.count)
print("isEmpty", range7.isEmpty)
print()

let range8 : ClosedRange<Float> = 5.2...5.5
print(range8)
print("lower bound", range8.lowerBound)
print("upper bound", range8.upperBound)
print()

let range9 = 10..<100
print(range9)
print("lower bound", range9.lowerBound)
print("upper bound", range9.upperBound)
print("min value", range9.min()!)
print("max value", range9.max()!)
print()

let range10 = UInt8(1)...
print(range10)
// crash after i reach 255 and tries to +1
//for i in range10 {
//    print(i, terminator:" ")
//}
print()

// Closed ranges are Hashable
let range11 = 1...10
print(range11)
print("hash value:", range11.hashValue)
print()

// Closed ranges are Equatable
let range12 = 1...10
let range13 = 1...11
print(range11, "==", range12, range11 == range12)
print(range11, "==", range13, range11 == range13)
print()

// All ranges are not Comparable
// it means that we unable to compare ranges
// with <, <=, >, >=
