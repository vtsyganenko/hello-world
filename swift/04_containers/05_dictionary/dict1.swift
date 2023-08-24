// creation with dictionary literal

let dict1 = [100:"a", 200:"b", 300:"c", 400:"d"]
print("dict1:", dict1)
print(type(of:dict1))
let dict2 = ["chef":"John", "waiter":"Phillip", "waitress":"Ann", "porter":"Fred"]
print("dict2:", dict2)
print(type(of:dict2))
print()

// creation with Dictionary(dictionaryLiteral:)

let dict3 = Dictionary(dictionaryLiteral: ("John", true), ("Ann", true), ("Fred", false))
print(type(of:dict3))
print(dict3)
print()

// creation with Dictionary(uniqueKeysWithValues:)

let collection = [("a", 10), ("b", 35), ("c", 28), ("d", 40)]
print(type(of:collection))
let dict4 = Dictionary(uniqueKeysWithValues:collection)
print(type(of:dict4))
print(dict4)

let cities = ["Tula", "NN", "SPB", "Vladimir"]
print(type(of:cities), cities)
let distances = [182.1, 425.2, 703.5, 189.2]
print(type(of:distances), distances)
let dict5 = Dictionary(uniqueKeysWithValues: zip(cities, distances))
print(type(of:dict5))
print(dict5)
print()

// type of dictionary

// implicitly
let d1 = [200:"success", 400:"error"]
// explicitly
let d2 : Dictionary<Int, String> = [200:"success", 400:"error"]
let d3 : [Int:String] = [200:"success", 400:"error"]

// access to elements

var countryCodes = ["BY":"Belarussia", "LT":"Lithuania", "LV":"Latvia", "PL":"Poland"]
print("all codes:", countryCodes)
print("[BY]", countryCodes["BY"] ?? "")
countryCodes["BY"] = "Belarus"
print("fixed codes:", countryCodes)

var code = "EE"
var country = countryCodes[code]
print("country for code \"EE\":", country ?? "no data")
print(type(of:country))

countryCodes[code] = "Estonia"
print("updated codes:", countryCodes)
print()

// update value for key

code = "RU"
var result = countryCodes.updateValue("Russia", forKey:code)
print(type(of:result))
print(result ?? "nil")

countryCodes[code] = "Russian Federation"
print(countryCodes)

result = countryCodes.updateValue("Russia", forKey:code)
print(result ?? "nil")
print(countryCodes)
print()

// removal

print(countryCodes)
countryCodes["LV"] = nil
print(countryCodes)

result = countryCodes.removeValue(forKey:"LV")
print(result ?? "nil")
print(countryCodes)
result = countryCodes.removeValue(forKey:"RU")
print(result ?? "nil")
print(countryCodes)
print()

// empty dictionary

let empty1 : [String:Int] = [:]
print(type(of:empty1))
print(empty1)

let empty2 = Dictionary<String,Int>()
print(type(of:empty2))
print(empty2)

// remove all elements with empty dictionary

print(countryCodes)
countryCodes = [:]
print(countryCodes)
print()

// complex type

let birthYears = [1991: ["John", "Ann"], 1992: ["Alex", "Jeff", "Joan"]]
print(type(of:birthYears))
print(birthYears)

