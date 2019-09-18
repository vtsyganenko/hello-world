cmake_minimum_required(VERSION 2.8)

project(client)
add_executable(${PROJECT_NAME} "main.cpp")

IF (WIN32)
  # set stuff for windows
  message("windows")

  target_link_libraries(${PROJECT_NAME} ws2_32.lib)
ENDIF()

IF (UNIX)
  # set stuff for linux
  message("linux")
ENDIF()
