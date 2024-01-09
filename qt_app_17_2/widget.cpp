#include "widget.h"
#include "./ui_widget.h"
#include <QtWidgets>
#include <QString>
#include <QFile>
#include <QDir>
#include <QTextStream>

Widget::Widget(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::Widget)
{
    QPushButton* button = new QPushButton("Store Content",this);
    button->setText("push");

    //setCentralWidget(button);
    connect(button,&QPushButton::clicked,this,&Widget::storeContent);

    ui->setupUi(button);
}

Widget::~Widget()
{
    delete ui;
}

void Widget::storeContent()
{
    //创建message对象
    QString message("hello world!!!!!");
    //打开out.txt 文件
    QFile file(QDir::home().absoluteFilePath("out.txt"));
    //判断是否以写的方式打开文件
    if(!file.open(QIODevice::WriteOnly)){
        qWarning()<<"Cannot open file";
        return;

    }
    //创建流对象
    QTextStream stream(&file);
    //写入文件
    stream<<message;
}

