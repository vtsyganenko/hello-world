#include <iostream>
#include <vector>

void print(const std::vector<int>& vec)
{
    auto size = vec.size();
    if(!size) {
        std::cout << "[]" << std::endl;
        return;
    }
    unsigned int last_index = vec.size() - 1;
    std::cout << "[";
    for(unsigned int i=0; i<size; ++i){
        if(i == last_index)
            std::cout << vec[i] << "]" << std::endl;
        else
            std::cout << vec[i] << ", ";
    }
}

std::vector<int> qsort(std::vector<int> vec)
{
    //std::cout << "call qsort with ";
    //print(vec);

    if(vec.size() < 2)
    {
        //std::cout << "base case" << std::endl;
        return vec;
    }
    else {
        unsigned int pivot_index = vec.size() / 2;
        int pivot = vec[pivot_index];

        std::vector<int> less;
        std::vector<int> great;

        auto erase_iter = vec.begin();
        std::advance(erase_iter, pivot_index);
        vec.erase(erase_iter);

        for(const auto& elem : vec) {
            if(elem < pivot)
                less.push_back(elem);
            else
                great.push_back(elem);
        }

        less = qsort(less);
        great = qsort(great);

        std::vector<int> res(less);
        res.push_back(pivot);
        res.insert(res.end(), great.begin(), great.end());
        return res;
    }
}

std::vector<int> qsort2(const std::vector<int>& vec)
{
    //std::cout << "call qsort2 with ";
    //print(vec);

    if(vec.size() < 2)
    {
        //std::cout << "base case" << std::endl;
        return vec;
    }
    else {
        unsigned int pivot_index = vec.size() / 2;
        int pivot = vec[pivot_index];

        std::vector<int> less;
        std::vector<int> great;

        for(unsigned int i=0; i<vec.size(); ++i)
        {
            if(i == pivot_index) continue;
            else {
                if(vec[i] < pivot)
                    less.push_back(vec[i]);
                else
                    great.push_back(vec[i]);
            }
        }

        less = qsort(less);
        great = qsort(great);

        std::vector<int> res(less);
        res.push_back(pivot);
        res.insert(res.end(), great.begin(), great.end());
        return res;
    }
}

void test_qsort(const std::vector<int>& vec)
{
    print(vec);
    print(qsort(vec));
}

void test_qsort2(const std::vector<int>& vec)
{
    print(vec);
    print(qsort2(vec));
}

int main()
{
    std::cout << "test qsort:" << std::endl;
    test_qsort( {} );
    test_qsort( {18} );
    test_qsort( {23, 12, 0, 14, 7, 58, 30} );
    test_qsort( {-3, 4, 1, 23, 12, 0, 9, 8, 23, 12, 0, 14, 7, 58, 30} );

    std::cout << "test qsort2:" << std::endl;
    test_qsort2( {} );
    test_qsort2( {18} );
    test_qsort2( {23, 12, 0, 14, 7, 58, 30} );
    test_qsort2( {-3, 4, 1, 23, 12, 0, 9, 8, 23, 12, 0, 14, 7, 58, 30} );

    return 0;
}
