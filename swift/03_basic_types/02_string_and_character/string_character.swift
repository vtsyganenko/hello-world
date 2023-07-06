// String type
let a = "Hello"
let b : String = "World"

print("type of \"a\" is", type(of:a))
print("type of \"b\" is", type(of:b))
print()

// Character type
let c = "c"                 // this is String !
let d : Character = "d"

print("type of \"c\" is", type(of:c))
print("type of \"d\" is", type(of:d))
print()

// empty String
let e = ""
let f = String()
// empty Character is not allowed
//let g : Character = ""
//let h = Character()

print("type of \"e\" is", type(of:e))
print("type of \"f\" is", type(of:f))
print()

// several lines
let lines1 = """
    Hello
    from
    these
    lines
    """

let lines2 = 
    """
    Hello
    from
    these
    lines
"""

let lines3 = 
"""
    Hello
    from
    these
    lines
"""

print(lines1)
print(lines2)
print(lines3)
print()

// casting
let valueInt = 10
let valueDouble = 22.43
let strInt = String(valueInt)
let strDouble = String(valueDouble)
print(valueInt, valueDouble)
print()

// interpolation
let name =  "Dragon"
let meters : Double = 10
let hello = "Hi, my name is \(name)!"
let info1 = "My length is \(meters * 3.28) foots"
print(hello)
print(info1)

// concatenation
let weight : Float = 12.4
let valueType = "tonns"
let info2 = "My weight is " + String(weight) + " " + valueType
print(info2)
print()

// equality
let str1 = "Hello"
let str2 = "World"
let str3 = "Hello"
print("\(str1) == \(str2) : \(str1 == str2)")
print("\(str1) == \(str3) : \(str1 == str3)")
print("\(str1) != \(str2) : \(str1 != str2)")
print("\(str1) != \(str3) : \(str1 != str3)")
print()

// lexicographic comparison
let strA = "abc"
let strB = "bcd"
print("\(strA) > \(strB) : \(strA > strB)")
print("\(strA) < \(strB) : \(strA < strB)")
let strC = "Hello"
let strD = "Hallo"
print("\(strC) > \(strD) : \(strC > strD)")
print("\(strC) < \(strD) : \(strC < strD)")
print()

// unicode scalars
let scal : Character = "\u{041A}"
let scalString = "\u{041A}\u{041B}\u{041C} \u{042A}\u{043A}"
print(scal)
print(scalString)
print()
