cmake_minimum_required(VERSION 3.0)

project(test VERSION 1.0)

add_executable(${PROJECT_NAME} main.cpp)
set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 14)
