let str1 = "1000"
let val1 = Int(str1)
print(type(of:val1))
print("for string \"\(str1)\" int value is \(val1)")
print()

let str2 = "100.25"
let val2 = Int(str2)
print(type(of:val2))
print("for string \"\(str2)\" int value is \(val2)")
print()

let str3 = "thousand"
let val3 = Int(str3)
print(type(of:val3))
print("for string \"\(str3)\" int value is \(val3)")
print()

let val4 = Double(str2)
print(type(of:val4))
print("for string \"\(str2)\" double value is \(val4)")
print()
print()


// creating optional

var optionalValue1: Optional<String> = "Hello"
print(type(of:optionalValue1))
print(optionalValue1)
var optionalValue2: String? = "World"
print(type(of:optionalValue2))
print(optionalValue2)
