#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QFileSelector>
#include <QFile>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Material");//设置风格
    QQmlApplicationEngine engine;

    QFileSelector selector;
    QFile defaultsFiles(selector.select("qt_quick_3_9/main.qml"));
    qDebug()<<defaultsFiles.fileName();

    const QUrl url(defaultsFiles.fileName());
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
