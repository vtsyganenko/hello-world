#include "widget.h"

#include <QLabel>
#include <QPushButton>
#include <QQuickWidget>
#include <QVBoxLayout>

Widget::Widget(QWidget *parent)
    : QWidget(parent)
{
    QLabel* header = new QLabel(tr("Пример QQuickWidget"), this);

    QPushButton* exitBtn = new QPushButton(this);
    exitBtn->setText("Exit");
    connect(exitBtn, &QPushButton::clicked, this, &Widget::exit);

    QQuickWidget* qw = new QQuickWidget(QUrl("qrc:/main.qml"));

    QVBoxLayout* layout = new QVBoxLayout;
    layout->addWidget(header);
    layout->addWidget(qw);
    layout->addWidget(exitBtn);
    setLayout(layout);
}

Widget::~Widget()
{

}
