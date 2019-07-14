QT       += core gui quickwidgets

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
DEFINES += QT_DEPRECATED_WARNINGS

TARGET = QQuickWidgetExample
TEMPLATE = app
CONFIG += c++11

SOURCES += \
        src/main.cpp \
        src/widget.cpp

HEADERS += \
        src/widget.h

DISTFILES += \
    src/main.qml

RESOURCES += \
    src/qml.qrc
