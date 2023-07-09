// half-open range, binary form

let range = 1..<10
print(range)
print(type(of:range))
for i in range {
    print(i, terminator:" ")
}
print()
print()

//-----------------------------------------------------------------------------

let range1 = "a"..<"z"
print(range1)
print(type(of:range1))
// below is not working since String is not Strideable
//for i in range1 {
//    print(i)
//}

// but we can use range for checking values
let value1 = "c"
if range1.lowerBound < value1 && value1 < range1.upperBound {
    print(value1, "within", range1)
}
else {
    print(value1, "is not within", range1)
}
if range1.contains(value1) {
    print(range1, "contains", value1)
}
else {
    print(range1, "doesn't contain", value1)
}
let value2 = "C"
if range1.lowerBound < value2 && value2 < range1.upperBound {
    print(value2, "within", range1)
}
else {
    print(value2, "is not within", range1)
}
if range1.contains(value2) {
    print(range1, "contains", value2)
}
else {
    print(range1, "doesn't contain", value2)
}


// same range but with Chraracter
let range2 : Range<Character> = "a"..<"z"
print(range2)
print(type(of:range2))
// not Strideable
//for i in range2 {
//    print(i)
//}

// cheching Character value
let ch = Character(value1) // "c"
if range2.contains(ch) {
    print(ch, "in", range2)
}
print()


let range3 : Range<Double> = 1.0..<5.0
print(range3)
print(type(of:range3))
// below is not working
// Double is Strideable, but 
// Double.Stride (A type that represents the distance between two values) 
// is Double - it is not conform SignedInteger
//for i in range3 {
//    print(i)
//}
let dbl1 = 0.9
let dbl2 = 3.212
let dbl3 = 5.0
if range3.contains(dbl1) {
    print(range3, "contains", dbl1)
}
else {
    print(range3, "doesn't contain", dbl1)
}
if range3.contains(dbl2) {
    print(range3, "contains", dbl2)
}
else {
    print(range3, "doesn't contain", dbl2)
}
if range3.contains(dbl3) {
    print(range3, "contains", dbl3)
}
else {
    print(range3, "doesn't contain", dbl3)
}
print()

//-----------------------------------------------------------------------------

// half-open range, prefix form

let range4 = ..<10
print(range4)
print(type(of:range4))

let val1 = -100
let val2 = 0
let val3 = 10
if range4.contains(val1) {
    print(range4, "contains", val1)
}
else {
    print(range4, "doesn't contain", val1)
}
if range4.contains(val2) {
    print(range4, "contains", val2)
}
else {
    print(range4, "doesn't contain", val2)
}
if range4.contains(val3) {
    print(range4, "contains", val3)
}
else {
    print(range4, "doesn't contain", val3)
}
print()

//-----------------------------------------------------------------------------

// closed range, binary form

let range5 = 1...10
print(range5)
print(type(of:range5))
for i in range5 {
    print(i, terminator:" ")
}
print()
print()

//-----------------------------------------------------------------------------

// closed range, postfix form

let range6 = 100...
print(range6)
print(type(of:range6))

let val4 = 99
let val5 = 100
let val6 = Int.max
if range6.contains(val4) {
    print(range6, "contains", val4)
}
else {
    print(range6, "doesn't contain", val4)
}
if range6.contains(val5) {
    print(range6, "contains", val5)
}
else {
    print(range6, "doesn't contain", val5)
}
if range6.contains(val6) {
    print(range6, "contains", val6)
}
else {
    print(range6, "doesn't contain", val6)
}

let range7 = 3...
let array = [100, 200, 300, 400, 500, 600, 700]
print("append range", range7)
print("to array", array)
print( array[range7] )
print()

//-----------------------------------------------------------------------------

// closed range, prefix form

let range8 = ...3
print("append range", range8)
print("to array", array)
print( array[range8] )
print()


