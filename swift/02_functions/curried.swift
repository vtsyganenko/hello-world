
let a1 = 20
let a2 = 40

// without currying

func f1(_ a1:Int, _ a2:Int) -> Int {
    return (a1 * 2) + a2;
}

print("f1 =", f1(a1, a2) )

// function curriedF1 takes Int and return
// function which takes Int and return Int
func curriedF1(_ a1:Int) -> (Int) -> (Int) {
    let a = a1 * 2
    return {
        (a2:Int) -> (Int) in
        return a + a2
    }
}

print("curried f1 =", curriedF1(a1)(a2) )

//---------------------------------------------------------------------------------------

let v1 = 20
let v2 : Float = 2.5
let v3 = true

// without currying

func f2(_ v1:Int, _ v2:Float, _ v3:Bool) -> Float {
    var val = (Float(v1) * 10.0) / v2
    if v3 {
        val *= -1
    }
    return val
}

print("f2 =", f2(v1, v2, v3) )

// with currying

// function curriedF2 takes Int and return
// function which takes Float and return
// function which takes Bool and return Float
func curriedF2(_ v1:Int) -> 
    (Float) -> (Bool) -> (Float) {
    var val = Float(v1) * 10.0
    return {
        (v2:Float) -> (Bool) -> (Float) in
        val = val / v2
        return {
            (v3:Bool) -> (Float) in
            if v3 {
                val *= -1
            }
            return val
        }
    }
}

print("curried f2 =", curriedF2(v1)(v2)(v3) )
