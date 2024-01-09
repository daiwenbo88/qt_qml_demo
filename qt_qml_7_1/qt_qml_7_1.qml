import QtQuick
import QtQuick.Window

Canvas {
    width:400
    height: 400
    visible: true
    id:canvas
    onPaint: {
        var ctx=getContext("2d")
        ctx.lineWidth=4
        ctx.strokeStyle='blue'//边框颜色
        ctx.fillStyle='steelblue'//填充色
        ctx.beginPath()
        ctx.moveTo(50,50)//画线
        ctx.lineTo(150,50)
        ctx.lineTo(150,150)
        ctx.lineTo(50,150)
        ctx.closePath()
        ctx.fill()//填充
        ctx.stroke()

        ctx.fillStyle='green'//填充色
        ctx.fillRect(20,20,80,80)
        ctx.clearRect(30,30,60,60)//擦除区域

        ctx.strokeStyle='red'//填充色
        ctx.strokeRect(20,20,40,40)

        //渐变色
        var gradient= ctx.createLinearGradient(0,0,0,canvas.height)//相对与整个换不进行设置
        gradient.addColorStop(0,'blue')
        gradient.addColorStop(0.5,'lightblue')
        ctx.fillStyle=gradient

        ctx.fillRect(50,50,100,100)

        ctx.fillRect(100,0,100,100)

        ctx.fillRect(0,100,100,100)
        //设置文字阴影
        ctx.shadowColor='lightblue'
        ctx.shadowOffsetX=2
        ctx.shadowOffsetY=2
        ctx.shadowBlur=10 //虚化
        //绘制字体
        ctx.fillStyle="#333"
        ctx.fillRect(200,0,200,200)
        ctx.font='bold 40px sans-serif'
        ctx.fillStyle="lightgreen"
        ctx.fillText("Canvas!",220,50)


        ctx.strokeStyle='yellow'//边框颜色
        ctx.translate(canvas.width/2,300)
        ctx.save()
        ctx.beginPath()
        ctx.rect(-20,-20,40,40)
        ctx.stroke()
        //ctx.resetTransform()
        ctx.restore()//恢复状态

        ctx.rotate(Math.PI/4)
        ctx.strokeStyle='green'//边框颜色
        ctx.save()
        ctx.beginPath()
        ctx.rect(-20,-20,40,40)
        ctx.stroke()
        ctx.restore()//恢复状态


        ctx.strokeStyle='red'//填充色
        ctx.resetTransform()
        ctx.beginPath()
        ctx.moveTo(100,100)//画线
        ctx.lineTo(200,100)
        ctx.lineTo(150,200)
        ctx.closePath()
        ctx.stroke()
        ctx.clip()//裁剪
        ctx.drawImage("../assets/demo_icon.png",100,100)
        ctx.restore()//恢复状态



    }
    //预加载需要绘制的图片
    Component.onCompleted:{
        loadImage("../assets/demo_icon.png")

    }
}
