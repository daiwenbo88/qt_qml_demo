import QtQuick
import QtQuick.Window
import QtQuick.Shapes
Rectangle {
    width: 600
    height: 400
    visible: true
    layer.enabled: true//设置抗锯齿
    layer.samples: 4
    Shape{
        ShapePath{
            startX: 20;
            startY: 70
            strokeColor: 'green'
            strokeWidth: 4
            PathLine{x:180;y:130}

        }
        ShapePath{
            strokeColor: 'green'
            strokeWidth: 4
            PathPolyline{//多个点连接线
                path: [
                    Qt.point(220,100),
                    Qt.point(260,20),
                    Qt.point(300,170),
                    Qt.point(340,60),
                    Qt.point(380,100)
                ]
            }
        }


        ShapePath{
            startX: 420;
            startY: 100
            strokeColor: 'green'
            strokeWidth: 4
            //useLargeArc: true 大圆弧度
            PathArc{x:580;y:180;radiusX: 120;radiusY: 120}
        }
        ShapePath{
            startX: 20;
            startY: 300
            strokeColor: 'green'
            strokeWidth: 4
            //贝塞尔曲线 controlX控制点
            PathQuad{x:180;y:300;controlX: 0;controlY: 0}
        }

        ShapePath{
            startX: 220;
            startY: 300
            strokeColor: 'green'
            strokeWidth: 4
            //贝塞尔曲线 controlX控制点
            PathCubic{x:380;y:300;
                control1X: 260;control1Y: 250
                control2X: 360;control2Y: 350
            }
        }

        ShapePath{
            startX: 420;
            startY: 300
            strokeColor: 'green'
            strokeWidth: 4
            //多点曲线连接
            PathCurve{x:460;y:220}
            PathCurve{x:500;y:370}
            PathCurve{x:540;y:270}
            PathCurve{x:580;y:300}
        }

    }
}
