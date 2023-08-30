
let str = "Hello World"
print(str)
let first = str.startIndex
let fifth = str.index(first, offsetBy:4)
print("take from \(str[first]) to \(str[fifth])")

let subStr = str[first...fifth]
print(subStr)
print(type(of:subStr))

let stringFromSub = String(subStr)
print("string from substring:")
print(stringFromSub)
print(type(of:stringFromSub))
print()

let seventh = str.index(fifth, offsetBy:2)
print("take from \(str[seventh]) to the end")
let subStr1 = str[seventh...]
print(subStr1)
print()

print("from start to \(str[seventh])")
let subStr2 = str[...seventh]
print(subStr2)
print()
