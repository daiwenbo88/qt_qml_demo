import QtQuick
import QtQuick.Window
import "create-component.js" as ImageCreator
Window {
    id:root
    width: 1024
    height: 600
    visible: true
    title: qsTr("Hello World")
    function createItem(){
        //通过文本方式创建
        Qt.createQmlObject(
                    "import QtQuick 2.5; Rectangle{x:100;y:100;width:100;height:100;color:\"blue\"}",root,"dynamicItem"
                    )

    }
    //通过js方式创建
    //Component.onCompleted: ImageCreator.createImageObject()
    Component.onCompleted: createItem()
}
