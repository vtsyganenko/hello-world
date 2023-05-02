cmake_minimum_required(VERSION 3.0)

project(test VERSION 1.0)

include_directories(../dynamic_lib/inc/)
include_directories(../static_lib/inc)

set(SOURCES main.c)

link_directories(../dynamic_lib/build)
link_directories(../static_lib/build)

add_executable(${PROJECT_NAME} ${SOURCES})

target_link_libraries(${PROJECT_NAME} PRIVATE my_static_library)
target_link_libraries(${PROJECT_NAME} PRIVATE my_dynamic_library)
