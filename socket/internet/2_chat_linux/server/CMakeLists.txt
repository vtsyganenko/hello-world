cmake_minimum_required(VERSION 2.8)

project(ChatServer)

set(SOURCES 
    ./src/main.cpp
    ./src/messagequeue.cpp
    ./src/receiver.cpp
    ./src/clientbase.cpp)
set(HEADERS
    ./src/common.h
    ./src/messagequeue.h
    ./src/receiver.h
    ./src/clientbase.h)

add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS})

target_link_libraries(${PROJECT_NAME} pthread)
