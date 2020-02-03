cmake_minimum_required(VERSION 2.8)
project(ChainHashTable)

set(HEADERS
    chainhashtable.h
    hash_interface.h
    hash.h
    ./hash_functions/division.h
    ./hash_functions/multiplication.h
    ./hash_functions/string_method.h
    ./hash_functions/common.h
    userdata.h)
set(SOURCES main.cpp)
include_directories(. hash_functions)
add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES})
