#include "widget.h"
#include <QApplication>
#include <QObject>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Widget w;
    QObject::connect(&w, &Widget::exit, &a, &QApplication::quit);
    w.show();

    return a.exec();
}
