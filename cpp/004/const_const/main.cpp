#include <iostream>

int main()
{
    // ptr to const
    {
        // ptr could be changed
        const char* pa = "hello";
        pa = "world";

        // can't change const value (const + literal)
        // pa[2] = 'x';

        // ptr could be changed
        char letters[] {'a', 'b', 'c', 'd', 'e', '\0'};
        pa = letters;

        // can't change const value (const)
        // pa[2] = 'x';
    }

    // const ptr
    {
        // ptr couldn't be changed
        char* const pa = "hello";
        // pa = "world";

        // can't change const value (literal)
        // pa[2] = 'x';

        // ptr couldn't be changed
        char letters[] {'a', 'b', 'c', 'd', 'e', '\0'};
        char* const pb = letters;

        // can change value
        pb[2] = 'x';
        std::cout << pb << std::endl;
    }

    // const ptr to const
    const char* const pc = "hello";

    return 0;
}
