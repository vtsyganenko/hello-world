#include <iostream>
#include <vector>
#include <algorithm>

template<typename T>
void print(std::string msg, const std::vector<T>& vec) {
    std::cout << msg << " [" << vec.size() << "]" << std::endl;
    for(std::size_t i=0; i<vec.size(); ++i) {
        std::cout << vec[i] << " ";
    }
    std::cout << std::endl;
}

int main(int argc, const char* argv[]) {

    std::vector<double> data = {0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0};
    double coef = 0.5;
    print("data", data);


    // case 1: already have new vector
    std::cout << std::endl;

    // create vector with 'data.size()' zeros
    std::vector<double> result1( data.size() );
    print("result 1 before", result1);

    std::transform(data.cbegin(), data.cend(), result1.begin(),
        [coef](double val) { return val * coef; });
    
    print("result 1 after", result1);


    // case 2: backward
    std::cout << std::endl;

    std::vector<double> result2( data.size() );
    print("result 2 before", result2);

    std::transform(data.cbegin(), data.cend(), result2.rbegin(),
        [coef](double val) { return val * coef; });
    
    print("result 2 after", result2);


    // case 3,4: empty vector
    std::cout << std::endl;

    std::vector<double> result3;
    print("result 3 before", result3);

    std::transform(data.cbegin(), data.cend(), std::back_inserter(result3),
        [coef](double val) { return val / coef; });

    print("result 3 after", result3);

    std::cout << std::endl;

    std::vector<double> result4;
    print("result 4 before", result4);

    std::transform(data.cbegin(), data.cend(), std::inserter(result4, result4.begin()),
        [coef](double val) { return val / coef; });

    print("result 4 after", result4);


    // case 5: write to itself
    std::cout << std::endl;

    print("data before", data);

    std::transform(data.cbegin(), data.cend(), data.begin(),
        [](double val) { return val * 10; });

    print("data after", data);

    return 0;
}
