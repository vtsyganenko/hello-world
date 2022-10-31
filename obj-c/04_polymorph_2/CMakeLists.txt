cmake_minimum_required(VERSION 3.0)

project(poly)

set(SOURCES main.m classes.m)

add_executable(${PROJECT_NAME} ${SOURCES})
target_link_libraries(${PROJECT_NAME} "-framework Foundation")
