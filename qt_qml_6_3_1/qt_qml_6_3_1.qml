import QtQuick
import QtQuick.Window
import QtQml.XmlListModel
//import QtQuick.XmlListModel

Window {
    width: 320
    height: 480
    visible: true

    ListView{
        id:listView
        anchors.fill: parent
        model: imageModel
        delegate:imageDalegate
    }

     XmlListModel{
        id:imageModel
        source: "https://www.nasa.gov/rss/dyn/image_of_the_day.rss"
        query: "/rss/channel/item"

        XmlListModelRole {
               name: "title"
               elementName: "title"
                }
        XmlListModelRole { name: "imageSource"; elementName: "enclosure"; attributeName: "url"}

    }
    Component{
        id:imageDalegate
        Rectangle{
            id:wrapper
            required property string title
            required property string imageSource
            width:listView.width
            height: 220
            Column{
                Text {

                    text: wrapper.title
                }
                Image{

                    source: wrapper.imageSource
                    height: 200
                    width:listView.width
                    fillMode: Image.PreserveAspectCrop
                }
            }
        }

    }
}
