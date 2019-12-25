cmake_minimum_required(VERSION 2.8)
project(test_with_fixture)

enable_testing()

find_package(Boost 1.58 COMPONENTS unit_test_framework REQUIRED)

set(HEADERS_LIST myfixture.h)
set(SOURCES_LIST myfixture.cpp main.cpp case_1.cpp case_2.cpp)
add_executable(${PROJECT_NAME} ${HEADERS_LIST} ${SOURCES_LIST} ${Boost_UNIT_TEST_FRAMEWORK_LIBRARY})
