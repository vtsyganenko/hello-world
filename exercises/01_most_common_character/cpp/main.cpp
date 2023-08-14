#include <iostream>
#include <map>

char mostCommonCharacterInString(const std::string& str, uint16_t len) {
    char result = 0;

    if(str.empty()) {
        std::cout << "mostCommonCharacterInString: ERROR str is empty" << std::endl;
        return result;
    }

    if(len == 0) {
        std::cout << "mostCommonCharacterInString: ERROR length is 0" << std::endl;
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

void test_wrapper(const std::string& string, unsigned length) {
    char res = mostCommonCharacterInString(string, length);
    std::cout << "for string [" << string << "], most common character is [" << res << "]" << std::endl << std::endl;
}

int main(int argc, const char* argv[]) {

    test_wrapper("", 1);

    test_wrapper("str", 0);

    test_wrapper(" ", 1);

    test_wrapper("abcdce", 6);

    test_wrapper("aaaa", 4);

    test_wrapper("abcabc", 6);

    test_wrapper("asd asd asa", 11);

    test_wrapper("abc5abc5abc5abc55abc5abc5", 26);

    return 0;
}
