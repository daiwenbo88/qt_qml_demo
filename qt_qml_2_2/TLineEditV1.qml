import QtQuick

//Rectangle {
//    width: 640
//    height: 36
//    color: "lightssteeblue"
//    border.color: "gray"
//    property alias text: input.text
//    property alias input: input
//    TextInput{
//        id:input
//        anchors.fill: parent
//        anchors.margins: 2
//    }
//}

FocusScope{
    width: 200;height: 30
    property alias text: input.text
    property alias input: input
    Rectangle{
        anchors.fill: parent
        color: "lightsteelblue"
        border.color: "gray"
    }
    TextEdit{
        id:input
        anchors.fill: parent
        anchors.margins: 2
        focus: true
        wrapMode: Text.WordWrap
    }
}
