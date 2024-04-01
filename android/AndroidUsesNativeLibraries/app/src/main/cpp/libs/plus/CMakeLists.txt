cmake_minimum_required(VERSION 3.22.1)

add_library(plus SHARED src/plus.cpp)
target_include_directories(plus PRIVATE inc)
