cmake_minimum_required(VERSION 3.0)

project(test1 VERSION 1.0)

set(SOURCES main.c)

# add executable target
add_executable(${PROJECT_NAME} ${SOURCES})
