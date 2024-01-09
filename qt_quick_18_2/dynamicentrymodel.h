#ifndef DYNAMICENTRYMODEL_H
#define DYNAMICENTRYMODEL_H


#include <QtCore>
#include <QtGui>

class DynamicEntryModel:public QAbstractListModel{
    Q_OBJECT
    //count 值发生变化就 调用countChanged 函数回调
    Q_PROPERTY(int count READ count NOTIFY countChanged)
public:
    enum RoleNames{
        NameRole=Qt::UserRole,
        HueRole=Qt::UserRole+2,
        SaturationRole=Qt::UserRole+3,
        BrightnessRole=Qt::UserRole+4
    };
    explicit DynamicEntryModel(QObject *parent=0);
    ~DynamicEntryModel();
    Q_INVOKABLE void insert(int index,const QString& colorValue);
    Q_INVOKABLE void append(const QString& colorValue);
    Q_INVOKABLE void remove(int index);
    Q_INVOKABLE void clear();
    Q_INVOKABLE QColor get(int index);
    //model 必须实现的虚函数
    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index,int role) const override;
    //成员count 返回值
    int count() const;
signals:
    void countChanged(int arg);
protected:
    virtual QHash<int,QByteArray> roleNames() const;
private:
    QList<QColor> m_data;
    QHash<int,QByteArray> m_roleNames;
    int m_count;
};

#endif // DYNAMICENTRYMODEL_H
