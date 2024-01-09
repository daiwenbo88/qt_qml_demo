import QtQuick
import QtQuick.Window

Canvas {
    id:canvas
    width: 800
    height: 450
    property real lastX : width*Math.random()
    property real lastY :height*Math.random()
    property real hue :0
    onPaint: {
        var ctx= getContext('2d')


    }
    Timer{
        id:lineTimer

    }
    function blank(){
        context.fillStyle='rgba(0,0,0,0.1)'
        context.fillRect(0,0,canvas.width,canvas.height)

    }
}
