import QtQuick
import QtQuick.Window

Rectangle {
    id:container
    width: 600
    height: 400
    color: "white"
    Column{
        anchors.top: parent.top
        anchors.left: parent.left
        spacing: 20
        Rectangle{
            width: 290
            height: 50
            color: 'lightGray'
            MouseArea{
                anchors.fill: parent
                onClicked: container.state='left'
             }
            Text {
                anchors.centerIn: parent
                font.pixelSize: 30
                text: container.state==="left"?"Active":"inactive"
            }
        }
        Rectangle{
            id:leftRectangle
            width: 290
            height: 200
            color: 'green'
            MouseArea{
                id:leftMouseArea
                anchors.fill: parent
                onClicked: leftClickedAnimation.start()

             }
            Text {
                anchors.centerIn: parent
                font.pixelSize: 30
                color: "white"
                text: "Click me!"
            }
        }

    }
    Column{
        anchors.top: parent.top
        anchors.right: parent.right
        spacing: 20
        Rectangle{
            width: 290
            height: 50
            color: 'lightGray'
            MouseArea{
                anchors.fill: parent
                onClicked: container.state="right"

            }
            Text {
                anchors.centerIn: parent
                font.pixelSize: 30
                text: container.state==="right"?"Active":"inactive"

            }
        }
        Rectangle{
             id:rightRectangle
            width: 290
            height: 200
            color: 'blue'
            MouseArea{
                id:rightMouseArea
                anchors.fill: parent
                onClicked:rightClickedAnimation.start()

            }
            Text {
                anchors.centerIn: parent
                font.pixelSize: 30
                color: "white"
                text: "Click me!"

            }
        }

    }
    Text {
        id: activeText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        font.pixelSize: 30
        color: "red"
        text: "Active area clicked!"
        opacity: 0
    }
    SequentialAnimation{
        id:leftClickedAnimation

        PropertyAction {target: leftRectangle; property: "color";value: "white" }

        ColorAnimation {
            target: leftRectangle
            property: "color"
            to: "green"
            duration: 3000
        }
    }
    SequentialAnimation{
        id:rightClickedAnimation

        PropertyAction {target: rightRectangle; property: "color";value: "white" }

        ColorAnimation {
            target: rightRectangle
            property: "color"
            to: "blue"
            duration: 3000
        }
    }
    SequentialAnimation{
        id:activeClickedAnimation

        PropertyAction {target: activeText; property: "opacity";value: 1 }

        PropertyAnimation{
            target: activeText
            property: "opacity"
            to:0
            duration: 3000
        }
    }
    Connections{
        id:connections
        function onClicked(){activeClickedAnimation.start()}

    }
    states: [
        State {
            name: "left"
            StateChangeScript {//状态改变 会触发 connections执行
                //connections 绑定到leftMouseArea leftMouseArea 被点击了就执行 activeClickedAnimation动画
                script: connections.target=leftMouseArea

            }
        },
        State {
            name: "right"
            StateChangeScript {
                script: connections.target=rightMouseArea

            }
        }
    ]
    Component.onCompleted: {
        state="left"
    }
}
