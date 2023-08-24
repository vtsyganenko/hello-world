// methods

var dict = ["One":1, "Two":2, "Four":4]
print(type(of:dict))
print(dict)

print(".count", dict.count)
print(".isEmpty", dict.isEmpty)
print()

var emptyDict : [Int:String] = [:]
print(type(of:emptyDict))
print(emptyDict)

print(".count", emptyDict.count)
print(".isEmpty", emptyDict.isEmpty)
print()

print("all keys:")
let keys = dict.keys
print(type(of:keys))
print(keys)
print("all values:")
let values = dict.values
print(type(of:values))
print(values)
print()

let keysSet = Set(dict.keys)
print(type(of:keysSet))
print(keysSet)
let valuesArray = Array(dict.values)
print(type(of:valuesArray))
print(valuesArray)
print()
