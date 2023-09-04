// сокращенный синтаксис 

let value = 5

if(value > 0) {
    print("\(value) > 0")
}

// need Bool type here
//if(value) {
//    print("\(value)")
//}

let status = true

if(status) {
    print("status is", status)
}

print()

// стандартный синтаксис

if(value > 0) {
    print("value > 0")
}
else {
    print("value < 0")
}

if(!status) {
    print("status is false")
}
else {
    print("status is true")
}

if(value == 5 && status) {
    print("meet both conditions")
}
else {
    print("don't meet both conditions")
}

if(!status || value == 5) {
    print("meet one condition")
}

print()

// расширенный синтаксис

if(value > 10) {
    print("value > 10")
}
else if(value > 0) {
    print("value > 0")
}
else {
    print("value <= 0")
}

// пример

var tenantCount = 6
var rentPrice = 0

if tenantCount < 5 {
    rentPrice = 1000
}
else if tenantCount >= 5 && tenantCount <= 7 {
    rentPrice = 800
}
else {
    rentPrice = 500
}

print("all price for \(tenantCount) tenants", tenantCount * rentPrice)

tenantCount = 9

if (0..<5).contains(tenantCount) {
    rentPrice = 1000
}
else if (5...7).contains(tenantCount) {
    rentPrice = 800
}
else if (8...).contains(tenantCount) {
    rentPrice = 500
}

print("all price for \(tenantCount) tenants", tenantCount * rentPrice)
print()

// тернарный синтаксис

var string1 : Optional<String> = "Hello"
var string2 : Optional<String> = nil

let str1 = string1 != nil ? string1! : "nil!"
print(str1)
let str2 = string2 != nil ? string2! : "nil!"
print(str2)

let a = 10
let b = 20

a > b ? print("\(a) > \(b)") : print("\(a) <= \(b)")
print()

// использование запятой

// отдельные выражения могут быть отделены с помощью запятой, работающей так же как &&
// но
// вычисление происходит по порядку и если одно false, то другие не вычисляются
// результаты вычисления каждого выражения могут быть использованы в последующем

if let a = Int("40"), let b = Int("50"), a < b {
    print("\(a) < \(b)")
}
