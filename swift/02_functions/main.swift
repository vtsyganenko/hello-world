// return values

func f1() {
    print("f1() has no parameters and return statements")
}

func f2() -> Void {
    print("f2() has no parameters and return statements")
}

func f3() -> () {
    print("f3() has no parameters and return statements")
}

func f4() -> Int {
    return 4
}

// swift 5.1 allows skip "return"
func f5() -> Bool {
    true
}

f1()
f2()
f3()
print("f4() result", f4())
print("f5() result", f5())
print()

// external parameter names

// suppress external name
func f6(_ line:String) {
    print("f6 prints line:", line)
}

// set external name
func f7(lineForPrint line:String) {
    print("f7 prints line:", line)
}

// external name == internal name
func f8(line:String) {
    print("f8 prints line:", line)
}

f6("Hello")
f7(lineForPrint:"Hello")
f8(line:"Hello")
print()

// function with two parameters

func sum(_ x:Int, _ y:Int) -> Int {
    return x+y
}

print("10 + 20 =", sum(10,20))

func echoString(_ string:String, times:Int) -> String {
    var result = ""
    for _ in 1...times {
        result += string
    }
    return result
}

print("Hello 4 times:", echoString("Hello", times:4))
print()

// overloading

func printValue(_ val:String) {
    print(val)
}

func printValue(_ val:Int) {
    print(val)
}

// signatures: (String) -> Void and (Int) -> Void
printValue("String")
printValue(100)

func getValue() -> String {
    return "Value"
}

func getValue() -> Int {
    return 10
}

/*
var value = getValue()  // ERROR
*/

let message = "This is the " + getValue()
print(message)
let val : Int = getValue()
print(val)

func receiveStringValue(_ s:String) {
    print(s)
}

receiveStringValue(getValue())
print()

// default parameters values

func incrementValue(_ value:Int, times n:Int = 1) -> Int {
    var result = value // since value is let
    for _ in 1...n { result += 1 }
    return result
}

print("increment 10 ->", incrementValue(10))
print("increment 20 four times ->", incrementValue(20, times:4))
print()

// variadic parameters

func printAll(_ arrayOfStrings:String ...) {
    for s in arrayOfStrings { print(s) }
}

printAll("one", "two", "three", "four")

func printAllWithParams(_ arrayOfStrings:String ..., separator:String = ",", terminator:String = ".") {
    var result = ""
    let end = arrayOfStrings.count - 1
    for i in 0...end {
        if i == end { 
            result += arrayOfStrings[i]
        }
        else {
            result += arrayOfStrings[i] + separator
        }
    }
    result += terminator
    print(result)
}

func printValues(_ arrayOfIntegers:Int ..., terminator:String) {
    var result = ""
    for i in arrayOfIntegers {
        result += String(i) + " "
    }
    result += terminator
    print(result)
}

printAllWithParams("1", "2", "3")
printAllWithParams("1", "2", "3", separator:"_", terminator:"!")
printValues(10, 20, 30, 40, terminator:"end!")
