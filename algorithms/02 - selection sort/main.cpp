#include <iostream>
#include <vector>
#include <functional>

template <typename T>
void print(std::vector<T> data, std::string message = std::string())
{
    if(!message.empty())
        std::cout << "Before sort:" << std::endl;
    for(const auto& elem : data)
        std::cout << elem << " ";
    std::cout << std::endl;
}

template <typename T>
using SortingFunc = std::function<bool(T, T)>;

template <typename T>
unsigned int findMoreSuitableIndex(const std::vector<T>& v, SortingFunc<T> f)
{
    T suitable = v[0];
    unsigned int index = 0;
    for(unsigned int i=0; i<v.size(); ++i)
    {
        if( f(v[i], suitable) )
        {
            suitable = v[i];
            index = i;
        }
    }
    return index;
}

template <typename T>
void selectionSort(std::vector<T> v, SortingFunc<T> f)
{
    print(v, "Before sorting:");

    std::vector<T> sorted;

    while(!v.empty())
    {
        auto index = findMoreSuitableIndex(v, f);
        sorted.push_back(v[index]);

        auto remove_iter = v.begin();
        std::advance(remove_iter, index);
        v.erase(remove_iter);
    }

    print(sorted, "After sorting:");
}

struct TeamInfo
{
    std::string name;
    int points;

    friend std::ostream& operator << (std::ostream& s, const TeamInfo& team);
};

std::ostream& operator << (std::ostream& s, const TeamInfo& team)
{
    s << "[" << team.name << " - " << team.points << "]";
    return s;
}

int main()
{
    std::vector<int> v = {12, 22, 44, 31, 35, 11, 54, 3, 23};
    selectionSort<int>(v, [](int a, int b) -> bool { return a<b; });

    std::vector<std::string> v1 = {"Hello", "City", "Moscow", "Country", "What?"};
    selectionSort<std::string>(v1, [](std::string a, std::string b) -> bool { return a<b; });

    std::vector<TeamInfo> v2 = { {"Spartak", 30}, {"CSKA", 28}, {"Zenit", 35}, {"Rostov", 29}};
    selectionSort<TeamInfo>(v2, [](const TeamInfo& t1, const TeamInfo& t2) -> bool { return t1.points<t2.points; });

    return 0;
}
