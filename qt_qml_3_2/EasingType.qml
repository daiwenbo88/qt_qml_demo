import QtQuick

Item {
    id:root
    width: 100
    height: 100
    property alias title: label.text
    property alias source: image.source
    property var easingType;
    signal clicked

    Image{
        id:image
        anchors.fill: parent
        source: "../curves/"+title+".png"

    }
    Text{
        id:label
        text:"text"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        color: "red"

    }
    MouseArea{
        anchors.fill: parent
        onClicked: root.clicked()

    }
}
