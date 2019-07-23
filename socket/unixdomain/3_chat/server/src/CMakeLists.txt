cmake_minimum_required(VERSION 2.8)

project(chat_server)

set(SOURCES main.cpp common.h
    messagequeue.h messagequeue.cpp
    receiver.h receiver.cpp
    clientbase.h clientbase.cpp)

add_executable(${PROJECT_NAME} ${SOURCES})

target_link_libraries(${PROJECT_NAME} pthread)
