import QtQuick
import QtQuick.Controls
import Qt.labs.platform as Platform
import QtQuick.Controls.Material

ApplicationWindow {
    width: 320
    height: 480
    visible: true
    title: qsTr("Image Viewer")

    background: Rectangle{
        color: "darkGray"
    }
//    header: ToolBar{
//        Flow{
//            anchors.fill: parent
//            ToolButton{
//                text: qsTr("Open")
//                //icon.name: "document-open"
//                icon.source: "/images/open.png"
//                onClicked: fileOpenDialog.open()
//            }

//        }

//    }
    header: ToolBar{
        Material.background: Material.Orange
        ToolButton{
            icon.source: "/images/open.png"
            onClicked: drawer.open()
        }
        Label{
            text: "Image viewer"
            font.pixelSize: 20
            anchors.centerIn: parent
        }

    }
    Drawer{
        id:drawer
        width: parent.width/3*2
        height: parent.height
        ListView{
            anchors.fill:parent
            model: ListModel{
                    ListElement{
                        text:"open"
                        triggered:function(){
                            fileOpenDialog.open()
                        }
                    }
                    ListElement{
                        text:"About"
                        triggered:function(){
                            aboutDialog.open()
                        }
                    }

            }
            delegate: ItemDelegate{
                text: model.text
                highlighted: ListView.isCurrentItem
                onClicked:{
                    drawer.close()
                    model.triggered()
                }
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
