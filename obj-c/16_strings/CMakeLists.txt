cmake_minimum_required(VERSION 3.16)

project("strings")

#enable_language(OBJC)
#set(CMAKE_C_FLAGS "-x objective-c")

set(SOURCES main.m myclass.m)

add_executable(test ${SOURCES})
target_link_libraries(test
    "-framework Foundation"
)
