import QtQuick
import QtQuick.Window

Rectangle {
    width: 640
    height: 480
    color: "linen"
    TLineEditV1{
        id:input1
        text: "Text input 1"
        input.font.pixelSize: 16
        height: input.font.pixelSize+10
        input.color: "white"
        KeyNavigation.tab: input2
    }
    TLineEditV1{
        id:input2
        y:input1.y+input1.height+12
        text: "Text input 2"
        input.font.pixelSize: 16
        height: input.font.pixelSize+10
        input.color: "white"
        KeyNavigation.tab: input1
    }

}
