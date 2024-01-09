import QtQuick
import QtQuick.Window

Window {
    id:root
    width: 640
    height: 480
    visible: true
    title: qsTr("UFO")
    property int duration: 3000

    Image {

        source: "../assets/background.png"
        anchors.fill: parent
    }
    ClickabImage{
        id:ufo
        x:20
        y:root.height-height
        source: "../assets/ufo.png"
        text: "ufo"
        onClicked: anim.start()
    }

    ParallelAnimation{//顺序动画
        id:anim
        NumberAnimation {
            target: ufo
            property: "y"
            from: root.height-ufo.height
            to:20
            duration: root.duration
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: ufo
            property: "x"

            to:root.width-ufo.width
            duration: root.duration
            easing.type: Easing.InOutQuad
        }

    }
}
