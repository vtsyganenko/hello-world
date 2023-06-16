// 1. anonymous functions

class ValueWrapper : CustomStringConvertible {
    var value = 0

    init() {
    }

    init(_ val:Int) {
        value = val
    }

    var description: String {
        return "[value \(self.value)]"
    }
}

func printArray(_ array:Array<ValueWrapper>, withLabel label:String = "") {
    if(!label.isEmpty) {
        print(label)
    }
    for i in 0...array.count-1 {
        print(array[i], terminator:" ")
    }
    print()
}

// create array of objects
var array : Array<ValueWrapper> = Array()
for i in 1...10 {
    array.append(ValueWrapper(i))
}
printArray(array, withLabel:"before:")

func predicateDescending(_ obj1:ValueWrapper, _ obj2:ValueWrapper ) -> Bool {
    return obj1.value > obj2.value
}

// use regular function
array.sort(by:predicateDescending)

printArray(array, withLabel:"after:")

// return ascending order
array.reverse()
printArray(array, withLabel:"before:")

// use anonymous function
array.sort( by:{
    (obj1:ValueWrapper, obj2:ValueWrapper) -> Bool in
    return obj1.value > obj2.value
})

printArray(array, withLabel:"after:")

// return ascending order
array.reverse()

//---------------------------------------------------------------------------------------

// 2. abbreviated syntax for anonymous functions
print()

// receive anonymous function
func doForAllElements(_ array:Array<ValueWrapper>, _ f:(ValueWrapper) -> (Void)) {
    for obj in array {
        f(obj)
    }
}


// regular call
doForAllElements(array, {
    (obj:ValueWrapper) -> (Void) in
    obj.value += 1
})
printArray(array)

// 2.1 omit return type

doForAllElements(array, {
    (obj:ValueWrapper) in
    obj.value -= 1
})
printArray(array)

// 2.2 omit "in" if there are no parameters

func doIt(_ f:() -> (Int)) {
    print("doIt() with result \(f())")
}

doIt({
    let a = 10 + 20
    return a
})

// 2.3 omit type of parameters
doForAllElements(array, {
    (obj) in
    obj.value += 2
})
printArray(array)

// 2.4 omit parameter parentheses
doForAllElements(array, {
    obj in
    obj.value += 1
})
printArray(array)

// 2.5 omit "in" even with parameters
doForAllElements(array, {
    $0.value *= 2
})
printArray(array)

// 2.6 omit name for unused parameters
doForAllElements(array, {
    _ in
    print("Hello", terminator:" ")
})
print()
printArray(array)

// 2.7 omit the argument label

func forAllElements(ofArray array:Array<ValueWrapper>, do function:(ValueWrapper) -> (Void)) {
    for obj in array {
        function(obj)
    }
}

// regular call of anonymous function
forAllElements(ofArray:array, do:{
    (obj:ValueWrapper) -> () in
    obj.value += 1
})

printArray(array)

// with trailing closure
forAllElements(ofArray:array)
{
    (obj:ValueWrapper) -> () in
    obj.value += 1
}

printArray(array)

// 2.8 omit the parentheses when we call the function with only one argument

func doThis(_ f:() -> ()) {
    f()
}

doThis {
    print("Hello!")
}

// 2.9 omit return keyword

func printThisMessage(_ f:() -> String) {
    print(f())
}

printThisMessage({
    "Hello from f!"
})

//---------------------------------------------------------------------------------------

// 3. define-and-call
print()

func workWithWrapper(object obj:ValueWrapper) {
    print("workWithWrapper with value", obj.value)
}

// regular call
let obj1 = ValueWrapper()
obj1.value = 20
workWithWrapper(object:obj1)

// use define-and-call
workWithWrapper(object:{
    let obj = ValueWrapper()
    obj.value = 40
    return obj
}()
)
