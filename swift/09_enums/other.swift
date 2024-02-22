// properties

enum Smile: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"

    var description: String { return self.rawValue } // should be var!
}

let mySmile = Smile.surprise
print("mySmile", mySmile.description)

enum Constants: Float {
    case pi = 3.14159
    case e = 2.71
    case avogadro = 6.02214076e23

    var value: Float { return rawValue } // should be var!
}

let c1 = Constants.pi
print(c1.value)
let c2: Constants = .avogadro
print(c2.value)

// methods

enum Smile2: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"

    func about() { 
        print("Contains a list of smiles")
    }
}

let smile = Smile2.laugh
smile.about()

// self keyword

enum Smile3: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"

    func descriptionValue() -> Smile3 {
		return self
	}
	func descriptionRawValue() -> String {
		return rawValue // self не обязательно перед rawValue (Swift 5.3)
	}
}

let s1 = Smile3.joy
print(s1.descriptionValue())
let s2 : Smile3 = .laugh
print(s2.descriptionRawValue())

// recursive

enum ArithmeticExpression {
    case addition(Int, Int)         // two associated params
    case subtraction(Int, Int)     // two associated params

    func evaluate() -> Int {
        switch self {
            case .addition(let a, let b):
                return a + b
            case .subtraction(let left, let right):
                return left - right
        }
    }
}

print()
print("recursive:")
let sum1020 = ArithmeticExpression.addition(10, 20)
print(sum1020)
print(sum1020.evaluate())

enum ArithmeticExpression2 {
    case number(Int)    // number provides operand for calculation, if we call evaluate(.number) it returns number value
    indirect case addition( ArithmeticExpression2, ArithmeticExpression2 )      // action (indirect allows action to receive ArithmeticExpression2)
    indirect case subtraction( ArithmeticExpression2, ArithmeticExpression2 )  // action (indirect allows action to receive ArithmeticExpression2)

    func evaluate(_ expression: ArithmeticExpression2? = nil) -> Int {
        switch expression ?? self {
            case let .number( value ):
                return value
            case let .addition( left, right ):
                return evaluate(left) + evaluate(right)
            case let .subtraction( left, right ):
                return evaluate(left) - evaluate(right)
        }
    }
}

let expr = ArithmeticExpression2.addition( .number(20), .subtraction( .number(10), .number(34) ) )
print(expr)
print(expr.evaluate())
