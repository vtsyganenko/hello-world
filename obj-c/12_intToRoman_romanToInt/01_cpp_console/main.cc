#include "int_roman_converter.h"

#include <iostream>
#include <vector>
#include <fstream>

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
    std::cout << "readTestData -> read " << result.size() << " pairs" << std::endl;
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
    std::cout << "run_test_romanToInt -> tests:" << test_count << " failures: " << failures_count << std::endl;
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
    std::cout << "run_test_intToRoman -> tests: " << test_count << " failures: " << failures_count << std::endl;
}

int main() {
    TestData data = readTestData();

    run_test_romanToInt(data);

    run_test_intToRoman(data);

    return 0;
}
