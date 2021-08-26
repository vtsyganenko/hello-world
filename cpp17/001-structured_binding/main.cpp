#include <iostream>
#include <tuple>

// returns (sum, log)
std::pair<int, std::string> add(int a, int b) {
    std::string log{ std::to_string(a) + "+" + std::to_string(b) + "=" + std::to_string(a+b)};
    return { a+b, log };
}

// returns (fraction, remainder, log)
std::tuple<int, int, std::string> division(int a, int b) {
    int fraction = a/b;
    int remainder = a%b;
    std::string log{ std::to_string(a) + "/" + std::to_string(b) + "=" + std::to_string(fraction)};
    if(remainder) {
        log.append(" and " + std::to_string(remainder));
    }
    return { fraction, remainder, log };
}

int main() {
    {
        auto pair_res = add(10, 33);
        std::cout << "addition" << std::endl
            << "result: " << pair_res.first << std::endl
            << "[" << pair_res.second << "]" << std::endl;
    }
    {
        auto [result, log] = add(25, 43);
        std::cout << "addition" << std::endl
            << "result: " << result << std::endl
            << "[" << log << "]" << std::endl;
    }
    {
        auto tuple_res = division(100, 5);
        std::cout << "division" << std::endl
            << "result: " << std::get<0>(tuple_res) << " remainder: " << std::get<1>(tuple_res) << std::endl
            << "[" << std::get<2>(tuple_res) << "]" << std::endl;
    }
    {
        auto [fraction, remainder, log] = division(100, 6);
        std::cout << "division" << std::endl
            << "result: " << fraction << " remainder: " << remainder << std::endl
            << "[" << log << "]" << std::endl;
    }

    return 0;
}
