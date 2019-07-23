#ifndef ACTION_H
#define ACTION_H

#include <QtGlobal>
#include <QQmlEngine>

class ActionWrapper : public QObject
{
    Q_OBJECT

public:
    ActionWrapper() : QObject() {}

    enum Action
    {
        ACTION_ADDITION,
        ACTION_SUBTRACTION,
        ACTION_MULTIPLICATION,
        ACTION_DIVISION,
    };
    Q_ENUMS(Action)

    static void declareInQml() {
        qmlRegisterType<ActionWrapper>("CalculatorActionWrapper", 1, 0, "CalcAction");
    }

};

#endif // ACTION_H
