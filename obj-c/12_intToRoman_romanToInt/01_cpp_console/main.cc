#include "int_roman_converter.h"

#include <iostream>
#include <vector>
#include <fstream>
#include <map>

// pair (integer, roman)
using TestData = std::vector<std::pair<int, std::string>>;

TestData readTestData() {
    TestData result;
    std::string arabic{};
    std::string delimiter{"="};
    std::string roman{};
    std::ifstream read("test_1_to_4999.txt");
    for(std::string line; std::getline(read, line);) {
        auto pos = line.find(delimiter);
        if(pos != std::string::npos) {
            arabic = line.substr(0, pos);
            roman = line.substr(pos+1, line.length());
            result.push_back(std::make_pair(std::stoi(arabic), roman));
        }
    }
    read.close();
    std::cout << "readTestData -> read " << result.size() << " pairs" << std::endl << std::endl;
    return result;
}

void run_test_romanToInt(const TestData& data) {
    int test_count {0};
    int failures_count {0};
    IntRomanConverter obj;
    for(const auto& p: data) {
        test_count++;
        auto integer = obj.romanToInt(p.second);
        bool result { integer == p.first };
        if(!result) failures_count++;
    }
    std::cout << "run_test_romanToInt -> tests:" << test_count 
    << " failures: " << failures_count << std::endl << std::endl;
}

void run_test_intToRoman(const TestData& data) {
    int test_count {0};
    int failures_count {0};
    IntRomanConverter obj;
    for(const auto& p: data) {
        test_count++;
        auto roman = obj.intToRoman(p.first);
        bool result { roman == p.second };
        if(!result) failures_count++;
    }
    std::cout << "run_test_intToRoman -> tests: " << test_count 
    << " failures: " << failures_count << std::endl << std::endl;
}

void run_test_isCorrectRomanString() {
    // test value, awaited result
    std::map<std::string, bool> testData {
        {"", false}, {"IVXLCDM", true}, {"ABEGH", false}, {"IVXZNOP", false},
    };
    IntRomanConverter obj;
    std::cout << "run_test_isCorrectRomanString:" << std::endl;
    for(auto pair : testData) {
        auto result = obj.isCorrectRomanString(pair.first);
        std::cout << "isCorrectRomanString( " << pair.first << " ) = "
        << std::boolalpha << result << " -> "
        << (result == pair.second ? "passed" : "failed") << std::endl;
    }
    std::cout << std::endl;
}

void run_test_isAppropriateIntegerValue() {
    // test value, awaited result
    std::map<int, bool> testData {
        {0, false}, {1, true}, {2000, true}, {4999, true}, {5000, false}
    };
    IntRomanConverter obj;
    std::cout << "run_test_isAppropriateIntegerValue:" << std::endl;
    for(auto pair : testData) {
        auto result = obj.isAppropriateIntegerValue(pair.first);
        std::cout << "isAppropriateIntegerValue( " << pair.first << " ) = "
        << std::boolalpha << result << " -> "
        << (result == pair.second ? "passed" : "failed") << std::endl;
    }
    std::cout << std::endl;
}

int main() {
    TestData data = readTestData();

    run_test_romanToInt(data);

    run_test_intToRoman(data);

    run_test_isCorrectRomanString();

    run_test_isAppropriateIntegerValue();

    return 0;
}
