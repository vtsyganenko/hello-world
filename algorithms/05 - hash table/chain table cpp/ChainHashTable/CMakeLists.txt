cmake_minimum_required(VERSION 2.8)
project(ChainHashTable)

set(HEADERS chainhashtable.h hash.h)
set(SOURCES main.cpp)
add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES})
