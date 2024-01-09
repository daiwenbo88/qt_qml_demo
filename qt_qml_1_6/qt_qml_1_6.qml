import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Rect")

    Rectangle{
           id:rect1
           x:12
           y:12
           width:76
           height: 76
           color:'lightsteelblue'
    }

    Rectangle{
           id:rect2
           x:112
           y:12
           width:76
           height: 76

           border.color: 'lightsteelblue'
           border.width: 4
           radius:20
    }

    Rectangle{
           id:rect3
           x:212
           y:12
           width:76
           height: 76
           gradient: Gradient{//渐变色
                GradientStop{
                    position: 0.0//顶部
                    color:'green'
                }
                GradientStop{
                    position: 1.0//底部
                    color:'red'
                }
           }
           border.color: 'lightsteelblue'//边框
           border.width: 4
           radius:20
           //获取鼠标事件
           MouseArea{
                id:area
                width: parent.width
                height: parent.height
                onClicked: rect2.visible=!rect2.visible
           }
    }

    Image {
        id: image
        x:12;y:100
        width: 72
        height: 72
        source: "https://t7.baidu.com/it/u=1819248061,230866778&fm=193&f=GIF"
        fillMode: Image.PreserveAspectCrop//图像均匀缩放填充
        clip: true//裁剪图片避免在区域外绘制
    }

    Button{
        id:buttons
        text: "开始"
        onClicked:{
           status.text="Button clicked"
        }
    }
    Text {
        id: status
        x:112;y:100+buttons.height+height
        text:"waitting.."
        horizontalAlignment: Text.AlignHCenter
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            trangleBlue.x=12
            trangleGreen.rotation=0
            trangleRed.rotation=0
            trangleRed.scale=1.0
        }

    }

    ClickableImage{
        id:trangleBlue
        x:12
        y:200
        source: "../assets/triangle_blue.png"
        onClicked: {
            x+=10
        }
    }
    ClickableImage{
        id:trangleGreen
        x:112
        y:200
        source: "../assets/triangle_green.png"
        onClicked: {
           rotation+=10
        }
    }
    ClickableImage{
        id:trangleRed
        x:212
        y:200
        source: "../assets/triangle_red.png"
        onClicked: {
           rotation+=10
            scale+=0.1
        }
    }

}
