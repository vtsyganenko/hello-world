#include <iostream>
#include <tuple>
#include <map>
#include <vector>
#include <iomanip>

// returns pair(sum, log)
std::pair<int, std::string> add(int a, int b) {
    std::string log{ std::to_string(a) + "+" + std::to_string(b) + "=" + std::to_string(a+b)};
    return { a+b, log };
}

// returns tuple(fraction, remainder, log)
std::tuple<int, int, std::string> division(int a, int b) {
    int fraction = a/b;
    int remainder = a%b;
    std::string log{ std::to_string(a) + "/" + std::to_string(b) + "=" + std::to_string(fraction)};
    if(remainder) {
        log.append(" and " + std::to_string(remainder));
    }
    return { fraction, remainder, log };
}

// map(teamName, teamPoints)
std::map<std::string, int> getTeamsPoints() {
    return { {"dynamo", 13}, {"zenit", 14}, {"spartak", 7}, {"krasnodar", 9} };
}

struct TeamInfo {
    std::string teamName;
    int won;
    int drawn;
    int lost;
};

std::vector<TeamInfo> getTeamsInfos() {
    return {
        {"spartak", 2, 1, 3},
        {"dynamo", 4, 1, 1},
        {"zenit", 4, 2, 0},
        {"krasnodar", 3, 0, 3}
    };
}

int main() {
    
    // pair
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
    // tuple
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
    // map
    {
        for(const std::pair<std::string, int>& team : getTeamsPoints()) {
            std::cout << team.first << ": " << team.second << " points" << std::endl;
        }
    }
    {
        for(const auto& [teamName, points] : getTeamsPoints()) {
            std::cout << teamName << ": " << points << " points" << std::endl;
        }
    }

    auto printTableLine = [](auto value, bool needEndl = false) {
        std::cout << std::left << std::setw(10) << std::setfill(' ') << value;
        if(needEndl) { std::cout << std::endl; }
    };

    // struct
    {
        printTableLine("teamName");
        printTableLine("won");
        printTableLine("drawn");
        printTableLine("lost", true);
        for(const auto& info : getTeamsInfos()) {
            //std::cout << std::setw(10) << info.teamName << info.won << info.drawn << info.lost;
            printTableLine(info.teamName);
            printTableLine(info.won);
            printTableLine(info.drawn);
            printTableLine(info.lost, true);
        }
    }
    {
        printTableLine("teamName");
        printTableLine("won");
        printTableLine("drawn");
        printTableLine("lost", true);
        for(const auto [name, won, drawn, lost] : getTeamsInfos()) {
            printTableLine(name);
            printTableLine(won);
            printTableLine(drawn);
            printTableLine(lost, true);
        }
    }

    // array :)
    {
        std::string teams[] = {"spartak", "dynamo", "zenit", "krasnodar", "cska"};
        auto& [team1, team2, team3, team4, team5] = teams;
        std::cout << team1 << " " << team2 << " " << team3 << " " << team4 << " " << team5 << std::endl;
        team3 = "sochi";
        std::cout << team1 << " " << team2 << " " << team3 << " " << team4 << " " << team5 << std::endl;
    }

    return 0;
}
