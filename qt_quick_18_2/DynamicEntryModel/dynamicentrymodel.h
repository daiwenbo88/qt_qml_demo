#ifndef DYNAMICENTRYMODEL_H
#define DYNAMICENTRYMODEL_H

#include <QtQuick/QQuickPaintedItem>

class DynamicEntryModel : public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT
    Q_DISABLE_COPY(DynamicEntryModel)
public:
    explicit DynamicEntryModel(QQuickItem *parent = nullptr);
    void paint(QPainter *painter) override;
    ~DynamicEntryModel() override;
};

#endif // DYNAMICENTRYMODEL_H
