import QtQuick
import QtQuick.Window
import QtQuick.Layouts

Rectangle {
    id:root
    width: childrenRect.width
    height: childrenRect.height
    color: "gray"
    gradient: Gradient{
        GradientStop{position: 0.0;color:root.color}
        GradientStop{position: 1.0;color:Qt.lighter(root.color,1.5)}
    }
    // A list of easing types
    property variant easings : [
        "Linear", "InQuad", "OutQuad", "InOutQuad",
        "InCubic", "InSine", "InCirc", "InElastic",
        "InBack", "InBounce" ]

    ColumnLayout{
        spacing: 20
        Grid{

            columns: 5
            Repeater{
                model: easings
                EasingType{
                    title: modelData
                    easingType: EasingType.modelData
                    onClicked:{
                        animation.easing.type=modelData
                        box.toggle=!box.toggle
                    }
                }
            }
        }
        Rectangle{
            height: 100
            Layout.fillWidth: true
            gradient: Gradient{
                GradientStop{position: 0.0;color:"blue"}
                GradientStop{position: 1.0;color:Qt.lighter("blue",1.5)}
            }
            Rectangle{
                id:box
                property bool toggle
                width: 80
                height: 80
                anchors.verticalCenter: parent.verticalCenter
                gradient: Gradient{
                    GradientStop{position: 0.0;color:"yellow"}
                    GradientStop{position: 1.0;color:Qt.lighter("yellow",1.5)}
                }
                x:toggle?20:root.width-width-20
                Behavior on x{
                    NumberAnimation {
                        id:animation
                        duration: 1000
                    }

                }

            }

        }
    }
}
