import QtQuick
import QtQuick.Window
import "common"

Window {
    width: 80
    height: 300
    visible: true
    title: qsTr("Hello World")
    ListView{
        id:listView
        anchors.fill:parent
        anchors.margins: 20
        clip:true//滑动柔顺效果
        model: 100
       // orientation:ListView.Horizontal//滑动方向
        //layoutDirection:"RightToLeft"//设置从右往左排列
        delegate: GreenBox{
            required property int index
            width: listView.width
            height: 40
            text: index
            color: "white"
            Component.onCompleted: {
                console.log(index+" added")
            }
            Component.onDestruction: {
                console.log(index+" deleted")
            }
        }
        spacing: 5
        cacheBuffer: 80//设置缓冲区像素高度
        focus: true //设置获取焦点
        highlight: highlightComponent//选中item 高亮效果
    }
    Component{
        id:highlightComponent
        GreenBox{
            id:greenBox
            width: listView.width
            height: 40
            y:listView.currentIndex.y//选中item y值发生变化
            Behavior on y{
                SequentialAnimation{
                    PropertyAnimation{
                        target: greenBox
                        property: "opacity"
                        to:0
                        duration: 200
                    }

                    NumberAnimation {duration: 200}
                    PropertyAnimation{
                        target: greenBox
                        property: "opacity"
                        to:1
                        duration: 200
                    }

                }
            }
        }

    }
}
