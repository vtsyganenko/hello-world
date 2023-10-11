
var i = 0
while i < 10 {
    print(i, terminator:" ")
    i += 1
}
print()

i = 0
repeat {
    print(i, terminator:" ")
    i += 1
} while i < 10
print()

// continue
i = 0
while i < 20 {
    i += 1
    if i % 2 != 0 {
        continue
    }
    print(i, terminator:" ")
}
print()

// break
i = 0
repeat {
    i += 1
    if i >= 10 {
        break
    }
    print(i, terminator:" ")
} while i < 20
print()
