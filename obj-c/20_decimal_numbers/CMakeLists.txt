cmake_minimum_required(VERSION 3.16)

project("decimal_numbers")

set(SOURCES main.m)

add_executable(test ${SOURCES})
target_link_libraries(test
    "-framework Foundation"
)
