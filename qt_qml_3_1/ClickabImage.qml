import QtQuick

Item {
    id:root
    width: container.children.width
    height: container.children.height
    property alias text: lablel.text
    property alias source: image.source
    signal clicked
    Column{
        id:container
        Image{
            id:image
        }

        Text{
            id:lablel
            width: image.width
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            color:"#ececec"

        }

    }
    MouseArea{
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
