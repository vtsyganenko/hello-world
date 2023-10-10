
// keyword "fallthrough" move us to the next case-block

func printEmergencyActions(emergencyLevel lvl:Character) {
    print("for emergency level \(lvl) do:")
    switch lvl {
        case "A":
            print("turn off electricity")
            fallthrough
        case "B":
            print("turn off gas")
            fallthrough
        case "C":
            print("turn off water")
        default:
            break
    }
    print()
}

printEmergencyActions(emergencyLevel: "C")
printEmergencyActions(emergencyLevel: "B")
printEmergencyActions(emergencyLevel: "A")
