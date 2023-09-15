func printExamInfo(mark examMark:Int) {
    print("for mark \(examMark), result is:", terminator:" ")
    switch examMark {
        case 1,2:
            print("exam failed")
        case 3:
            print("need additional task")
        case 4,5:
            print("exam passed")
        default:
            print("incorrect mark")
    }
}

printExamInfo(mark:2)
printExamInfo(mark:3)
printExamInfo(mark:5)
printExamInfo(mark:10)
print()

func explaneStatus(_ status:String) -> Int {
    let code : Int
    switch status {
        case "ok":
            print("success")
            code = 0
        case "fail":
            print("smf is failed")
            code = -1
        case "no updates":
            print("status is not updated")
            code = 1
        default:
            print("wrong status")
            code = -2
    }
    return code
}

var code : Int
code = explaneStatus("ok")
print("code", code)
code = explaneStatus("fail")
print("code", code)
code = explaneStatus("...")
print("code", code)
