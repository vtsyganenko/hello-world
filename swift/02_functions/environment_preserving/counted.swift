
func countAdder(_ f: @escaping ()->()) -> ()->() {
    var counter = 0
    return {
        counter += 1
        print("counter = \(counter)")
        f()
    }
}

func greet() {
    print("Hello!")
}

let countedGreet = countAdder(greet)

countedGreet()
countedGreet()
countedGreet()
