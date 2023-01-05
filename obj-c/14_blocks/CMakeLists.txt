cmake_minimum_required(VERSION 3.16)

project("blocks")

#enable_language(OBJC)
#set(CMAKE_C_FLAGS "-x objective-c")

set(SOURCES main.m)

add_executable(${PROJECT_NAME} ${SOURCES})
target_link_libraries(${PROJECT_NAME}
    "-framework Foundation"
)
