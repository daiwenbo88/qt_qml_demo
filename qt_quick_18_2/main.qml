import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window

import org.example

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Background{
        id:background
    }
    DynamicEntryModel{
        id:dynamic
        onCountChanged:{
            print('new count:'+count);
            print("last entry:"+get(count-1));
        }
    }

    Rectangle{
        anchors.fill: parent
        anchors.margins: 8

            ListView{
                id:view
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: textEntry.top
                model: dynamic
                delegate: ListDelegate{
                    width: ListView.view.width//toFixed(2) 设置精度
                    text: 'hsv('+
                          Number(model.hue).toFixed(2)+","+
                          Number(model.saturation).toFixed()+","+
                          Number(model.brightness).toFixed()+")"
                    color: model.name
                    onClicked: {
                        view.currentIndex=model.index
                        view.focus=true
                    }
                    onRemove: {
                        dynamic.remove(index)
                    }

                }
                highlight: ListHighlight{}
                add: Transition {
                    NumberAnimation{
                        properties: "x";
                        from: -view.width;
                        to:0
                        duration: 250;easing.type: Easing.InCirc
                    }
                    NumberAnimation{
                        properties: "y";
                        from: view.height;
                        duration: 250;easing.type: Easing.InCirc
                    }

                }
                remove: Transition {
                    NumberAnimation{
                        properties: "x";
                        to: view.width;
                        duration: 250;easing.type: Easing.InCirc
                    }


                }
                displaced: Transition {
                    SequentialAnimation{
                        NumberAnimation{
                            properties: "y";
                            duration: 75;easing.type: Easing.InCirc
                        }

                        PauseAnimation {
                            duration: 250
                        }

                    }

                }

            }


        TextEntry{
            id:textEntry
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 40
            onAppend:function(colorString){
                 print('colorString:'+colorString);
                if(dynamic.count==0){
                     dynamic.append(colorString)
                }else{
                     dynamic.insert(view.currentIndex,colorString)
                }

            }
            onUp:{
                view.decrementCurrentIndex()

            }
            onDown: {

                view.incrementCurrentIndex()
            }

        }


    }
}
