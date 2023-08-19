// operations with sets

let oddDigits: Set = [1, 3, 5, 7, 9, 11]
print("odd:", oddDigits.sorted())
let evenDigits: Set = [2, 4, 6, 8, 10, 12]
print("even:", evenDigits.sorted())
let differentDigits = Set(3..<10)
print("different digits:", differentDigits.sorted())
print()

print("intersection:")
print("odd and different:", oddDigits.intersection(differentDigits))
print("even and different:", evenDigits.intersection(differentDigits))
print("even and odd:", evenDigits.intersection(oddDigits))
print()

print("symmetricDifference:")
print("between odd and different:", oddDigits.symmetricDifference(differentDigits))
print("between even and different:", evenDigits.symmetricDifference(differentDigits))
print("between even and odd:", evenDigits.symmetricDifference(oddDigits))
print()

print("union:")
print("odd and even:", oddDigits.union(evenDigits), terminator:" ")
print("sorted:", oddDigits.union(evenDigits).sorted())
print()

print("subtracting:")
print("odd - different =", oddDigits.subtracting(differentDigits))
print("different - odd =", differentDigits.subtracting(oddDigits))
print("even - different = ", evenDigits.subtracting(differentDigits))
print("different - even =", differentDigits.subtracting(evenDigits))
print("odd - even =", oddDigits.subtracting(evenDigits))
print("even - odd =", evenDigits.subtracting(oddDigits))
print()

// relations

let set1 = Set(1...3)
let set2 = Set(0...5)
print("set1:", set1.sorted())
print("set2:", set2.sorted())
let set3 = set1
print("set3:", set3.sorted())

print("set1 == set2", set1 == set2)
print("set1 == set3", set1 == set3)
print()

let set4 = Set(arrayLiteral: 4, 5, 6, 7)
print("set4:", set4.sorted())
print("set1 is subset of set2", set1.isSubset(of:set2))
print("set2 is subset of set1", set2.isSubset(of:set1))
print("set2 is subset of set4", set2.isSubset(of:set4))
print("set4 is subset of set2", set4.isSubset(of:set2))
print()

print("set1 is superset of set2", set1.isSuperset(of:set2))
print("set2 is superset of set1", set2.isSuperset(of:set1))
print("set4 is superset of set2", set4.isSuperset(of:set2))
print("set2 is superset of set4", set2.isSuperset(of:set4))
print()

print("set1 is disjoint with set2", set1.isDisjoint(with: set2))
print("set2 is disjoint with set1", set2.isDisjoint(with: set1))

print("set1 is disjoint with set4", set1.isDisjoint(with: set4))
print("set4 is disjoint with set1", set4.isDisjoint(with: set1))

print("set2 is disjoint with set4", set2.isDisjoint(with: set4))
print("set4 is disjoint with set2", set4.isDisjoint(with: set2))
print()

let setA = Set(1...3)
print("setA", setA.sorted())
let setB = setA
print("setB", setB.sorted())
let setC = Set(0...5)
print("setC", setC.sorted())
let setD = setC
print("setD", setD.sorted())

print("setA == setB", setA == setB)
print("setA isSubset of setB", setA.isSubset(of:setB))
print("setA isStrictSubset of setB", setA.isStrictSubset(of:setB))
print("setA isStrictSubset of setC", setA.isStrictSubset(of:setC))
print()

print("setC == setD", setC == setD)
print("setC isSuperset of setD", setC.isSuperset(of:setD))
print("setC isStrictSuperset of setD", setC.isStrictSuperset(of:setD))
print("setC isStrictSuperset of setA", setC.isStrictSuperset(of:setA))
print()

// sorted()
let set = Set(1...5)
print("set", set)
print(type(of:set))
let sorted = set.sorted()
print("sorted", sorted)
print(type(of:sorted))
print()
