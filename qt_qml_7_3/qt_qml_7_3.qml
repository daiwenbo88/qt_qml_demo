import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Rectangle{
        width: 240
        height: 120
        property real hue: 0.0
        Canvas {
            id: canvas
            x: 10; y: 10
            width: 100; height: 100
            property real hue: 0.0
            onPaint: {
                var ctx = getContext("2d")
                var x = 10 + Math.random(80)*80
                var y = 10 + Math.random(80)*80
                hue += Math.random()*0.1
                if(hue > 1.0) { hue -= 1 }
                ctx.globalAlpha = 0.7
                ctx.fillStyle = Qt.hsla(hue, 0.5, 0.5, 1.0)
                ctx.beginPath()
                ctx.moveTo(x+5,y)
                ctx.arc(x,y, x/10, 0, 360)
                ctx.closePath()
                ctx.fill()
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var url = canvas.toDataURL('image/png')
                    print('image url=', url)
                    image.source = url
                }
            }
        }
        Image {
            id: image
            x:130
            y:10
            width: 100
            height: 100
            //source: "../assets/demo_icon.png"
        }
        Timer{
            interval:1000//间隔
            running:true
            repeat: true//一直重复执行
            onTriggered: canvas.requestPaint()//通知画布进行绘制

        }

    }

}
