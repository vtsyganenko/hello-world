// 1. force unwrapping

var value1: Int? = 100
var result = 200 + value1!
print("result", result)

var value2: Int? // nil
// this provide error since optional contains nil
//result = 200 + value2!
print()

// 2. implicitly unwrapping

var value3: Int! = 250 // we sure that value will be here
result = 300 - value3
print("result", result)
print()

// 3. nil coalescing

var value4: Int? = 1000
result = 5 * (value4 ?? 1)
print("result", result)

var value5: Int? // nil
result = 5 * (value5 ?? 1)
print("result", result)
print()

// 4. optional binding
var message: String? // nil
if let msg = message {
    print("message is", msg)
}
else {
    print("no message!")
}

message = "Hello World!"
if let msg = message {
    print("message is", msg)
}
else {
    print("no message!")
}
print()

// another example

var coefficient: Double? = 12.45
if let coef = coefficient, coef > 10 {
    print("use coefficient", coef)
}
else {
    print("don't use coefficient!")
}
