import QtQuick
import QtQuick.Controls
Rectangle{
    width: 320
    height: 320
    color:"#ff0000"
    Button{
       anchors.centerIn: parent
       text: qsTr('Click Me')
       onClicked: qt.quit()
    }
}
