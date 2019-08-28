cmake_minimum_required(VERSION 3.1)

project(ChatClient LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

set(SOURCES 
    ./src/main.cpp
    ./src/core.cpp
    ./src/eventqueue.cpp
    ./src/client.cpp
    ./src/receiver.cpp
    ./src/common.cpp
    )
set(HEADERS
    ./src/core.h
    ./src/event.h
    ./src/eventqueue.h
    ./src/client.h
    ./src/receiver.h
    ./src/common.h
    ./src/protectedqueue.h
    )
set(QMLSRC ./ui/qml.qrc)
add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS} ${QMLSRC})

target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Quick pthread)
