// insert

var set1: Set = ["a", "b", "c", "d", "e"]
print(set1)
print(type(of:set1))
set1.insert("Hello")
print(set1)
var res = set1.insert("World")
print("inserted \"World\" with result")
print(res)
print(type(of:res))
print(set1)
res = set1.insert("Hello")
print("inserted \"Hello\" with result")
print(res)
print(type(of:res))
print(set1)
print()

// remove

print("remove \"World\":")
var result = set1.remove("World")
print(result ?? "nil")
print(set1)
print("remove \"Name\":")
result = set1.remove("Name")
print(result ?? "nil")
print(set1)
print("remove all:")
set1.removeAll()
print(set1)
print()

// count and contains

var set2: Set = [10, 20, 30, 40, 50]
print(set2)
print("count:", set2.count)
print("contains(30)", set2.contains(30))
print("contains(35)", set2.contains(35))
set2.remove(30)
print("after removal 30:", set2)
print("count:", set2.count)
print("contains(30)", set2.contains(30))
print()
