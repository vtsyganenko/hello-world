// we assert some statement, if it false -> stop and print message

// assert(_:_:)
// assert(condition:Bool, message:String)

let value = 10

print("start with value", value)

assert(value > 0, "error: value <= 0")

print("first assertion passed")

assert(value > 10, "error: value <= 10")

print("second assertion passed")
