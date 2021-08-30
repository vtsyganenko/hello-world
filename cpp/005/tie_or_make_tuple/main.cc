#include <iostream>

// difference between make_tuple and tie
void test1() {
    // source data
    std::string teamName{"Dynamo"};
    int points = 15;
    int place = 3;
    std::cout << "set source data to both tuples:" << std::endl;

    auto tuple1 = std::make_tuple(teamName, points, place);
    std::cout << "tuple 1: " << std::get<0>(tuple1) << " pts " << std::get<1>(tuple1) << " place " << std::get<2>(tuple1) << std::endl;

    auto tuple2 = std::tie(teamName, points, place);
    std::cout << "tuple 2: " << std::get<0>(tuple1) << " pts " << std::get<1>(tuple1) << " place " << std::get<2>(tuple1) << std::endl;

    // modify source data
    points = 18;
    place = 2;

    std::cout << "after source data modification:" << std::endl;
    std::cout << "tuple 1: " << std::get<0>(tuple1) << " pts " << std::get<1>(tuple1) << " place " << std::get<2>(tuple1) << std::endl;
    std::cout << "tuple 2: " << std::get<0>(tuple2) << " pts " << std::get<1>(tuple2) << " place " << std::get<2>(tuple2) << std::endl;
}

// teamName, points, place
std::tuple<std::string, int, int> getTeamInfo() {
    return {"dynamo", 15, 3};
}

// structure binding by std::tie()
void test2() {
    std::string teamName{};
    int points{0};

    std::tie(teamName, points, std::ignore) = getTeamInfo();
    std::cout << "team: " << teamName << std::endl << "points: " << points << std::endl;
}

int main() {
    test1();
    test2();

    return 0;
}