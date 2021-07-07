#include <QGuiApplication>

#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "PlayerGenerator.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    PlayerGenerator generator;

    //qmlRegisterInterface<PlayerGenerator>("Generator.io", 1,0, "RootPlayerItem");
    //qRegisterMetaType<PlayerGenerator>();
    //qMetaTypeId<PlayerGenerator>();
    //qmlRegisterInterface<PlayerGenerator>("Generator.io", 1);
    //qmlRegisterCustomType<PlayerGenerator>("Generator.io", 1,0, "RootPlayerItem", nullptr);
    //int iQmlResult = qmlRegisterExtendedType<PlayerGenerator, QQmlPrivate::QQmlElement<PlayerGenerator>>("Generator.io", 1,0, "RootPlayerItem");
    //int iQmlResult = qmlRegisterExtendedType<PlayerGenerator, QQmlPrivate::QQmlElement<PlayerGenerator>>("Generator.io", 1,0, "RootPlayerItem");
    //QObject *pObj;
    //QQmlPrivate::qmlregister(QQmlPrivate::RegistrationType::TypeRegistration, &iQmlResult);

    qmlRegisterType<PlayerGenerator>("Generator.io", 1,0, "RootPlayerItem");

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);
    //"rootPlayerItem",
    engine.rootContext()->setContextProperty("rootPlayerItem", generator );

    return app.exec();
}
