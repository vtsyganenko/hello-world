
class Dog {
    var whatThisDogSays = "woof"

    func bark() {
        print(self.whatThisDogSays)
    }
}

func doThisFunction(_ f:() -> ()) {
    f()
}

// example 1
let d = Dog()
d.whatThisDogSays = "arf"
let barkFunction = d.bark
doThisFunction(barkFunction)    // arf
// or
doThisFunction(d.bark)          // arf

// example 2
let d1 = Dog()
let barkFunc = d1.bark
doThisFunction(barkFunc)    // woof
d1.whatThisDogSays = "arf"
doThisFunction(barkFunc)    // arf


// function returning function
print()

enum Action {
    case plus, minus, mult, div
}

func calculatorMaker(_ action:Action) -> (Int,Int) -> (Int) {
    switch action {
    case .plus:
        func f(_ v1:Int, _ v2:Int) -> Int {
            return v1 + v2
        }
        return f
    case .minus:
        func f(_ v1:Int, _ v2:Int) -> Int {
            return v1 - v2
        }
        return f
    case .mult:
        func f(_ v1:Int, _ v2:Int) -> Int {
            return v1 * v2
        }
        return f
    case .div:
        // reduced code
        return {
            (_ v1:Int, _ v2:Int) -> Int in
            v1 / v2
        }
    }
}

let sum = calculatorMaker(.plus)
print("10 + 20 =", sum(10,20))

let mult = calculatorMaker(.mult)
print("10 * 3 =", mult(10,3))

let div = calculatorMaker(.div)
print("20 / 2 =", div(20,2))


// set a captured value
print()

func pass100(_ f:(Int) -> ()) {
    f(100)
}

var x = 0

func setX(newX:Int) {
    x = newX
}

pass100(setX)
print("x =", x)

// setX(22) error!
setX(newX:22)
print("x =", x)
