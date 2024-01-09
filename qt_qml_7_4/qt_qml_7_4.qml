import QtQuick
import QtQuick.Window

Rectangle {
    width: 640
    height: 480
    Row{
        id:colorTools
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 8
        }
        property color  paintColor: 'blue'
        Repeater{
            model: ['blue','gray','yellow','green']
            ColorSquare{
                color:modelData
                down: parent.paintColor===color//颜色一样 代表摁下状态
                onClicked: parent.paintColor=color//选中颜色
            }
        }

    }
    Canvas{
        id:canvas
        anchors{
            left:parent.left
            right: parent.right
            top:colorTools.bottom
            bottom:parent.bottom
            margins: 8

        }
        property real lastX
        property real lastY
        property color color: colorTools.paintColor
        onPaint: {
            var ctx = getContext('2d')
            ctx.lineWidth=1.5
            ctx.strokeStyle=canvas.color
            ctx.beginPath()
            ctx.moveTo(lastX,lastY)
            lastX=area.mouseX
            lastY=area.mouseY

            ctx.lineTo(lastX,lastY)
            ctx.stroke()
        }
        MouseArea{
            id:area
            anchors.fill: parent
            onPressed: {//设置按下时初始坐标
                canvas.lastX=mouseX
                canvas.lastY=mouseY

            }
            onPositionChanged: canvas.requestPaint()//鼠标滑动状态改变

        }

    }
}
