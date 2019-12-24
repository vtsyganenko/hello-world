#include <iostream>
#include <vector>

// recursion
unsigned int simple_fact(unsigned int x)
{
    if(x == 0 || x == 1)
        return x;
    else
        return x * simple_fact(x - 1);
}

// tail recursion
int fac_times (int n, int acc) {
    return (n==0) ? acc : fac_times(n - 1, acc * n);
}
int factorial (int n) {
    return fac_times (n, 1);
}

// fibonachi
int fib(int a, int b)
{
    static int c = 0;

    c++;
    if(c==10) return a+b;

    return fib(b, fib(a, b));
}

int fib(int count, int a = 0, int b = 1)
{
    if(count == 0) return a;
    if(count == 1) return b;
    return fib(count - 1, b, a+b);
}

int main()
{
    for(unsigned int i = 0; i < 10; ++i)
    {
        std::cout << "factorial " << i << " is " << simple_fact(i) << std::endl;
    }

    for(int i = 0; i < 10; ++i)
    {
        std::cout << "factorial " << i << " is " << factorial(i) << std::endl;
    }

    std::cout << "fibonacci for 10: ";
    for(int i = 0; i <= 10; ++i)
    {
        std::cout << fib(i) << " ";
    }
    std::cout << std::endl;

    return 0;
}
