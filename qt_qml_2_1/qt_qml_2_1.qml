import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("layout")
    Flow{
        id:flow
        anchors.fill: parent
        anchors.margins: 4
        GreenSquare{
            BlueSquare{
                text: "(1)"
                anchors.margins: 8
                anchors.fill: parent
            }
        }
        GreenSquare{
            BlueSquare{
                text: "(2)"
                y:8
                anchors.margins: 8
                anchors.left:parent.left
            }
        }
        GreenSquare{
            BlueSquare{
                text: "(3)"
                anchors.left:parent.right
            }
        }
        GreenSquare{

            BlueSquare{
                id:blue1

                text: "(4-1)"
                height: 25
                anchors.margins: 8
                anchors.top:parent.top
                anchors.horizontalCenter: parent.horizontalCenter
            }
            BlueSquare{
                text: "(4-2)"
                height: 25
                width: 75
                anchors.margins: 8
                anchors.top:blue1.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        GreenSquare{
            BlueSquare{
                text: "(5)"
                anchors.centerIn: parent
            }
        }

        GreenSquare{
            BlueSquare{
                text: "(6)"
                anchors.centerIn: parent
                //anchors.horizontalCenter: parent.horizontalCenter
                //anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenterOffset: -12
            }
        }
    }

}
