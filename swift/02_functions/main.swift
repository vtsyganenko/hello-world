// print()

let a = 10
let b = 22.31
let c = true
print("a =", a, "b =", b, "c =", c)
print("a = \(a) b = \(b) c = \(c)")


// return values
print()

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


// external parameter names
print()

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


// function with two parameters
print()

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


// overloading
print()

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


// default parameters values
print()

func incrementValue(_ value:Int, times n:Int = 1) -> Int {
    var result = value // since value is let
    for _ in 1...n { result += 1 }
    return result
}

print("increment 10 ->", incrementValue(10))
print("increment 20 four times ->", incrementValue(20, times:4))


// variadic parameters
print()

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


// ignored parameters
print()

func f9(_ string:String, loudly _:Bool) {
    print(string)
    // variable with external name "loudly" has no name and unable to use
}

// f9("Hello") - ERROR
f9("Hello", loudly:true)


// modifiable parameters
print()

func removeCharacter(_ c:Character, from s: inout String) -> Int {
    var count = 0
    while let index = s.firstIndex(of:c) {
        s.remove(at:index)
        count += 1
    }
    return count
}

var str = "Hell1o 1Wo1rld!1"
let ch : Character = "1"
print("remove character", ch, "from", str)
let count = removeCharacter(ch, from:&str)
print("count:", count, "result:", str)

class Dog {
    var name = ""

    func printName() {
        print(name)
    }
}

func changeName(of dog:Dog, to newName:String) {
    d.name = newName
}

let d = Dog()
d.name = "Fido"
d.printName()
changeName(of:d, to:"Rover")
d.printName()

func getDog(_ dog: inout Dog, withName name:String) {
    dog = Dog()
    dog.name = name
}

var dog = Dog()
dog.name = "Barbos"
dog.printName()
getDog(&dog, withName:"Sharik")
dog.printName()


// function in function
print()

func f10() {
    func f() {
        print("Hello from f")
    }

    f()
}

f10()


// recursion
print()

func countDownFrom(_ x:Int) {
    print(x)
    if x > 0 {
        countDownFrom(x-1)
    }
}

countDownFrom(5)


// function as value
print()

func f11(_ f:(Int) -> ()) {
    f(10)
    f(11)
    f(12)
}

func funcForPassing(_ val:Int) {
    print("funcForPassing has value", val)
}

f11(funcForPassing)

typealias Calculation = (Int, Int) -> Int
func f12(_ calc:Calculation) {
    //...
    print("result is \(calc(10, 20))")
}

func formula(_ val1:Int, _ val2:Int) -> Int {
    return (val1 + val2) * 2
}

f12(formula)
