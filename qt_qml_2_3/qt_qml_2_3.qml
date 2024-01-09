import QtQuick
import QtQuick.Window

Rectangle {
    width: 640
    height: 480
    visible: true
    GreenSquare{
        id:square
    }
    focus: true
    Keys.onLeftPressed: square.x-=8
    Keys.onRightPressed: square.x+=8
    Keys.onUpPressed: square.y-=8
    Keys.onDownPressed: square.y+=8
    Keys.onPressed:function(event){
        switch(event.key){
        case Qt.Key_Plus:square.scale+=0.2;break;
        case Qt.Key_Minus:square.scale-=0.2;break;
        }
    }
}
