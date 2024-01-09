import QtQuick
import QtQuick.Window
import Qt.labs.qmlmodels

TableView {
    width: 400
    height: 400
    visible: true
    columnSpacing:5
    rowSpacing:5
    model: TableModel{
        //列顺序排列
        TableModelColumn{display: "name"}
        TableModelColumn{display: "color"}

        rows:[
            {"color":"black","name":"cat"},
            {"color":"white","name":"cat"},
            {"color":"blue","name":"cat"},
            {"color":"green","name":"cat"},
            {"color":"yellow","name":"cat"},
            {"color":"black","name":"cat"},
        ]

    }
    delegate: Rectangle{
        implicitHeight: 50
        implicitWidth: 100
        border.width: 1
        Text{
            text: display
            anchors.centerIn: parent

        }


    }
}
