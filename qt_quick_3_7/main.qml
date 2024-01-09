import QtQuick
import QtQuick.Controls
import Qt.labs.platform as Platform

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Image Viewer")

    background: Rectangle{
        color: "darkGray"
    }
    header: ToolBar{
        Flow{
            anchors.fill: parent
            ToolButton{
                text: qsTr("Open")
                //icon.name: "document-open"
                icon.source: "/images/open.png"
                onClicked: fileOpenDialog.open()
            }

        }

    }
    menuBar: MenuBar{
        Menu{
            title:"&File"
            MenuItem{
                text:"&open..."
                icon.source: "/images/open.png"
                onTriggered: fileOpenDialog.open()

            }
        }
        Menu{
            title:"&Help"
            MenuItem{
                text:"&About..."
                icon.source: "/images/open.png"
                onTriggered: aboutDialog.open()

            }
        }

    }
    Image {
        id: image
        source: "/images/le.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit//不裁剪
        asynchronous: true//异步加载图片
    }
    Platform.FileDialog{
        //foder: StandardPaths//指定打开文件目录
        id:fileOpenDialog
        title: "选择图片"
        nameFilters: [//过滤文件
            "Images files(*.png *.jpg)","all files(*.*)"

        ]
        onAccepted: {//确认
            image.source=fileOpenDialog.file
        }

    }
    Dialog{
        id:aboutDialog
        width: 300
        height: 150
        anchors.centerIn: parent
        title: "About"
        Label{
            anchors.fill: parent
            text: "感谢使用!"
            horizontalAlignment: Text.AlignHCenter
        }
        standardButtons: Platform.StandardButton.Ok

    }
}
