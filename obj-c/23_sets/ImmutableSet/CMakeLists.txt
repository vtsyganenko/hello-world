cmake_minimum_required(VERSION 3.16)

project("immutable set")

set(SOURCES main.m)

add_executable(test ${SOURCES})
target_link_libraries(test
    "-framework Foundation"
)
