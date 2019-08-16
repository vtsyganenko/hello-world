#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QStringListModel>
#include <QDebug>

#include "calc.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    auto list = engine.rootObjects();
    QObject* root = list.first();

    Calc calc(root);
    QObject::connect(root, SIGNAL(calculate()), &calc, SLOT(calculate()));

    QObject* resultField = root->findChild<QObject*>("resultValue");
    QObject* resultLabel = root->findChild<QObject*>("currentResult");
    QObject::connect(&calc, &Calc::resultChanged,
    [resultField, resultLabel](double res)
    {
        if(resultField) resultField->setProperty("text", QVariant(res));
        if(resultLabel) resultLabel->setProperty("text", QVariant(res));
    });

    return app.exec();
}
