import Foundation

let count = 25

var a : Float = 0
for _ in 1...count {
    a += 0.1
}

print("a =", a)

var b : Double = 0
for _ in 1...count {
    b += 0.1
}

print("b =", b)

var c : Decimal = 0
for _ in 1...count {
    c += 0.1
}

print("c =", c)
