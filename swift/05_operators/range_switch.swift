// range in switch

func printExamResult(_ mark:Int) {
    print("for mark \(mark), result is:", terminator:" ")
    switch mark {
        case 1..<3:
            print("exam failed")
        case 3:
            print("additional task")
        case 4...5:
            print("exam passed")
        default:
            print("wrong mark!")
    }
}

printExamResult(2)
printExamResult(3)
printExamResult(5)
printExamResult(10)
print()

// use if/else for example

let failedExamRange = (1..<3)
let additionalExamInt = 3
let passedExamRange = (4...5)

func printExamResult2(_ mark:Int) {
    print("for mark \(mark), result is:", terminator:" ")
    if failedExamRange.contains(mark) {
        print("exam failed")
    }
    else if additionalExamInt == mark {
        print("additional task")
    }
    else if passedExamRange.contains(mark) {
        print("exam passed")
    }
    else {
        print("wrong mark!")
    }
}

printExamResult(2)
printExamResult(3)
printExamResult(5)
printExamResult(10)
print()
