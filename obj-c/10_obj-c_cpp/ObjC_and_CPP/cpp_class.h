//
//  test_cpp.h
//  TestNew
//
//  Created by Виталий Цыганенко on 04.12.2021.
//

#ifndef cpp_class_h
#define cpp_class_h

#include <string>
#include <vector>

class StringGetter
{
public:
    StringGetter();
    
    void addValue(const int value);
    void clearValues();
    std::string getResult();
    
private:
    std::vector<int> m_values {};
};

#endif /* cpp_class_h */
