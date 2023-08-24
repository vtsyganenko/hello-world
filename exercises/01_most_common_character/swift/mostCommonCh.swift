
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

    var array = Array(zip(Array(dict.keys), Array(dict.values)))
    array.sort{ $0.1 > $1.1 }

    return array[0].0
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
