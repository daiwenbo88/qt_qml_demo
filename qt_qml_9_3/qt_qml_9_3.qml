import QtQuick
import QtQuick.Window
import QtQuick.Particles
Rectangle {
    id:root
    width: 640
    height: 480
    color: '#1f1f1f'
    property bool tracer: true
    property var images: []
    ParticleSystem{
        id:particleSystem
    }
    //画家画粒子
    ImageParticle{
        id:somkePainter
        system: particleSystem
        groups: ['smoke']
        source: "../assets/star.png"
        alpha: 0.3
        entryEffect: ImageParticle.Fade//进场出场效果
    }

//    ImageParticle{
//        id:rocketPainter
//        system: particleSystem
//        groups: ['rocket']
//        source: "../assets/rocket.png"
//        entryEffect: ImageParticle.Fade//进场出场效果
//    }
    ItemParticle{
        id:rocketPainter
        groups: ['rocket']
        system: particleSystem
        delegate: itemDelegate
    }
    Component.onCompleted: {//组件加载完成时
        images.push("soccer_ball.png")
        images.push("ufo.png")
        images.push("triangle_red.png")
        images.push("triangle_green.png")
        images.push("triangle_blue.png")
    }
    Component{
        id:itemDelegate
        Item{
            id:container
            width: 32*Math.ceil(Math.random()*3)//Math.ceil 向上取整
            height: width
            Image {
                anchors.fill: parent
                anchors.margins: 4
                source: "../assets/"+root.images[Math.floor(Math.random()*4)]
            }
        }
    }

    Emitter{
        id:rocketEmitter
        anchors.bottom: root.bottom
        width: root.width
        height: 40
        system: particleSystem
        group: 'rocket'
        emitRate: 2 //速率 1秒2个
        maximumEmitted: 4//最多可生成4个
        lifeSpan: 4800//生命周期
        lifeSpanVariation: 400//生命周期差异
        size:32
        velocity: AngleDirection{
            angle: 270
            magnitude: 150//每秒移动像素
            magnitudeVariation: 10//像素差异

        }
        //粒子重力回落
        acceleration: AngleDirection{//
            angle: 90 //角度
            angleVariation: 0//角度偏差
            magnitude: 25 //每秒移动100像素
            magnitudeVariation: 50 //每秒移动偏差
        }

    }
    TrailEmitter{
        id:somkeEmitter
        system: particleSystem
        emitHeight: 1
        emitWidth: 4
        group: 'smoke'
        follow: 'rocket'//跟随rocket 发射粒子
        emitRatePerParticle: 16//每秒产生64个
        lifeSpan: 200
        size:16
        sizeVariation: 8
        endSize: 2
        velocity: AngleDirection{
            angle: 90
            magnitude: 100//每秒移动像素
            magnitudeVariation: 5//像素差异
        }
    }
}
