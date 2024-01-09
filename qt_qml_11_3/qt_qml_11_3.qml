import QtQuick
import QtQuick.Window
import QtMultimedia
import QtQuick.Controls

Rectangle {
    id:root
    width: 640
    height: 480
    visible: true
    property int _imageIndex: -1
    CaptureSession{
        id:captureSession
        camera: Camera{}
        videoOutput: output
        imageCapture: ImageCapture{
                id:imageCapture
                onImageSaved: function(Id,path){
                    imagePaths.append({"path":path})//捕获照片存放路径
                    listView.positionViewAtEnd()
                    image.source="file///"+path
                }
        }
    }

    VideoOutput{
        id:output
        width: 300
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: root.left

        MouseArea{
            anchors.fill: parent
            onClicked:imageCapture.capture()//点击捕获摄像头照片
        }
    }

    ListModel{
        id:imagePaths
    }

    ListView{
        id:listView
        anchors{
            left:root.left
            right: root.right
            bottom: root.bottom
            bottomMargin: 10

        }
        height: 100
        orientation: ListView.Horizontal
        spacing: 10
        model: imagePaths
        delegate: Image {
            required property string path
            required property int index
            id: name
            source: "file:///"+path
            fillMode: Image.PreserveAspectFit
            height: 100


            MouseArea{
                anchors.fill: parent
                onClicked:{
                    root._imageIndex=paerent.index
                    image.source=parent.source//选中某个图片
                }
            }
        }
        Rectangle{
            anchors.fill: parent
            opacity: 0.1
            color: 'lightgreen'
        }
    }
    Image {
        id: image
        width: 300
        anchors.left: output.right
        anchors.verticalCenter: parent.verticalCenter
        source: imageCapture.preview//显示摄像头捕获的照片
        fillMode: Image.PreserveAspectFit
    }

    Row{
        ComboBox{//切换摄像头
            id:cameraComBox
            height: 30
            model: med
            textRole: "description"
            onAccepted: function(index){
                captureSession.camera.cameraDevice=cameraComBox.currentValue
            }

        }
        Button{
            width: 50
            height: 30
            text: "删除"
            onClicked: {
                imagePaths.remove(root._imageIndex)
                image.source=""
            }

        }
        Button{
            width: 50
            height: 30
            text: "播放"
            onClicked: {
                startPlayback()
            }

        }

    }
    function startPlayback(){
        root._imageIndex=-1
        playTimer.start()
    }
    Timer{
        id:playTimer
        interval: 200
        repeat: false
        onTriggered: {
            if(root._imageIndex+1<imagePaths.count){
                root._imageIndex=root._imageIndex+1
                image.source="file:///"+imagePaths.get(root._imageIndex).path
                playTimer.start()
            }

        }

    }
    Component.onCompleted: captureSession.camera.start()//开启摄像头
}
