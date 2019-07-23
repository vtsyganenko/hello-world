#ifndef CALC_H
#define CALC_H

#include "action.h"

#include <QObject>
#include <QQmlEngine>

class Calc : public QObject
{
    Q_OBJECT
public:
    explicit Calc(QObject *parent = nullptr);

    static void declareInQml() {
        qmlRegisterType<Calc>("Calculator", 1, 0, "Calc");
    }

signals:
    void resultChanged(double);

public slots:
    // ActionWrapper::Action
    Q_INVOKABLE double calculate(int action);

    void setValue1(double val);
    void setValue2(double val);
    double getResult();

private:
    Q_PROPERTY(double value1 WRITE setValue1)
    Q_PROPERTY(double value2 WRITE setValue2)
    Q_PROPERTY(double result READ getResult NOTIFY resultChanged)

    double value1_ = 0.0;
    double value2_ = 0.0;
    double result_ = 0.0;
};

#endif // WORKER_H
