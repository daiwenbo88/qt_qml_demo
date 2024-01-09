#include <QCoreApplication>
#include <QString>
#include <QFile>
#include <QDir>
#include <QTextStream>

int main(int argc, char *argv[])
{
    //创建message对象
    QString message("hello world!!");
    //打开out.txt 文件
    QFile file(QDir::home().absoluteFilePath("out.txt"));
    //判断是否以写的方式打开文件
    if(!file.open(QIODevice::WriteOnly)){
        qWarning()<<"Cannot open file";
        return -1;

    }
    //创建流对象
    QTextStream stream(&file);
    //写入文件
    stream<<message;


    return 0;
}
