let str = "Hello"
print(type(of:str))
print(str)

print("count:", str.count)
print()

// error!
//print(str[2])

// Unicode - scalar
let char : Character = "\u{E9}" // without "Character", we get "String" type
print(type(of:char))
print(char)

let anotherChar : Character = "\u{65}\u{301}"
print(anotherChar)
print("combined from \u{65} and  \u{301}")

print("compare chars above:")
print(char == anotherChar)
print()

let thumbsUp : Character = "\u{1f44d}"
print(thumbsUp)
let blackSkin : Character = "\u{1f3fd}"
print(blackSkin)
let blackThumbsUp : Character = "\u{1f44d}\u{1f3fd}"
print(blackThumbsUp)
print()

let cafe1 = "caf\u{E9}"
print(cafe1, "count:", cafe1.count)
let cafe2 = "cafe\u{301}"
print(cafe2, "count:", cafe2.count)
print(cafe1 == cafe2)
print()

let name = "e\u{301}lastic"
print(name)
let index = name.startIndex
print(type(of:index))
print(index)
let ch = name[index]
print(type(of:ch))
print(ch)
print()

var string = "Hello World"
print(string)
let idx = string.endIndex
string.insert("!", at:idx)
print(string)
print("before end:")
let beforeEnd = string.index(before: string.endIndex)
print(string[beforeEnd])
print("after start:")
let afterStart = string.index(after: string.startIndex)
print(string[afterStart])
print("five char:")
let fiveIdx = string.index(string.startIndex, offsetBy:4)
print(string[fiveIdx])
print()

print("Moldova anthem:")
print()
print("case 1: use \u{103}")
let anthemName1 = "Limba Noastr\u{103}"
print(anthemName1)
print("case 2: use a +  \u{306}")
let anthemName2 = "Limba Noastra\u{306}"
print(anthemName2)
print()

print("for case 1:")
print(".count:", anthemName1.count)
let scalars1 = anthemName1.unicodeScalars
print(type(of:scalars1))
print(scalars1)
print(".unicodeScalars.count", scalars1.count)

print("for case 2:")
print(".count:", anthemName2.count)
let scalars2 = anthemName2.unicodeScalars
print(type(of:scalars2))
print(scalars2)
print(".unicodeScalars.count", scalars2.count)
