#include "calc.h"

#include <QVariant>
#include <QDebug>

Calc::Calc(QObject *invokableObject, QObject *parent) : QObject(parent), invokable_(invokableObject)
{
    actions_.insert(QString("+"), Action::ACTION_ADDITION);
    actions_.insert(QString("-"), Action::ACTION_SUBTRACTION);
    actions_.insert(QString("*"), Action::ACTION_MULTIPLICATION);
    actions_.insert(QString("/"), Action::ACTION_DIVISION);
}

void Calc::calculate()
{
    if(!invokable_) return;
    bool invokeStatus = false;

    QVariant action;
    invokeStatus = QMetaObject::invokeMethod(invokable_, "getCurrentActionSymbol", Q_RETURN_ARG(QVariant, action));
    qDebug() << "invoke status" << invokeStatus << "data" << action.toString();
    auto actionPair = convertAction(action.toString());
    if(!actionPair.first) return;

    QVariant value;
    invokeStatus = QMetaObject::invokeMethod(invokable_, "getValue1", Q_RETURN_ARG(QVariant, value));
    qDebug() << "invoke status" << invokeStatus << "data" << value.toString();
    auto value1 = value.toDouble();

    value.clear();
    invokeStatus = QMetaObject::invokeMethod(invokable_, "getValue2", Q_RETURN_ARG(QVariant, value));
    qDebug() << "invoke status" << invokeStatus << "data" << value.toString();
    auto value2 = value.toDouble();

    double result = 0.0;
    switch (actionPair.second) {
    case Action::ACTION_ADDITION:
        result = value1 + value2;
        break;
    case Action::ACTION_SUBTRACTION:
        result = value1 - value2;
        break;
    case Action::ACTION_MULTIPLICATION:
        result = value1 * value2;
        break;
    case Action::ACTION_DIVISION:
        result = value1 / value2;
        break;
    }

    qDebug() << "result" << result;
    emit resultChanged(result);
}

QPair<bool, Action> Calc::convertAction(QString value)
{
    QPair<bool, Action> res(false, Action::ACTION_ADDITION);
    res.first = actions_.contains(value);
    if(res.first)
    {
        res.second = actions_[value];
    }
    return res;
}
