#ifndef CALC_H
#define CALC_H

#include "action.h"

#include <QObject>
#include <QQmlEngine>

class Calc : public QObject
{
    Q_OBJECT
public:
    explicit Calc(QObject* invokableObject, QObject *parent = nullptr);

signals:
    void resultChanged(double);

public slots:
    void calculate();

private:
    QObject* invokable_ = nullptr;
    QMap<QString, Action> actions_;

    QPair<bool, Action> convertAction(QString value);
};

#endif // WORKER_H
