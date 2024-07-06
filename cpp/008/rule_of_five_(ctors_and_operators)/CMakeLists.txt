cmake_minimum_required(VERSION 3.0)

project(test)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SOURCES myclass.cc main.cc)

add_executable(${PROJECT_NAME} ${SOURCES})
