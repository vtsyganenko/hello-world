cmake_minimum_required(VERSION 3.0)

project(test3 VERSION 1.0)

set(LIBRARY_SOURCES ./src/calc.c)

set(LIBRARY_NAME_STATIC "calc_static")
add_library(${LIBRARY_NAME_STATIC} ${LIBRARY_SOURCES}) # static is default
target_include_directories(${LIBRARY_NAME_STATIC} PRIVATE inc)

set(LIBRARY_NAME_SHARED "calc_shared")
add_library(${LIBRARY_NAME_SHARED} SHARED ${LIBRARY_SOURCES})
target_include_directories(${LIBRARY_NAME_SHARED} PRIVATE inc)

set(SOURCES main.c)

add_executable(${PROJECT_NAME}_static ${SOURCES})
target_include_directories(${PROJECT_NAME}_static PRIVATE inc)
target_link_libraries(${PROJECT_NAME}_static ${LIBRARY_NAME_STATIC})

add_executable(${PROJECT_NAME}_shared ${SOURCES})
target_include_directories(${PROJECT_NAME}_shared PRIVATE inc)
target_link_libraries(${PROJECT_NAME}_shared ${LIBRARY_NAME_SHARED})
