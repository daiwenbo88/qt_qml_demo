import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    GridView{
        id:gridView
        anchors.fill: parent
        anchors.margins: 10

        clip: true
        model: 100
        cellWidth: 45//每一个格间宽高
        cellHeight: 45
        flow:GridView.TopToBottom//item摆放方向
        delegate: GreenBox{
            required property int  index
            width: 40
            height: 40
            text: index

        }

    }
}
