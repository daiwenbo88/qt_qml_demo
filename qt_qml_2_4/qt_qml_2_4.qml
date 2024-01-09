import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("动画")
    Image{
        id:root
        source: "../assets/background.png"
        property int padding: 40 //定义变量
        property int duartion: 4000
        property bool running: false
        anchors.fill: parent
        Image{
            id:box
            x:root.padding
            y:(root.height-height)/2
            source: "../assets/triangle_green.png"

            NumberAnimation on x {
                to:root.width-box.width-root.padding
                duration: root.duartion
                running: root.running
            }

            RotationAnimator on rotation {
                to:360
                duration: root.duartion
                running: root.running
            }

        }
        //透明度动画
        OpacityAnimator on opacity {
            target: box
            to:0
            duration: root.duartion
            running: root.running
        }
        MouseArea{
            anchors.fill: parent
            onClicked: root.running=true
        }

    }
}
