cmake_minimum_required(VERSION 3.5)

project(Project1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(HEADERS
    ../src/socket.h
    ../src/socket_impl.h
)

set(SOURCES 
    ../src/main.cpp
    ../src/socket.cpp
    ../src/socket_impl.cpp
)

add_executable(project1 ${SOURCES} ${HEADERS})
#target_link_libraries(project1 ws2_32.lib)

target_link_libraries(project1 pthread)
