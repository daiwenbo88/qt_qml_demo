#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "dynamicentrymodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/qt_quick_17_3/main.qml"_qs);
    //注册model (路径，版本，)
   qmlRegisterType<DynamicEntryModel>("org.example", 1, 0, "DynamicEntryModel");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
