#ifndef FRACTION_H
#define FRACTION_H

#include <ostream>

class Fraction {
public:
    Fraction();
    Fraction(int numenator, int denominator);
    Fraction(int integerPart, int numenator, int denominator);

    void setNumerator(int numerator);
    void setDenominator(int denominator);


    friend Fraction operator * (const Fraction& left, const Fraction& right);

    friend std::ostream& operator << (std::ostream& out, const Fraction& f);

//private:
    int m_integerPart{0};
    int m_numerator{0};
    int m_denominator{0};

    void reduce();
    int greatestCommonDivisor(int m, int n);
};

#endif // FRACTION_H