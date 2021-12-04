//
//  test_cpp.cpp
//  TestNew
//
//  Created by Виталий Цыганенко on 04.12.2021.
//

#include "cpp_class.h"

#include <iostream>
#include <sstream>

StringGetter::StringGetter() {
}

void StringGetter::addValue(const int value) {
    m_values.push_back(value);
}

void StringGetter::clearValues() {
    m_values.clear();
}

std::string StringGetter::getResult() {
    auto size = m_values.size();
    std::stringstream ss;
    ss << "Have " << size << " values: [";
    for(std::size_t i=0; i<size; ++i) {
        ss << std::to_string(m_values[i]);
        if(i != (size-1)) {
            ss << ", ";
        }
    }
    ss << "]";
    return ss.str();
}
