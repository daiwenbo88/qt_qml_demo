import QtQuick
import "common"

Window{
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Column{
        spacing: 2
        height: 160
        Repeater{
            //model: 10
            //model:["Enterprise","Columbia","Challenger","Discovery","Endeavour","Atlantis"]
            model:ListModel{
                  ListElement{name:"Mercury";surfaceColor:"gray"}
                  ListElement{name:"Venus";surfaceColor:"yellow"}
                  ListElement{name:"Earth";surfaceColor:"blue"}
                  ListElement{name:"Mars";surfaceColor:"orange"}
                  ListElement{name:"Jupiter";surfaceColor:"orange"}
                  ListElement{name:"Saturn";surfaceColor:"yellow"}
                  ListElement{name:"Uranus";surfaceColor:"lightBlue"}
                  ListElement{name:"Neptune";surfaceColor:"lightBlue"}

            }
            delegate: BlueBox{
                id:blueBox
                //required property int index
                //text:modelData+'('+index+')'//modelData 获取 model 里面的数据
                required property string name
                required property color surfaceColor//判断是否有这些属性
                text: name
                width:160
                height:30
                radius:3
                Rectangle{
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 4
                    width: 16
                    height: 16
                    radius: 8
                    color: blueBox.surfaceColor
                }

            }
            onItemAdded:console.log("item "+index+" added")
        }
    }
}
