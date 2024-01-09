import QtQuick
import QtQuick.Window

Rectangle {
    id:root
    width: 640
    height: 480
    visible: true
    //渐变色设置
    gradient: Gradient{
        GradientStop{position: 0.0;color: "#4a4a4a"}
        GradientStop{position: 1.0;color: "#2b2b2b"}
    }
    //View
    PathView{
        model: 100
        anchors.fill: parent
        delegate: flipCardDelegate
        path: Path{
            startX:root.width/2
            startY: 0
            PathAttribute{name:"itemZ";value: 0}
            PathAttribute{name:"itemAngle";value: -90}
            PathAttribute{name:"itemScale";value: 0.50}
            PathLine{x:root.width/2;y:root.height*0.4}
            PathPercent{value: 0.48}
            PathLine{x:root.width/2;y:root.height*0.5}

            PathAttribute{name:"itemZ";value: 100}
            PathAttribute{name:"itemAngle";value: 0}
            PathAttribute{name:"itemScale";value: 1.00}
            PathLine{x:root.width/2;y:root.height*0.6}
            PathPercent{value: 0.52}
            PathLine{x:root.width/2;y:root.height}

            PathAttribute{name:"itemZ";value: 0}
            PathAttribute{name:"itemAngle";value: 90}
            PathAttribute{name:"itemScale";value: 0.50}
            PathPercent{value:1}
        }
        pathItemCount: 16
        preferredHighlightBegin: 0.5//设置选中的项
        preferredHighlightEnd: 0.5

    }
    Component{
        id:flipCardDelegate
        BlueBox{
            id:wrapper
            width: 64
            height: 64
            text: index
            z:PathView.itemZ//z轴旋转
            scale:PathView.itemScale//缩放
            antialiasing:true//抗锯齿
            opacity:PathView.isCurrentItem?1:0.5
            gradient: Gradient{
                GradientStop{position: 0.0;color: "#2ed5fa"}
                GradientStop{position: 1.0;color: "#2467ec"}
            }
            transform: Rotation{
                axis{x:1;y:0;z:0}
                angle: wrapper.PathView.itemAngle//角度
                origin{x:32;y:32}
            }
        }
    }
}
