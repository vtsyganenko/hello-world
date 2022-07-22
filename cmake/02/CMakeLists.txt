cmake_minimum_required(VERSION 3.0)

project(test2 VERSION 1.0)

set(SOURCES 
    main.c 
    ./src/calc.c)

# include dirs for all targets
#include_directories(inc)

# add executable target
add_executable(${PROJECT_NAME} ${SOURCES})

# include dirs for specific target (AFTER this target)
target_include_directories(${PROJECT_NAME} PRIVATE inc)
