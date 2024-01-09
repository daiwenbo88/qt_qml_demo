import QtQuick
import QtQuick.Window
import QtQuick.Particles

Rectangle {
    width: 640
    height: 480
    visible: true
    id:root
    color:'#1f1f1f'
    ParticleSystem{
        id:particleSystem

    }
    Emitter{
        system: particleSystem
        width: 1
        height: 1
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        emitRate: 10//速率 1秒10ge
        lifeSpan: 4800 //2 秒产生10个
        lifeSpanVariation: 500//粒子显示时长差异
        size:16//粒子最小

//        velocity: AngleDirection{
//            angle: 0 //角度
//            angleVariation: 15//角度偏差 +-15
//            magnitude: 100 //每秒移动100像素
//            magnitudeVariation: 50 //每秒移动偏差
//        }
//        velocity: PointDirection{
//            x:100//x方向
//            y:0
//            xVariation: 0
//            yVariation: 100/6
//        }
//        velocity:TargetDirection{
//            targetX: 100//设置粒子发射方向
//            targetY: 0
//            targetVariation: 100/6//发射方向偏差
//            magnitude: 100 //每秒移动100像素
//            magnitudeVariation: 50 //每秒移动偏差
//        }

                velocity: AngleDirection{
                    angle: -45 //角度
                    angleVariation: 0//角度偏差
                    magnitude: 100 //每秒移动100像素
                    magnitudeVariation: 50 //每秒移动偏差

                }

                acceleration: AngleDirection{//
                    angle: 90 //角度
                    angleVariation: 0//角度偏差
                    magnitude: 25 //每秒移动100像素
                    magnitudeVariation: 50 //每秒移动偏差
                }

    }
    //粒子影响器
//    Age{
//        width: 240
//        height: 120
//        anchors.horizontalCenter: parent.horizontalCenter
//        system: particleSystem
//        lifeLeft: 1200 //改变粒子生命周期
//        once: true//只执行一次
//        advancePosition: true//体现在位置变化上
//        Rectangle{
//            anchors.fill: parent
//            border.color: 'red'
//            color: Qt.rgba(0,0,0,0)

//        }
//    }
    //黑洞效果
//    Attractor{
//        width: 240
//        height: 120
//        anchors.left:parent.left
//        anchors.top: parent.top
//        anchors.leftMargin: 100
//        anchors.topMargin: 80
//        system: particleSystem
//        pointX: 0
//        pointY: 0

//        strength: 1.0
//        once: true//只执行一次

//        Rectangle{
//            anchors.fill: parent
//            border.color: 'red'
//            color: Qt.rgba(0,0,0,0)

//        }
//    }
    //降低粒子速度
//    Friction{
//        width: 240
//        height: 120
//        anchors.left:parent.left
//        anchors.top: parent.top
//        anchors.leftMargin: 100
//        anchors.topMargin: 80
//        system: particleSystem
//        factor:0.8//每次减低0.2
//        threshold: 25//降低到25就不降低了

//        once: true//只执行一次

//        Rectangle{
//            anchors.fill: parent
//            border.color: 'red'
//            color: Qt.rgba(0,0,0,0)

//        }
//    }
    //添加粒子重力
//    Gravity{
//        width: 240
//        height: 120
//        anchors.left:parent.left
//        anchors.top: parent.top
//        anchors.leftMargin: 100
//        anchors.topMargin: 80
//        system: particleSystem
//        magnitude: 50
//        angle: 90


//        Rectangle{
//            anchors.fill: parent
//            border.color: 'red'
//            color: Qt.rgba(0,0,0,0)

//        }
//    }
    //粒子抖动效果
//    Turbulence{
//        width: 240
//        height: 120
//        anchors.left:parent.left
//        anchors.top: parent.top
//        anchors.leftMargin: 100
//        anchors.topMargin: 80
//        system: particleSystem
//        strength: 100
//        //noiseSource:
//        Rectangle{
//            anchors.fill: parent
//            border.color: 'red'
//            color: Qt.rgba(0,0,0,0)

//        }
//    }
    Wander{
        width: 240
        height: 120
        anchors.left:parent.left
        anchors.top: parent.top
        anchors.leftMargin: 100
        anchors.topMargin: 80
        system: particleSystem
        affectedParameter:Wander.Position//影响位置
        pace:200//每秒影响200次
        yVariance: 120
        xVariance: 0//影响范围 超出范围就不影响

        //noiseSource:
        Rectangle{
            anchors.fill: parent
            border.color: 'red'
            color: Qt.rgba(0,0,0,0)

        }
    }

    ImageParticle{
        source: "../assets/star.png"
        system: particleSystem

    }
}
