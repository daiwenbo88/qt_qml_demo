import QtQuick
import QtQuick.Window

Rectangle {
    width: 120
    height: 300
    visible: true
    //渐变色设置
    gradient: Gradient{
        GradientStop{position: 0.0;color: "#f6f6f6"}
        GradientStop{position: 1.0;color: "#d7d7d7"}
    }
    ListView{
        anchors.fill: parent
        anchors.margins: 20
        focus: true
        clip: true
        spacing: 5
        model: 100
        delegate: numberDelefate
    }
    Component{
        id:numberDelefate
        Rectangle{
            required property int  index
            id:wrapper
            width:ListView.view.width//获取ListView 下面View 的只读宽度
            height:40
            color:ListView.isCurrentItem?'lightblue':'lightgreen'
            border.color: Qt.lighter('lightblue',0.8)
            Text {
                id: text
                text: wrapper.index
                anchors.centerIn: parent
                font.pixelSize: 12

            }

        }

    }
}
