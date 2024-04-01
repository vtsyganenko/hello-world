cmake_minimum_required(VERSION 3.22.1)

add_library(minus STATIC src/minus.cpp)
target_include_directories(minus PRIVATE inc)
