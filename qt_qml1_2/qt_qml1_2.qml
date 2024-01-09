import QtQuick
import QtQuick.Window

Rectangle {
    id:root
    width: 220
    height: 260
    color:"#4a4a4a"
    Image {
        id: image
        source: "images/pinwheel.png"
        x:(pra.width-width)/2
        y:(root.height-height)/2
    }
    Text {

       text: "大风车"
       color:'white'
       //x:(root.width-width)/2
       y:image.height+height+20
       width: root.width
       horizontalAlignment: Text.AlignHCenter//文本水平居中
    }
}
