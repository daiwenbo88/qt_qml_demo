import QtQuick

Rectangle {
    color: "blue"
    property alias text: label.text
    Text {
        id: label
        text: qsTr("text")// This is available in all editors.
        anchors.centerIn: parent
        color: "white"
    }
}
