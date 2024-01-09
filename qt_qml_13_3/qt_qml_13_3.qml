import QtQuick
import QtQuick.Window
import QtQml.XmlListModel

Rectangle {
    width: 300
    height: 480
    visible: true
    color:"#000"

//    GridView{
//        id:view
//        anchors.fill: parent
//        cellHeight: width/4
//        cellWidth: cellHeight
//        delegate: Rectangle{
//            required property var modelData
//            width: view.cellWidth
//            height: view.cellHeight
//            color: modelData.value

//        }
//    }

    GridView{
        id:gridView
//        anchors.left: parent.left
//        anchors.right: parent.right
//        anchors.top: view.bottom

        anchors.fill: parent

        cellHeight: width/4
        cellWidth: cellHeight
        model:xmlModel
        delegate: Rectangle{
            required property var model
            width: gridView.cellWidth
            height: gridView.cellHeight
            color: model.value
            Text {
                anchors.centerIn: parent
                text: parent.model.name
            }
        }
    }

    XmlListModel{
         id:xmlModel
         source: "colors.xml"
         query: "/colors/color"
         XmlListModelRole{name: 'name';elementName: 'name'}
         XmlListModelRole{name: 'value';elementName: 'value'}
    }

    function request(){
        var xhr = new XMLHttpRequest()
        xhr.onreadystatechange=function(){
            if(xhr.readyState===XMLHttpRequest.DONE){
                var json = JSON.parse(xhr.response.toString())
                view.model=json.colors
            }

        }
        xhr.open("GET",'colors.json')
        xhr.send()
    }

    Component.onCompleted: {
        //request()
    }
}
