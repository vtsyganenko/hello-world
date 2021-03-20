cmake_minimum_required(VERSION 3.5)

project(cycle_reference LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set (HEADERR a.h b.h c.h)
set (SOURCES main.cpp a.cpp b.cpp c.cpp)

add_executable(cycle_reference ${HEADERS} ${SOURCES})
