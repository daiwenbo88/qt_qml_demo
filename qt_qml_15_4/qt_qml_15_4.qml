import QtQuick 2.9
import QtQuick.Window
import "create-object.js" as CreateObject
import QtQml.XmlListModel
import QtQuick.Controls

Rectangle {
    id:root
    width: 1024
    height: 600
    property int dsIndex

    ListModel{
        id:objectsModel
    }

    function addUfo(){
        CreateObject.create("ufo.qml",root,itemAdded)
    }
    function addRocket(){
        CreateObject.create("rocket.qml",root,itemAdded)
    }
    function itemAdded(obj,source){
        objectsModel.append({"obj":obj,"source":source})
    }

    function clearItems(){
        while(objectsModel.count>0){
            objectsModel.get(0).obj.destroy()
            objectsModel.remove(0);
        }
        dsIndex=0
    }
    function serialize(){
        var res = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<scene>\n";
        for(var i=0;i<objectsModel.count;++i){
            var item= objectsModel.get(i)
            res+="<Item>\n <source>"+item.source+"</source>\n<x>"+
                    item.obj.x+"</x>\n<y>"+item.obj.y+"</y>\n  </item>\n"
        }
        res+="</scene>"
        return res
    }

    XmlListModel{
        id:xmlModel
        query: "/scene/item"
        XmlListModelRole{name: "source"; elementName:"source"}
        XmlListModelRole{name: "x"; elementName:"x"}
        XmlListModelRole{name: "y"; elementName:"y"}
    }

    function deserialize(){
        dsIndex=0
        CreateObject.create(xmlModel.reload(dsIndex).source,root,dsItemAdded)

    }
    function dsItemAdded(obj,source){
        itemAdded(obj,sou)
        obj.x=xmlModel.get(dsIndex).x
        obj.y=xmlModel.get(dsIndex).y
        dsIndex++
        if(dsIndex<xmlModel.count){
            CreateObject.create(xmlModel.reload(dsIndex).source,root,dsItemAdded)
        }
    }

    Column {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 10

            spacing: 10

            width: 100

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: "ufo.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: addUfo();
                }
            }

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: "rocket.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: addRocket();
                }
            }
            Button{
                anchors.horizontalCenter: parent.horizontalCenter
                width: 100
                height: 40
                background: Rectangle{
                   color: "#53d769"
                   radius: 4

                }
                text: "clear"
                onClicked: {
                    xmlModel.xml = serialize();
                    clearItems();
                }
            }

            Button{
                anchors.horizontalCenter: parent.horizontalCenter
                width: 100
                height: 40
                background: Rectangle{
                   color: "#fed958"
                   radius: 4

                }
                text: "恢复"
                onClicked: deserialize()
            }
        }
}

