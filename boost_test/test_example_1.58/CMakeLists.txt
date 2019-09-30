cmake_minimum_required(VERSION 2.8)
project(test_example)

enable_testing()

find_package(Boost 1.58 COMPONENTS unit_test_framework REQUIRED)

set(SRC_LIST main.cpp)
add_executable(${PROJECT_NAME} ${SRC_LIST} ${Boost_UNIT_TEST_FRAMEWORK_LIBRARY})
