cmake_minimum_required(VERSION 3.0)

project(test VERSION 1.0)

set (CMAKE_CXX_STANDARD 11)

set(SOURCES main.cpp)

add_executable(${PROJECT_NAME} ${SOURCES})
