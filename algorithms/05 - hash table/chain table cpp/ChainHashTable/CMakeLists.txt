cmake_minimum_required(VERSION 2.8)
project(ChainHashTable)

set(HEADERS
    chainhashtable.h
    hash_interface.h
    hash.h
    exceptions.h
    division.h
    multiplication.h
    string_method.h
    common.h)
set(SOURCES main.cpp)
add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES})
