import QtQuick
import QtQuick.Window

Rectangle {
    width: 640
    height: 480
    visible: true

    //渐变色设置
    gradient: Gradient{
        GradientStop{position: 0.0;color: "#f6f6f6"}
        GradientStop{position: 1.0;color: "#d7d7d7"}
    }
    ListView{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 5
        model: itemModel

    }
    ObjectModel{
        id:itemModel
        Rectangle{
            height: 60
            width:80
            color: "blue"

        }
        Rectangle{
            height: 60
            width:80
            color: "green"
             Text{
                anchors.centerIn: parent
                text: "text"
            }
        }
        Rectangle{
            height: 60
            width:80
            color: "red"

        }
    }
}
