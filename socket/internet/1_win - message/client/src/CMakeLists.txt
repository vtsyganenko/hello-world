cmake_minimum_required(VERSION 2.8)

project(client)
set(COMMON_DIR ../../common)
include_directories(${COMMON_DIR})
set(SOURCES
    main.cpp
    ${COMMON_DIR}/basemessage.h
    ${COMMON_DIR}/basemessage.cpp
    )
add_executable(${PROJECT_NAME} ${SOURCES})

IF (WIN32)
  # set stuff for windows
  message("windows")

  target_link_libraries(${PROJECT_NAME} ws2_32.lib)
ENDIF()

IF (UNIX)
  # set stuff for linux
  message("linux")
ENDIF()
