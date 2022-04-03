#include <iostream>
#include <map>
#include <vector>
#include <fstream>

static std::map<char, int> dictionary = {
    {'I', 1}, {'V', 5}, {'X', 10}, {'L', 50}, {'C', 100}, {'D', 500}, {'M', 1000}
};

static std::map<std::string, int> exceptions = {
    {"IV", 4}, {"IX", 9}, {"XL", 40}, {"XC", 90}, {"CD", 400}, {"CM", 900}
};

bool isCorrectRomanString(const std::string& str) {
    return std::all_of(str.begin(), str.end(), [](const char& character) {
        std::cout << "ch " << character << std::endl;
        return std::any_of(dictionary.begin(), dictionary.end(), [&character](const std::pair<char,int>& pair) {
            return pair.first == character;
        });
    });
}

int romanToInt(const std::string& str) {

    auto len = str.length();
    //std::cout << "romanToInt(" << str << ") len = " << len << std::endl << std::endl;
    
    auto first_ch = str[0];
    auto first_num = dictionary.at(first_ch);
    //std::cout << "first_ch: " << first_ch << " = " << first_num << std::endl << std::endl;
    // result value
    int sum = 0;

    // start from element [1] and go to the end
    // on each step checking if numbers (current and previous) in regular sequence i.e. from larger value to smaller: M->D->C...
    // but we can catch "exceptions" where two characters go in opposite sequence: smaller value goes before the larger one. 
    // these shoule be processed as single value. Example IV as 4 
    
    // fallback: if only one character
    if(len == 1) {
        sum = first_num;
        //std::cout << sum << std::endl;
        return sum;
    }

    // main cycle
    for(decltype(len) i=1; i<len; ++i) {
        auto ch = str[i];
        auto num = dictionary.at(ch);
        //std::cout << "index: " << i << " ch: " << ch << " = " << num;

        auto prev_ch = str[i-1];
        auto prev_num = dictionary.at(prev_ch);
        //std::cout << " prev_ch: " << prev_ch << " = " << prev_num << std::endl;

        if(num <= prev_num) {
            // regular sequence
            //std::cout << "add " << prev_num << " to sum" << std::endl;
            sum += prev_num;

            if(i == len - 1) {
                // process last element
                //std::cout << std::endl << "last: add " << prev_num << " to sum" << std::endl;
                sum += num;
            }
        }
        else {
            // caught "exception"
            std::vector<char> vec = {prev_ch, ch};
            std::string ex(vec.begin(), vec.end());
            //std::cout << "found exception: " << ex;
            auto ex_num = exceptions.at(ex);
            //std::cout << " = " << ex_num << std::endl;
            sum += ex_num;
            //std::cout << "add " << ex_num << " to sum" << std::endl;
            // how many characters remaining till the end
            auto remain = len - 1 - i;
            if(remain > 1) {
                // skip index since "exception" is two characters
                //std::cout << "remain: " << remain << " > 1, so skip the next index" << std::endl;
                i++;
            }
            else if(remain == 1) {
                // process last element
                //std::cout << "remain: " << remain << " == 1, so work with last ";
                i++;
                auto last_ch = str[i];
                auto last_num = dictionary.at(last_ch);
                //std::cout << last_ch << " = " << last_num << std::endl;
                sum += last_num;
                //std::cout << "add " << last_num << " to sum" << std::endl;
            }
            else {
                //std::cout << "remain: " << remain << " <= 1, so do nothing" << std::endl;
            }
        }

        //std::cout << std::endl;
    }
        
    //std::cout << sum << std::endl;
    return sum;
}

// pair: arabic, roman
std::vector<std::pair<int, std::string>> readTestData() {
    std::vector<std::pair<int, std::string>> result;
    std::ifstream read("test_1_to_4999.txt");
    //std::ifstream read("test.txt");
    std::string arab{};
    std::string delimiter{"="};
    std::string roman{};

    for(std::string line; std::getline(read, line);) {

        //std::cout << line << std::endl;

        auto pos = line.find(delimiter);
        //std::cout << "line [" << line << "] pos " << pos << " len " << line.length() << std::endl;
        if(pos != std::string::npos) {
            arab = line.substr(0, pos);
            roman = line.substr(pos+1, line.length());
            //std::cout << "[" << arab << "] [" << roman << "]" << std::endl;
            result.push_back(std::make_pair(std::stoi(arab), roman));
        }
    }

    read.close();
    return result;
}

void run_test_romanToInt() {
    auto data = readTestData();
    int test_count {0};
    int failures {0};
    for(const auto& p: data) {
        test_count++;
        auto integer = romanToInt(p.second);
        bool result = integer == p.first;
        if(!result) failures++;
        //std::cout << p.second << " = " << integer << (result ? " ok" : " fail") << std::endl;
    }
    std::cout << "tests: " << test_count << " failures: " << failures << std::endl;
}

// value from 1 to 4999
std::string intToRoman(int intValue) {
    std::string result{};

    std::string val{ std::to_string(intValue) };
    auto len = val.length();
    std::cout << "val: " << val << " len: " << len << std::endl;

    if(!len) {
        std::cout << "to low!" << std::endl;
    }
    if(len > 4) {
        std::cout << "to much!" << std::endl;
    }

    auto digit = len - 1;
    for(decltype(len) i = 0; i<len; ++i, digit--) {
        std::string valueString{val[i]};
        auto value = std::stoi(valueString);
        std::cout << "index: " << i << " digit: " << digit << " value: " << value << std::endl;
        
        if(value == 0) {
            continue;
        }

        // thousands
        if(digit == 3) {
            std::string thousands{};
            thousands.assign(value, 'M');
            std::cout << "thousands: " << thousands << std::endl;
            result.append(thousands);
            continue;
        }
        
        char symbol = 0;
        std::string halfSymbol{};
        std::string lastSymbol{};

        // hundreds
        if(digit == 2) {
            symbol = 'C';
            halfSymbol = "D";
            lastSymbol = "M";
        }

        // dozens
        if(digit == 1) {
            symbol = 'X';
            halfSymbol = "L";
            lastSymbol = "C";
        }

        // units
        if(digit == 0) {
            symbol = 'I';
            halfSymbol = "V";
            lastSymbol = "X";
        }

        // ...
        std::string tmp{};
        switch (value)
        {
        case 1:
        case 2:
        case 3:
            tmp.assign(value, symbol);
            result.append(tmp);
            break;
        case 4:
            tmp.push_back(symbol);
            tmp.append(halfSymbol);
            result.append(tmp);
            break;
        case 5:
            result.append(halfSymbol);
            break;
        case 6:
        case 7:
        case 8:
            tmp.assign(value-5, symbol);
            tmp.insert(0, halfSymbol);
            result.append(tmp);
            break;
        case 9:
            tmp.push_back(symbol);
            tmp.append(lastSymbol);
            result.append(tmp);
            break;
        
        default:
            break;
        }
        std::cout << result << std::endl;
    }

    return result;
}

void run_test_intToRoman() {
    auto data = readTestData();
    int test_count {0};
    int failures {0};
    for(const auto& p: data) {
        test_count++;
        auto roman = intToRoman(p.first);
        bool result = roman == p.second;
        if(!result) failures++;
        std::cout << p.second << " = " << roman << (result ? " ok" : " fail") << std::endl;
    }
    std::cout << "tests: " << test_count << " failures: " << failures << std::endl;
}

int main() {
    
    //run_tests();

    //romanToInt("MCMXCIV");

    // LVIII 58
    //romanToInt("LVIII");

    // III 3
    //romanToInt("III");

    // MLVIII 1058
    //romanToInt("MLVIII");

    //romanToInt("MCMXCIV");

    //auto res = isCorrectRomanString("MCMXCIVR");
    //std::cout << "res: " << res << std::endl;

    //--------

    auto res = intToRoman(4999);
    std::cout << "res: [" << res << "]" << std::endl;

    //run_test_intToRoman();

    return 0;
}
