import QtQuick

Rectangle {
    color: "lightgreen"
    property alias text: label.text

    Text {
        id: label
        text: qsTr("text")// This is available in all editors.
        anchors.centerIn: parent
        color: "black"
    }
}
