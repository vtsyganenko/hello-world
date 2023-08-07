// creation

let set1 = [1, 2, 0, 5, 3]  // Array!
print(set1)
print(type(of:set1))

let set2: Set<Int> = [1, 2, 0, 5, 3]
print(set2)
print(type(of:set2))

let set3: Set = [1, 5, 0]
print(set3)
print(type(of:set3))

let set4 = Set<UInt>(arrayLiteral: 10, 20, 30)
print(set4)
print(type(of:set4))

let set5 = Set(arrayLiteral: 100, 200, 300)
print(set5)
print(type(of:set5))
print()

// empty set

let set6: Set<Int> = []
print(set6)
print(type(of:set6))

let set7 = Set<Int>()
print(set7)
print(type(of:set7))

print("remove all by passing []:")
var set8 = Set(arrayLiteral: 1, 2, 3, 4, 5, 6)
print(set8)
set8 = []
print(set8)
print()
