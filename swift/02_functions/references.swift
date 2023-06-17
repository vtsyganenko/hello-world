
class Dog {
    func bark() {
        print("bark!")
    }
    func bark(_ loudly:Bool) {
        if loudly {
            print("BARK!")
        }
        else {
            print("bark!")
        }
    }
}

let d = Dog()

// for the function with Bool, we have two ways:
// full name
let f1 = d.bark(_:)
f1(true)
// bare name + signature
let f11 = d.bark as (Bool) -> ()
f11(true)

// for the function without arguments - only second way
let f2 = d.bark as () -> ()
f2()

//---------------------------------------------------------------------------------------
print()

class Cat {
    func meow() {
        print("meow!")
    }
    func meow(_ loudly:Bool) {
        if loudly {
            print("MEOW!")
        }
        else {
            print("meow!")
        }
    }
    func meow(_ times:Int) {
        for _ in 0...times {
            print("meow", terminator:" ")
        }
        print()
    }
}

let c = Cat()

// only second way since there are two functions with one parameter _

let f3 = c.meow as () -> ()
f3()
let f4 = c.meow as (Bool) -> ()
f4(true)
let f5 = c.meow as (Int) -> ()
f5(5)

//---------------------------------------------------------------------------------------
print()

class Bird {
    let cat = Cat()

    func tweet() {
        print("tweet!")
    }
    func tweet(_ loudly:Bool) {
        if loudly {
            print("TWEET!")
        }
        else {
            print("tweet!")
        }
    }
    func test() {
        // f wraps function (example from book)
        let f = {
            // have to use self here
            return self.tweet(_:)
        }
        f()(true)
        f()(false)

        // cat required here
        let f1 = cat.meow as (Int) -> ()
        f1(5)
    }
}

let b = Bird()
b.test()
