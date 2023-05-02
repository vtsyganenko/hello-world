cmake_minimum_required(VERSION 3.0)

project(myDynamicLibrary VERSION 1.0)

include_directories(./inc)

set(SOURCES ./src/mydynamiclib.c)

set(LIBRARY_NAME my_dynamic_library)

add_library(${LIBRARY_NAME} SHARED ${SOURCES})
