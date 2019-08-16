# win/linux
cmake_minimum_required(VERSION 3.1)

project(cppFromQml LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

set(HEADERS ./src/action.h ./src/calc.h)
set(SOURCES ./src/main.cpp ./src/calc.cpp)
set(RESOURCES ./res/qml.qrc)

add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES} ${RESOURCES})
target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Quick)
