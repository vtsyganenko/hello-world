QT += core
QT -= gui

TARGET = StatesExample
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

INCLUDEPATH += ./src \
               ./src/states

SOURCES += ./src/main.cpp \
    ./src/communication.cpp \
    ./src/controller.cpp \
    ./src/states/basestate.cpp \
    ./src/states/wait.cpp \
    ./src/states/work.cpp \
    ./src/states/stopping.cpp \
    ./src/states/error.cpp

HEADERS += \
    ./src/communication.h \
    ./src/controller.h \
    ./src/states/basestate.h \
    ./src/states/wait.h \
    ./src/states/work.h \
    ./src/states/stopping.h \
    ./src/states/error.h

