import QtQuick
import QtQuick.Window

Rectangle {
    id:root
    width: 640
    height: 480
    visible: true
    property int duration: 3000
    Rectangle{
        id:sky
        width: parent.width
        height: 240
        gradient: Gradient{
            GradientStop{position:0.0;color:"#0080ff"}
            GradientStop{position:1.0;color:"#66ccff"}
        }
    }
    Rectangle{
        id:ground
        width: sky.width
        anchors.top:sky.bottom
        anchors.bottom:root.bottom

        gradient: Gradient{
            GradientStop{position:0.0;color:"#00ff00"}
            GradientStop{position:1.0;color:"#00803f"}
        }
    }
    Image {
        id: ball
        source: "../assets/soccer_ball.png"
        scale:0.5
        x:0
        y:root.height-height

        MouseArea{
            anchors.fill: parent
            onClicked:{
                ball.x=0
                ball.y=root.height-height
                ball.rotation=0
                anim.start()
            }
        }
    }
    ParallelAnimation{
        id:anim
        SequentialAnimation{
            NumberAnimation {
                target: ball
                property: "y"
                to:20
                duration: root.duration*0.4
                easing.type: Easing.OutCirc
            }
            NumberAnimation {
                target: ball
                property: "y"
                to:root.height-ball.height
                duration: root.duration*0.6
                easing.type: Easing.OutBounce//弹跳
            }

        }
        NumberAnimation {
            target: ball
            property: "x"
            to:500
            duration: root.duration
            //easing.type: Easing.OutCirc
        }
        RotationAnimation{
            target: ball
            property: "rotation"
            to:720
            duration: root.duration
            //easing.type: Easing.InOutQuad
        }
    }
}
