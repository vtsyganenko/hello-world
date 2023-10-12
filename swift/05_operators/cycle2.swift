let string = "Hello World!"
for char in string {
    print(char, terminator:" ")
}
print()


let array = [21, 43, 2, -9, 0, 12, 8]
for value in array {
    print(value, terminator:" ")
}
print()


for number in 0...5 {
    print(number+1)
}
print()


let character = "a"
for character in string {
    print(character, terminator:" ")
}
print("character is", character)


for _ in 1...3 {
    print("Hello")
}
print()


var teamsPoints = ["CSKA":18, "Dynamo":15, "Torpedo":17, "Spartak":14]
for (team, pts) in teamsPoints {
    print("team \(team) has \(pts) points")
}
print()


// print array with indexes
for (index, value) in array.enumerated() {
    print("array[\(index)] = \(value)")
}
print()


// stride
for i in stride(from:1, through:10, by:3) {
    print(i, terminator:" ")
}
print()
for i in stride(from:1, to:10, by:3) {
    print(i, terminator:" ")
}
print()


// where in for
print()
for i in 1...10 where i % 2 == 0 {
    print(i)
}
print()


let array2D = [[1,2,3], [4,5,6], [7,8,9]]
for arr in array2D {
    for i in arr {
        print(i, terminator:" ")
    }
    print()
}
print()
