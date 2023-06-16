
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
