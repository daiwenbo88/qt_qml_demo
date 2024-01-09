import QtQuick
import QtQuick.Window
import QtMultimedia
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    MediaPlayer{
        id:player
        source: "../assets/test.mp4"
        audioOutput: audioOutput
        videoOutput: videoOutput
    }
    AudioOutput{//音频
        id:audioOutput
        volume: volumeSlider.value
    }

    VideoOutput{//视频
        id:videoOutput
        //width: parent-80
        anchors.fill: parent
    }
    //音量控制
    Rectangle{
        color: 'black'
        width: col.width
        height: col.height
        anchors.top: parent.top
        anchors.right: parent.right

        Column{
            id:col
            Text {
                color: "white"
                text: qsTr("音量")
            }
            Slider{
                id:volumeSlider
                orientation: Qt.Vertical
                value: 0.5
                anchors.margins: 20
            }
        }
    }
    Row{
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20
        spacing: 20

        Button{
            width: 50
            anchors.verticalCenter: parent.verticalCenter
            text: player.playbackState===MediaPlayer.PlayingState?'暂停':'播放'
            onPressed: {
                switch(player.playbackState){
                case MediaPlayer.PlayingState:player.pause() ;break
                case MediaPlayer.PausedState:player.play() ;break
                case MediaPlayer.StoppedState:player.play() ;break
                }
            }
        }
        Slider{
            id:slider
            width: parent.width-80
            anchors.verticalCenter: parent.verticalCenter
            value: player.duration>0?player.position/player.duration:0
            background: Rectangle{
                implicitHeight: 8
                radius: 3
                color: 'lightgreen'
                Rectangle{
                    width: slider.value*parent.width
                    height: parent.height
                    color: 'lightblue'
                    radius: 3
                }
            }
            onMoved: function(){
                player.position=player.duration*value
            }
        }

    }


    Component.onCompleted: {
        player.play()
    }


}
