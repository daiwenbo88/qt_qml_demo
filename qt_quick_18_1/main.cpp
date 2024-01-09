#include <QGuiApplication>
#include <QtQml>
#include <QTime>
class CurrentTime{
public:
    QString value(){
        return QTime::currentTime().toString();
    }
};

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    CurrentTime currentTime;
    const QUrl url(u"qrc:/qt_quick_18_1/main.qml"_qs);
    engine.rootContext()->setContextProperty("current",currentTime.value());
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
