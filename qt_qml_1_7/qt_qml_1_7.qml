import QtQuick
import QtQuick.Window
//DarkSquare{
//    id:root
//    width: 120;height: 240
//    Column{
//        id:column
//        anchors.centerIn: parent
//        spacing: 10

//        RedSquare{}
//        GreenSquare{width: 96}
//        BlueSquare{}

//    }

//}

//BrightSquare{
//    id:root
//    width: 400;height: 120
//    Row{
//        id:row
//        anchors.centerIn: parent
//        spacing: 10

//        RedSquare{}
//        GreenSquare{width: 96}
//        BlueSquare{}

//    }

//}

//BrightSquare{
//    id:root
//    width: 400;height: 120

//    Grid{
//        id:grid
//        anchors.centerIn: parent
//        spacing: 10

//        rows:2 //2行 3列
//        columns: 3

//        RedSquare{}
//        GreenSquare{}
//        BlueSquare{}
//        RedSquare{}
//        GreenSquare{}
//        BlueSquare{}
//    }
//}

//BrightSquare{
//    id:root
//    width: 400;height: 120

//    Flow{
//        id:flow
//        anchors.fill: parent
//        anchors.margins: 20
//        spacing: 10
//        RedSquare{}
//        GreenSquare{}
//        BlueSquare{}
//        RedSquare{}
//        GreenSquare{}
//        BlueSquare{}
//    }
//}

BrightSquare{
    id:root
    width: 400;height: 252
    property variant colorArray: ["#00bde3","#67c111","#ea7025"]//variant 类似于泛型
    Grid{//columns 默认值为4
        anchors.fill: parent
        anchors.margins: 8
        spacing: 4
        Repeater{//开启循环
            model: 16//创建16个 4*4
            delegate: Rectangle{
                required property int index//必须属性
                property int colorIndex: Math.floor(Math.random()*3)
                width:56;height: 56
                color: root.colorArray[colorIndex]
                border.color: Qt.lighter(color)
                Text{
                    anchors.centerIn: parent
                    color:"#f0f0f0"
                    text:"Cell"+parent.index
                }
            }

        }

    }

}



