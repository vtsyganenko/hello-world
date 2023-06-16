class MyClass {
    var value = 0

    func printVal() {
        print("MyClass object value is", value)
    }

    func getFunction(_ f: @escaping (Int) -> ()) -> () -> () {
        return {
            self.value = 10
            self.printVal()
            f(self.value)
        }
    }
}

func f1(_ i:Int) {
    print("f1(\(i))")
}

let result = MyClass().getFunction(f1)
result()
