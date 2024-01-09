import QtQuick
import QtQuick.Window
import QtQuick.Shapes
Rectangle {
    width: 640
    height: 480
    Shape{
        ShapePath{
            strokeColor: 'darkGray'
            fillColor: 'orange'
            strokeWidth: 3
            fillRule: ShapePath.OddEvenFill//填充模式
            PathPolyline{
                path:[
                    Qt.point(100,20),
                    Qt.point(150,180),
                    Qt.point(20,75),
                    Qt.point(180,75),
                    Qt.point(50,180),
                    Qt.point(100,20)
                ]
            }
        }

        ShapePath{
            strokeColor: 'darkGray'
            fillColor: 'orange'
            strokeWidth: 3
            fillRule: ShapePath.WindingFill//填充模式
            PathPolyline{
                path:[
                    Qt.point(300,20),
                    Qt.point(350,180),
                    Qt.point(220,75),
                    Qt.point(380,75),
                    Qt.point(250,180),
                    Qt.point(300,20)
                ]
            }
        }

    }
}
