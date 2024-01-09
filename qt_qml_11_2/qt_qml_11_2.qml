import QtQuick
import QtQuick.Window
import QtMultimedia
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    SoundEffect{
        id:mine
        source: "res/beep.wav"
        volume: 0.05//声音大小控制
    }
    SoundEffect{
        id:machineGun
        source: "res/swosh.wav"
        loops: 2 //播放次数
    }
    Rectangle{
        id:rectangle
        anchors.centerIn: parent
        width: 300
        height: width
        color: 'red'
        state: "DEFAULT"
        states:[
            State {
                name: "DEFAULT"
                PropertyChanges {
                    target: rectangle
                    rotation:0;
                }
            },
            State {
                name: "REVERSE"
                PropertyChanges {
                    target: rectangle
                    rotation:170

                }
            }
        ]
        transitions: [
            Transition {
                to: "DEFAULT"
                ParallelAnimation{//并行动画
                    ScriptAction{script: machineGun.play()}
                    PropertyAnimation{
                        properties: 'rotation'
                        duration: 200
                    }
                }
            },
            Transition {
                to: "REVERSE"
                ParallelAnimation{//并行动画
                    ScriptAction{script: mine.play()}
                    PropertyAnimation{
                        properties: 'rotation'
                        duration: 200
                    }
                }
            }
        ]
    }
    Button{
        anchors.centerIn: parent
        text:'Flip'
        onClicked:rectangle.state=rectangle.state==="DEFAULT"?"REVERSE":"DEFAULT"
    }
}
