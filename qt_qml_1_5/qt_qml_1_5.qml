import QtQuick
import QtQuick.Window


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Text{
        id:text1
        text:"the quick brow fox"
        color:"#303030"
        font.family: 'Ubuntu'
        font.pixelSize: 28

    }
    Text{
        width:100
        y:text1.y+text1.height+20
        text:"the quick brow fox"
        color:"#303030"//文字本身颜色
        elide: Text.ElideMiddle//中间部分...
        wrapMode: Text.WordWrap//换行效果
        style:Text.Sunken
        styleColor: '#ff4444'//style风格颜色
        verticalAlignment: Text.AlignTop
        font.family: "宋体"
        font.pixelSize: 28

    }
}

