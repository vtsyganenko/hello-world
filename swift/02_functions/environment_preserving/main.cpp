#include <iostream>

std::function<void(void)> countAdder(std::function<void(void)> f) {
    unsigned counter = 0;
    return [counter, f]() mutable {
        counter++;
        std::cout << "counter = " << counter << std::endl;
        f();
    };
}

int main(int argc, const char* argv[]) {
    
    auto greet = []() {
        std::cout << "Hello!" << std::endl;
    };

    auto countedGreet = countAdder(greet);

    countedGreet();
    countedGreet();
    countedGreet();

    return 0;
}
