#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QDebug>

#include "core.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    // main object - qt wrapper for background
    Core obj;

    QObject* root = engine.rootObjects().first();
    if(root)
    {
        QObject::connect(&obj, &Core::data,
                         [root](QString s)
        {
            QMetaObject::invokeMethod(root, "addValue",
                                      Q_ARG(QVariant, QVariant(s)));
        });

        QObject* stopButton = root->findChild<QObject*>("stopButton");
        if(stopButton)
        {
            QObject::connect(stopButton, SIGNAL(clicked()),
                             &obj, SLOT(stopWork()));
        }
    }

    return app.exec();
}
