import QtQuick

Item {
    id:root
    property alias text: label.text//对外暴漏属性 绑定一个别名
    signal clicked; //对外暴漏点击函数
    Rectangle{
        id:button
        x:112;y:100
        width: 116;height: 26
        color: "lightsteelblue"
        border.color: "slategrey"
        Text{
            id:label
            anchors.centerIn: parent
            text: "Start"
        }
       MouseArea{
            anchors.fill: parent
            onClicked: {
                root.clicked()//函数回调执行
            }
       }

    }

}
