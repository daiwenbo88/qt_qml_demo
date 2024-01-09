import QtQuick
import QtQuick.Controls
ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Column{
        id:leftLayot
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        width: parent.width/2
        spacing: 10
        Repeater{
            model:5
            delegate:Button{
                width:parent.width
                height:70
                text:qsTr("Click me!")
            }
        }
    }
    Grid{
        anchors.top: parent.top
        anchors.left: leftLayot.right
        anchors.right: parent.right
        anchors.margins: 10
        columns: 2
        spacing: 5
        Repeater{
            model: 10
            delegate:Button{
                width: parent.width/2
                height:70
                text:qsTr("Click me!")
                checkable:true
            }

        }

    }
}
