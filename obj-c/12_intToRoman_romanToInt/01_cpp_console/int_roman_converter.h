#include <string>

class IntRomanConverter {
public:
    IntRomanConverter();

    // assumes a correct roman string
    int romanToInt(const std::string& roman);
    // assumes an appropriate integer
    std::string intToRoman(int integer);

    // I, V, X, L, C, D, M
    bool isCorrectRomanString(const std::string& roman);
    // 1..4999
    bool isAppropriateIntegerValue(int integer);
};
