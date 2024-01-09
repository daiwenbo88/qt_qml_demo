import QtQuick
import QtQuick.Window

Window {
    width: 640//background.width 绑定的方式
    height: 480
    visible: true
    title: qsTr("风车")

    Image {
        id: background
        anchors.fill: parent;//用当前元素填充parent
        source: "images/background.png"

        Image {
            anchors.bottom: parent.bottom;
            anchors.horizontalCenter: parent.horizontalCenter;
            id: pole
            source: "images/pole.png"
        }
        Image {
            anchors.centerIn: parent;//放到parent中间
            //anchors.verticalCenter: parent.verticalCenter;
            //anchors.horizontalCenter: parent.horizontalCenter;
            id: wheel
            source: "images/pinwheel.png"
            Behavior on rotation {//为特定的属性修改行为 提供动画
                NumberAnimation {//动画
                    duration: 200
                }
            }
        }
        //鼠标点击事件
        MouseArea{
            anchors.fill: parent;
            onClicked: wheel.rotation+=360//点击行为

        }
    }
}
