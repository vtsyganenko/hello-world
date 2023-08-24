#include <iostream>
#include <map>

char mostCommonCharacterInString(const std::string& str) {
    char result = 0;

    if(str.empty()) {
        std::cout << "mostCommonCharacterInString: ERROR str is empty" << std::endl;
        return result;
    }    

    std::map<char, unsigned> dict;

    for(const char& ch : str) {
        auto it = dict.find(ch);
        if(it != dict.end()) {
            it->second++;
        }
        else {
            dict[ch] = 1;
        }
    }

/*
    auto max = dict.begin();
    for(auto it = dict.begin(); it != dict.end(); ++it) {
        if(it->second > max->second) {
            max = it;
        }
    }
*/

    auto max = std::max_element(dict.begin(), dict.end(), 
        [](const auto& pair1, const auto& pair2){
            return pair1.second < pair2.second;
    });

    result = max->first;

    return result;
}

void test_wrapper(const std::string& string) {
    char res = mostCommonCharacterInString(string);
    std::cout << "for string [" << string << "], most common character is [" << res << "]" << std::endl << std::endl;
}

int main(int argc, const char* argv[]) {

    test_wrapper("");

    test_wrapper("str");

    test_wrapper(" ");

    test_wrapper("abcdce");

    test_wrapper("aaaa");

    test_wrapper("abcabc");

    test_wrapper("asd asd asa");

    test_wrapper("abc5abc5abc5abc55abc5abc5");

    return 0;
}
