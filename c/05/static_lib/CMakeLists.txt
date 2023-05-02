cmake_minimum_required(VERSION 3.0)

project(myStaticLibrary VERSION 1.0)

include_directories(./inc)

set(SOURCES ./src/mystaticlib.c)

set(LIBRARY_NAME my_static_library)

add_library(${LIBRARY_NAME} STATIC ${SOURCES})
