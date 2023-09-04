// we assert some statement, if it false -> stop and print message

// assert(_:_:)
// assert(condition:Bool, message:String)

let a = 10
let b = -2

print("started")

assert(a * b < 0)

print("first assertion passed")

assert(a / b > 0)

print("second assertion passed")
