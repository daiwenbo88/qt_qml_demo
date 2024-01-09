import QtQuick
import QtQuick.Window

Window {

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        id:root
        anchors.fill: parent
        color:"gray"
        Rectangle{
            width: 40
            height: 40
            anchors.left: parent.left
            anchors.bottom: parent.bottom
        }

        ClickabImage{
            id:image
            x:40
            y:root.height-height
            source: "../assets/triangle_blue.png"
            text: "animation on property"
            NumberAnimation on y {
                duration: 3000
                to:40
            }
        }

        ClickabImage{
            id:image2
            x:60+image.width
            y:root.height-80
            source: "../assets/triangle_red.png"
            text: "animation on property"
            Behavior on y{ //y值变化就执行动画
                NumberAnimation {
                    duration: 3000
                }
            }
            onClicked: y=40
        }
        ClickabImage{
            id:image3
            x:80+image.width+image2.width
            y:root.height-80
            source: "../assets/triangle_green.png"
            text: "animation on property"
            // onClicked: anim.restart()
            NumberAnimation {
                id:anim
                target: image3
                to:40
                property: "y"
                duration: 3000
                from:root.height-image3.height
                running: area.pressed
            }
            MouseArea{
                id:area
                anchors.fill: parent

            }



        }
    }
}
