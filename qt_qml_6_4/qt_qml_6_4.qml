import QtQuick
import QtQuick.Window
import "../common"
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    ListView{
        delegate: spaceManDelegate
        section.delegate: sectionDelefate
        section.property: 'nation'
        section.criteria: ViewSection.FirstCharacter//使用section首个字母 默认ViewSection.FullString
        anchors.fill: parent
        anchors.margins: 20
        model: spaceMen
    }
    Component{
        id:spaceManDelegate
        Item {
            required property string name
            width:ListView.width
            height: 20
            Text {

                text:parent.name
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12

            }
        }

    }

    Component{
         id:sectionDelefate
         BlueBox{
             width: ListView.view.width
             height: 20
            //required property string section
            text:section
         }
    }
    ListModel {
        id: spaceMen

        ListElement { name: "Abdul Ahad Mohmand"; nation: "Afganistan"; }
        ListElement { name: "Marcos Pontes"; nation: "Brazil"; }
        ListElement { name: "Alexandar Panayotov Alexandrov"; nation: "Bulgaria"; }
        ListElement { name: "Georgi Ivanov"; nation: "Bulgaria"; }
        ListElement { name: "Roberta Bondar"; nation: "Canada"; }
        ListElement { name: "Marc Garneau"; nation: "Canada"; }
        ListElement { name: "Chris Hadfield"; nation: "Canada"; }
        ListElement { name: "Guy Laliberte"; nation: "Canada"; }
        ListElement { name: "Steven MacLean"; nation: "Canada"; }
        ListElement { name: "Julie Payette"; nation: "Canada"; }
        ListElement { name: "Robert Thirsk"; nation: "Canada"; }
        ListElement { name: "Bjarni Tryggvason"; nation: "Canada"; }
        ListElement { name: "Dafydd Williams"; nation: "Canada"; }
    }
}
