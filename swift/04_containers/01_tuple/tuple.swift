let a = ("Hello", 12.54, true)
print(a)
print(type(of:a))

let b : (Character, Float, Bool) = ("H", 12.54, true)
print(b)
print(type(of:b))
print()

// tuple with any type
typealias FlaggedValue = (Any, Bool)
let c : FlaggedValue = ("Hello", true)
let d : FlaggedValue = (15, true)
let valF : Float = 22.1
let e : FlaggedValue = (valF, true)
print(c, type(of:c))
print(d, type(of:d))
print(e, type(of:e))
print()

// create variables from tuple values
let f = ("Hello World!", 100, true)
let (message, code, status) = f
print(message)
print(code)
print(status)

// initialization with tuple literal
let (name, age, id) = ("John", 30, "232331")
print("employee: \(name), \(age) with id - \(id)")

// ignore some values
let g = ("Hello!", 223.1, false)
let (msg, _, _) = g
print("msg:", msg)
print()

// reach values through indexes
let h = ("Hello", 22.345, "World", false, -12)
print(h)
print(h.0)
print(h.1)
print(h.2)
print(h.3)
print(h.4)
print()

// reach values through names
let i : (message: String, status: Bool) = ("Hello", true)
print(i)
print(i.message)
print(i.status)
let j = (coef : 22.1, code : 100)
print(j)
print(j.coef)
print(j.code)
let k = (message: "message is ...", _ : 100, _ : false)
print(k)
print(k.message)
print(k.1)
print(k.2)
print()

// assign tuples
var t1 = (100, true)
print("t1:", type(of:t1), t1)
let t2 = (200, false)
print("t2:", type(of:t2), t2)
t1 = t2
print("t1:", type(of:t1), t1)
print()

// edit tuple
var t3 = ("Hello", 200)
print(t3)
t3.0 = "World"
t3.1 = 2
print(t3)
var t4 = (name: "John", age: 40)
print(t4)
t4.name = "Jacob"
t4.age = 38
print(t4)
print()

// comparison
let l = (1, "abc")
let m = (2, "bcd")
// compare first elements
print(l, "<", m, l < m)
let n = (3, "abc")
let o = (3, "bcd")
// compare second elements
print(n, "<", o, n < o)
let p = (3.14, true)
let q = (3.14, true)
// equal
print(p, "==", q, p == q)

