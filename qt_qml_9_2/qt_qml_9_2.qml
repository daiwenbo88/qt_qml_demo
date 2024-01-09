import QtQuick
import QtQuick.Window
import QtQuick.Particles

Rectangle {
    id:root
    width: 640
    height: 480
    color: '#1f1f1f'
    property bool tracer: true

    ParticleSystem{
        id:particleSystem
    }
    Emitter{
        id:rocketEmitter
        anchors.bottom: root.bottom
        anchors.fill: parent
        system: particleSystem
        group: 'rocket'
        emitRate: 2
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
        Tracer{
            color: 'red'
            visible: tracer

        }

    }
    TrailEmitter{
        id:somkeEmitter
        system: particleSystem
        emitHeight: 1
        emitWidth: 4
        group: 'smoke'
        follow: 'rocket'//跟随rocket 发射粒子
        emitRatePerParticle: 64//每秒产生64个
        lifeSpan: 200
        size:16
        sizeVariation: 4
        endSize: 2
        velocity: AngleDirection{
            angle: 90
            magnitude: 100//每秒移动像素
            magnitudeVariation: 5//像素差异
        }
    }
    //降低粒子速度
    Friction{
        groups: ['rocket']
        anchors.top: parent.top
        width: parent.width
        height: 80
        system:particleSystem
        factor:0.8//每次减低0.2
        threshold: 5//降低到5就不降低了
    }
    //粒子抖动效果
    Turbulence{
        groups: ['rocket']
        anchors.bottom: root.bottom
        width: parent.width
        height: 160
        system:particleSystem
        strength: 25//强度
        Tracer{
            color: 'green'
            visible: tracer

        }

    }
    GroupGoal{
        id:rocketChanger
        anchors.top: root.top
        width: root.width
        height: 80
        system: particleSystem
        groups: ['rocket']
        goalState: 'explosion'//rocket执行完后 立即执行explosion
        jump:true
        Tracer{
            color: 'blue'
            visible: tracer
        }
    }
    ParticleGroup{
        name:'explosion'
        system: particleSystem
        TrailEmitter{
            id:explosionEmitter
            group: 'sparkle'
            follow: 'rocket'
            lifeSpan: 1750
            emitRatePerParticle: 200//每秒发射多少个
            size: 32
            velocity: AngleDirection{
                angle: -90
                angleVariation: 180
                magnitude: 50//每秒移动像素
                magnitudeVariation: 5//像素差异
            }

        }

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
    ImageParticle{
        id:sparklePainter
        system: particleSystem
        groups: ['sparkle']
       source: "../assets/star.png"
        alpha: 0.3
        color: 'red'
        colorVariation: 0.6
        entryEffect: ImageParticle.Fade//进场出场效果
    }
    ImageParticle{
        id:rocketPainter
        system: particleSystem
        groups: ['rocket']
        source: "../assets/rocket.png"
        entryEffect: ImageParticle.Fade//进场出场效果
    }

}
