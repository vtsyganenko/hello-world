
func mostCommonCharacter(inString str:String) -> Optional<Character> {
    
    if str.isEmpty {
        return nil
    }

    var dict : [Character:UInt] = [:]
    for char in str {
        if dict[char] == nil {
            dict[char] = 1
        }
        else {
            dict[char]! += 1
        }
    }

    var maxValue : UInt = 0
    var keyForMaxValue : Optional<Character> = nil
    for (key,value) in dict {
        if value > maxValue {
            maxValue = value
            keyForMaxValue = key
        }
    }
    return keyForMaxValue!
}

var ch : Optional<Character>

var string = ""
ch = mostCommonCharacter(inString:string)
print("result for string [\(string)] is", ch ?? "nil")

string = "str"
ch = mostCommonCharacter(inString:string)
print("result for string [\(string)] is", ch ?? "nil")

string = " "
ch = mostCommonCharacter(inString:string)
print("result for string [\(string)] is", ch ?? "nil")

string = "hellohoh"
ch = mostCommonCharacter(inString:string)
print("result for string [\(string)] is", ch ?? "nil")

string = "aaaa"
ch = mostCommonCharacter(inString:string)
print("result for string [\(string)] is", ch ?? "nil")

string = "abcabc"
ch = mostCommonCharacter(inString:string)
print("result for string [\(string)] is", ch ?? "nil")

string = "asd asd asa"
ch = mostCommonCharacter(inString:string)
print("result for string [\(string)] is", ch ?? "nil")

string = "abc5abc5abc5abc55abc5abc5"
ch = mostCommonCharacter(inString:string)
print("result for string [\(string)] is", ch ?? "nil")
