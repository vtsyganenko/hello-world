cmake_minimum_required(VERSION 3.0)
project(qquickwidget_example)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt5 REQUIRED COMPONENTS Core Widgets Quick Qml QuickWidgets)

set(SOURCES src/main.cpp src/widget.h src/widget.cpp src/qml.qrc)
qt5_add_resources(RESOURCES src/qml.qrc)

add_executable(${PROJECT_NAME} ${SOURCES} ${RESOURCES})
qt5_use_modules(${PROJECT_NAME} Core Widgets Quick Qml QuickWidgets)
