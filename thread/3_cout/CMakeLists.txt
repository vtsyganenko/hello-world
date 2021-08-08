cmake_minimum_required(VERSION 2.8)
project(MtCout)

set(HEADERS mtcout.h)
set(SOURCES main.cpp)

add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES})
target_link_libraries(${PROJECT_NAME} pthread)
