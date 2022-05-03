#include "fraction.h"

#include <vector>
#include <tuple>
#include <iostream>

extern int greatestCommonDivisor(int, int);

void test_greatestCommonDivisor() {
    std::cout << "test_greatestCommonDivisor" << std::endl;
    std::vector<std::tuple<int, int, int>> data = {
        {0, 0, 0}, {0, 10, 10}, {10, 0, 10}
    };

    int failuresCount{ 0 };
    for(auto& t : data) {
        int m = std::get<0>(t);
        int n = std::get<1>(t);
        int requiredResult = std::get<2>(t);
        std::cout << "gcd(" << m << ", " << n << ") = ";
        auto result = greatestCommonDivisor(m, n);
        std::string conclusion{ "ok" };
        if(result != requiredResult) {
            conclusion = "failed, need " + std::to_string(requiredResult);
            failuresCount++;
        }
        std::cout << result << " " << conclusion << std::endl;
    }
    if(failuresCount) {
        std::cout << "failures: " << failuresCount << std::endl;
    }
}

int main(int argc, char* argv[]) {
    (void)argc;
    (void)argv;

    test_greatestCommonDivisor();

    return 0;
}
