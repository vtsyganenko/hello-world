#include "fraction.h"

Fraction::Fraction() {

}

Fraction::Fraction(int numenator, int denominator) 
    : m_numerator(numenator), m_denominator(denominator)
{

}

void Fraction::setNumerator(int numerator) {
    m_numerator = numerator;
}

void Fraction::setDenominator(int denominator) {
    m_denominator = denominator;
}

//----------------------------------------------------------------------

Fraction operator * (const Fraction& left, const Fraction& right) {
    return Fraction(left.m_numerator * right.m_numerator,
        left.m_denominator * right.m_denominator);
}

std::ostream& operator << (std::ostream& out, const Fraction& f) {
    return out << f.m_numerator << "/" << f.m_denominator;
}
