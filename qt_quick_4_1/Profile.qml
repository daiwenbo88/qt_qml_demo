import QtQuick
import QtQuick.Controls

Page {
    title:"Profile"
    Column{
        spacing: 10
        anchors.centerIn: parent
        Button{
            text: "Edit"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: stackView.push("EditProfile.qml")

        }
        Label{
            anchors.horizontalCenter: parent.horizontalCenter
            text:"Profile Screen"
        }
    }

}

