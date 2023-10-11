
func printPositiveValue(_ value:Int) {
    guard value > 0 else { return }
    print("positive value is", value)
}

printPositiveValue(10)
printPositiveValue(-5)
printPositiveValue(20)
print()

let array = [-2, 10, 0, 5, -3, -12, 1, 4, -8]
print(array)
var positiveSum = 0
for val in array {
    guard val > 0 else {
        continue
    }
    print("add value", val)
    positiveSum += val
}
print("positiveSum", positiveSum)
