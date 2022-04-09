#include <string>

class IntRomanConverter {
public:
    IntRomanConverter();

    // assumes a correct roman string
    int romanToInt(const std::string& roman);
    // assumes an appropriate integer
    std::string intToRoman(int integer);

    bool isCorrectRomanString(const std::string& roman);
    bool isAppropriateIntegerValue(int integer);
};
