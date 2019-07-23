#include "calc.h"

#include <QVariant>
#include <QDebug>

Calc::Calc(QObject *parent) : QObject(parent)
{

}

double Calc::calculate(int action)
{
    qDebug() << "Calc::calculate" << value1_ << value2_ << "action code:" << action;

    switch (action) {
    case ActionWrapper::Action::ACTION_ADDITION:
        result_ = value1_ + value2_;
        break;
    case ActionWrapper::Action::ACTION_SUBTRACTION:
        result_ = value1_ - value2_;
        break;
    case ActionWrapper::Action::ACTION_MULTIPLICATION:
        result_ = value1_ * value2_;
        break;
    case ActionWrapper::Action::ACTION_DIVISION:
        result_ = value1_ / value2_;
        break;
    default:
        qDebug() << "error action code!";
        return 0;
    }

    emit resultChanged(result_);
    return result_;
}

void Calc::setValue1(double val)
{
    value1_ = val;
}

void Calc::setValue2(double val)
{
    value2_ = val;
}

double Calc::getResult()
{
    return result_;
}
