import QtQuick
import QtQuick.Window

Item {
    id:root
    width: 150
    height: 260
    property color black: 'black'
    property color red: 'red'
    property color green: 'green'
    Rectangle{
        anchors.fill: parent
        color:"#333333"

    }
    state: "stop"
    states: [//状态组
        State {
            name: "stop"
            PropertyChanges {target: light1;color:root.red }
            PropertyChanges {target: light2;color:root.black }
        },
        State {
            name: "go"
            PropertyChanges {target: light1;color:root.black }
            PropertyChanges {target: light2;color:root.green }
        }
    ]
    transitions: [//转换
        Transition {
            //from: "stop" to: "go"
            from:"*"; to:"*"

            ColorAnimation {
                target: light1
                property: "color"
                duration: 500
            }

            ColorAnimation {
                target: light2
                property: "color"
                duration: 500
            }
        }

    ]
    Rectangle{
        id:light1
        radius: width/2
        x:25;y:25
        width: 100;
        height: width
        color: root.black
        border.color: Qt.lighter(color,1.1)
    }
    Rectangle{
        id:light2
        radius: width/2
        x:25;y:135
        width: 100;
        height: width
        color: root.black
        border.color: Qt.lighter(color,1.1)
    }
    MouseArea{
        anchors.fill: parent
        onClicked: parent.state=(parent.state=="stop"?"go":"stop")
    }
}
