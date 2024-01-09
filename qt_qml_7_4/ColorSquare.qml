import QtQuick
import QtQuick.Controls

Button {
    width:100
    height: 100
    property alias  color: background.color
    Rectangle{
        width:80
        height: 80
        opacity: 0.7
        id:background
        anchors.centerIn: parent
    }
}
