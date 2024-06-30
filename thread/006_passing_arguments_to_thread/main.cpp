#include <thread>
#include <vector>
#include <iostream>


using namespace std::chrono_literals; // c++ 14

// simple value
void f1(std::vector<int> vec) {
    int sum = 0;
    for(int i=0; i<vec.size(); ++i) {
        std::cout << "thread f1() works with value " << vec[i] << " sum: " << std::endl;
        sum += vec[i];
        std::this_thread::sleep_for(100ms);
    }
    std::cout << "thread f1() result " << sum << std::endl;
}

// const reference
void f2(const std::vector<int>& vec) {
    long mult = 1;
    for(int i=0; i<vec.size(); ++i) {
        std::cout << "thread f2() works with value " << vec[i] << " mult: " << std::endl;
        mult *= vec[i];
        std::this_thread::sleep_for(100ms);
    }
    std::cout << "thread f2() result " << mult << std::endl;
}

// reference
void f3(std::vector<int>& vec) {
    for(int i=0; i<vec.size(); ++i) {
        vec[i] = vec[i] * 2;
        std::cout << "thread f3() works with value " << vec[i] << std::endl;
    }
}

int main(int argc, const char* argv[]) {
    std::cout << "Before threads started" << std::endl;

    std::vector<int> vec1 = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};

    std::thread t1 { f1, vec1 };
    t1.join();
    
    std::thread t2 { f2, std::cref(vec1) };
    t2.join();

    std::thread t3 { f3, std::ref(vec1) };
    t3.join();
    
    std::cout << "After t3 working, vec1 in main thread is:" << std::endl;
    for(int i=0; i<vec1.size(); ++i) {
        std::cout << vec1[i] << " ";
    }
    std::cout << std::endl;

    return 0;
}
