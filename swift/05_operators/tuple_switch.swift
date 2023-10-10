// tuple in switch

func printAnswer(_ answer:(code:Int, message:String)) {
    print("for code \(answer.code) and message \(answer.message)")
    switch answer {
        case (100..<400, _):
            print("status ok")
        case (400..<500, _):
            print("status fail")
        default:
            print("wrong answer!")
    }
}

printAnswer((100, "Success"))
printAnswer((404, "Not found"))
printAnswer((509, ""))
print()

func printGateForTruck(truckInfo truck:(foreign:Bool, weight:Float)) {
    print("for \(truck.foreign ? "foreign":"national") truck with weight \(truck.weight), gate is", terminator:" ")
    switch truck {
        case (false, 0..<3):
            print("A")
        case (true, 0..<3):
            print("B")
        case (_, 3..<5):
            print("C")
        default:
            print("access denied")
    }
}

printGateForTruck(truckInfo:(false, 2.2))
printGateForTruck(truckInfo:(true, 2.9))
printGateForTruck(truckInfo:(false, 3))
printGateForTruck(truckInfo:(true, 3.2))
printGateForTruck(truckInfo:(true, 6.2))
printGateForTruck(truckInfo:(false, 6.2))
print()

// use "where" keyword

var gateCCounter = 0

func printCountedGateForTruck(_ truck:(foreign:Bool, weight:Float)) {
    print("for \(truck.foreign ? "foreign":"national") truck with weight \(truck.weight), gate is", terminator:" ")
    switch truck {
        case (false, 0..<3):
            print("A")
        case (true, 0..<3):
            print("B")
        case (_, 3..<5) where gateCCounter < 5:
            print("C")
            gateCCounter += 1
        default:
            print("access denied")
    }
}

printCountedGateForTruck((true, 3.1))
printCountedGateForTruck((false, 3.2))
printCountedGateForTruck((true, 3.3))
printCountedGateForTruck((false, 3.4))
printCountedGateForTruck((true, 3.5))
printCountedGateForTruck((false, 3.6))
printCountedGateForTruck((true, 3.7))
print()

// values connection (связывание значений)

func printCountedGateForTruckVer2(_ truck:(foreign:Bool, weight:Float)) {
    print("for \(truck.foreign ? "foreign":"national") truck with weight \(truck.weight), gate is", terminator:" ")
    switch truck {
        case (false, 0..<3):
            print("A")
        case (true, 0..<3):
            print("B")
        case (_, 3..<5) where truck.weight.truncatingRemainder(dividingBy:1) == 0 && gateCCounter < 5:
            print("C")
            gateCCounter += 1
        default:
            print("access denied")
    }
}

gateCCounter = 0
printCountedGateForTruckVer2((true, 3.0))
printCountedGateForTruckVer2((false, 3.2))
printCountedGateForTruckVer2((true, 3.5))
printCountedGateForTruckVer2((false, 3.6))
printCountedGateForTruckVer2((true, 4.0))
printCountedGateForTruckVer2((false, 4.2))
printCountedGateForTruckVer2((true, 4.5))
print()

func printCountedGateForTruckVer3(_ truck:(foreign:Bool, weight:Float)) {
    print("for \(truck.foreign ? "foreign":"national") truck with weight \(truck.weight), gate is", terminator:" ")
    switch truck {
        case (false, 0..<3):
            print("A")
        case (true, 0..<3):
            print("B")
        case (_, let weight) where weight >= 3 && weight < 5 
        && weight.truncatingRemainder(dividingBy:1) == 0 && gateCCounter < 5:
            print("C")
            gateCCounter += 1
        default:
            print("access denied")
    }
}

gateCCounter = 0
printCountedGateForTruckVer2((true, 3.0))
printCountedGateForTruckVer2((false, 3.2))
printCountedGateForTruckVer2((true, 3.5))
printCountedGateForTruckVer2((false, 3.6))
printCountedGateForTruckVer2((true, 4.0))
printCountedGateForTruckVer2((false, 4.2))
printCountedGateForTruckVer2((true, 4.5))
print()
