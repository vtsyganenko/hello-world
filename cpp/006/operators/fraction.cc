#include "fraction.h"

#include <iostream>

Fraction::Fraction() {
}

Fraction::Fraction(int numenator, int denominator) 
    : m_numerator(numenator), m_denominator(denominator) {
    reduce();
}

Fraction::Fraction(int integerPart, int numenator, int denominator)
    : m_integerPart(integerPart), m_numerator(numenator), m_denominator(denominator) {
    reduce();
}

void Fraction::setNumerator(int numerator) {
    m_numerator = numerator;
    reduce();
}

void Fraction::setDenominator(int denominator) {
    m_denominator = denominator;
    reduce();
}

//----------------------------------------------------------------------

Fraction operator * (const Fraction& left, const Fraction& right) {
    return Fraction(left.m_numerator * right.m_numerator,
        left.m_denominator * right.m_denominator);
}

std::ostream& operator << (std::ostream& out, const Fraction& f) {
    if(f.m_integerPart) {
        out << f.m_integerPart;
    }
    if(f.m_numerator && f.m_denominator) {
        if(f.m_integerPart) {
            out << " ";
        }
        out << f.m_numerator << "/" << f.m_denominator;
    }
    return out;
}

//----------------------------------------------------------------------

void Fraction::reduce() {
    if(m_numerator && m_denominator) {
        // 9/2 = 4 1/2
        if(m_numerator > m_denominator) {
            auto intPart = m_numerator / m_denominator;
            auto remainder = m_numerator % m_denominator;
            m_integerPart += intPart;
            m_numerator = remainder;
        }
        // 5/5 = 1
        else if(m_numerator == m_denominator) {
            m_integerPart = 1;
            m_numerator = 0;
            m_denominator = 0;
        }
        // 3/9 = 1/3
        else{
            auto gcd = greatestCommonDivisor(m_numerator, m_denominator);
            m_numerator /= gcd;
            m_denominator /= gcd;
        } 
    }
}

/*
GCD(0, n) = n; GCD(m, 0) = m;GCD(m, m) = m;
GCD(1, n) = 1; GCD(m, 1) = 1;
If m, n even, then GCD(m, n) = 2*GCD(m/2, n/2);
If m even, n odd, then GCD(m, n) = GCD(m/2, n);
If n even, m odd, then GCD(m, n) = GCD(m, n/2);
If m, n odd и n > m, then GCD(m, n) = GCD((n-m)/2, m);
If m, n odd и n < m, then GCD(m, n) = GCD((m-n)/2, n);
*/
int Fraction::greatestCommonDivisor(int m, int n) {
    //std::cout << "greatestCommonDivisor m = " << m << " n = " << n << std::endl;
    if(m == 0) return n;
    if(n == 0) return m;
    if(m == n) return m;
    if(m == 1 || n == 1) return 1;

    bool mEven = (m % 2 == 0);
    bool nEven = (n % 2 == 0);
    //std::cout << "mEven " << mEven << " nEven " << nEven << std::endl;

    if(mEven && nEven) {
        return 2 * greatestCommonDivisor(m/2, n/2);
    }
    else if(mEven && !nEven) {
        return greatestCommonDivisor(m/2, n);
    }
    else if(!mEven && nEven) {
        return greatestCommonDivisor(m, n/2);
    }
    else {
        if(n > m) {
            return greatestCommonDivisor((n-m)/2, m);
        }
        else {
            return greatestCommonDivisor((m-n)/2, n);
        }
    }

    std::cout << "greatestCommonDivisor error case!" << std::endl;
    return 0;
}
