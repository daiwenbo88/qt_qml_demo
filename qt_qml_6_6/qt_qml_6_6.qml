import QtQuick
import QtQuick.Window
Rectangle {
    width: 640
    height: 480
    visible: true

    //渐变色设置
    gradient: Gradient{
        GradientStop{position: 0.0;color: "#f6f6f6"}
        GradientStop{position: 1.0;color: "#d7d7d7"}
    }
    ListModel{
        id:actionMoidel
        ListElement{
            name:"张三"
            hello:function(value){
                console.log(value+"张三")
            }
        }
        ListElement{
            name:"李四"
            hello:function(value){
                console.log(value+"李四")
            }
        }
        ListElement{
            name:"王五"
            hello:function(value){
                console.log(value+"王五")
            }
        }

    }
    ListView{
        anchors.fill: parent
        anchors.margins: 20
        focus: true
        model:actionMoidel
        spacing:5
        clip: true
        delegate: Rectangle{
            id:dalegate
            required property int index
            required property string name
            required property var hello
            width: ListView.view.width
            height: 40
            color: "lightBlue"
            Text {
                anchors.centerIn: parent
                font.pixelSize: 12
                text: dalegate.name
            }
            MouseArea{

                anchors.fill: parent
                onClicked: {
                    dalegate.hello(dalegate.index)
                }
            }
        }
    }
}
