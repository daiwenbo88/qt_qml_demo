#include "dynamicentrymodel.h"

DynamicEntryModel::DynamicEntryModel(QObject *parent):QAbstractListModel(parent){
    m_roleNames[NameRole]="name";
    m_roleNames[HueRole]="hue";
    m_roleNames[SaturationRole]="saturation";
    m_roleNames[BrightnessRole]="brightness";
//    for(const QString& name : QColor::colorNames()) {
//        m_data.append(QColor(name));
//    }
}
DynamicEntryModel::~DynamicEntryModel(){}

void DynamicEntryModel::insert(int index,const QString &colorValue){
    if(index<0||index>m_data.count()){return;}
    QColor color(colorValue);
    qDebug()<<color;
    if(!color.isValid()){return;}
    //插入数据前发出信号
    emit beginInsertRows(QModelIndex(),index,index);
    m_data.insert(index,color);
    //插入结束发出信号
    emit endInsertRows();
    //回调 countChanged
    emit countChanged(m_data.count());
}

void DynamicEntryModel::append(const QString &colorValue){
     qDebug()<<colorValue;
    insert(count(),colorValue);
}
void DynamicEntryModel::remove(int index){
    if(index<0||index>=m_data.count()){return;}
    emit beginRemoveRows(QModelIndex(),index,index);
    m_data.removeAt(index);
    emit endRemoveRows();
    emit countChanged(m_data.count());
}

void DynamicEntryModel::clear(){
    emit beginResetModel();
    m_data.clear();
    emit endResetModel();
}
QColor DynamicEntryModel::get(int index){
    if(index<0||index>=m_data.count()){return QColor();}
    return m_data.at(index);
}

int DynamicEntryModel::rowCount(const QModelIndex &parent) const{
    Q_UNUSED(parent);
    return m_data.count();
}

QVariant DynamicEntryModel::data(const QModelIndex &index, int role) const{
    int row = index.row();
    if(row<0||row>=m_data.count()){return QVariant();}
    const QColor &color=m_data.at(row);
    qDebug()<<row<<role<<color;
    switch (role) {
    case NameRole:
        return color.name();
    case HueRole:
        return color.hueF();
    case SaturationRole:
        return color.saturationF();
    case BrightnessRole:
        return color.lightnessF();
    }
    return QVariant();
}
//获取count数量
int DynamicEntryModel::count() const{
    return rowCount(QModelIndex());
}
QHash<int,QByteArray> DynamicEntryModel::roleNames()const{
    return m_roleNames;
}
