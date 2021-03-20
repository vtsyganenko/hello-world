#include <iostream>

class A
{
public:
    A(int value)
    {
        std::cout << "ctor A" << std::endl;
        value_ = value;
    }

    ~A()
    {
        std::cout << "destructor A" << std::endl;
    }

    int getValue()
    {
        return value_;
    }

private:
    int value_;
};

int main()
{
    std::function<void(void)> lmb;

    {
        std::shared_ptr<A> sp1 = std::make_shared<A>(20);
        auto sp2 = sp1;

        std::cout << sp1.use_count() << std::endl; // 2

        lmb = [sp2]()
        {
            std::cout << "value: " << sp2->getValue() << std::endl;
            std::cout << "use count: " << sp2.use_count() << std::endl;
        };

        std::cout << sp1.use_count() << std::endl; // 3
    }

    lmb(); // 1

    return 0;
}
