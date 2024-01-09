import QtQuick
import QtQuick.Window
import QtQuick.Shapes
Rectangle {
    width: 640
    height: 480
    Shape{
        ShapePath{
            strokeColor: 'darkGray'
            fillColor: 'lightGreen'
            strokeWidth: 3
            startX: 20
            startY: 140
            PathLine{x:180;y:140}
            PathArc{
                x:20;y:140
                direction: PathArc.Counterclockwise
                radiusX: 80;radiusY: 80
            }

        }
        ShapePath{
            strokeColor: 'darkGray'
            fillColor: 'lightGreen'
            fillGradient: LinearGradient{//线性渐变色
                x1:50;y1:300
                x2:150;y2:280
                GradientStop{position: 0.0;color:'lightGreen'}
                GradientStop{position: 0.7;color:'yellow'}
                GradientStop{position: 1.0;color:'darkGreen'}
            }
            strokeWidth: 3
            startX: 20
            startY: 340
            PathLine{x:180;y:340}
            PathArc{
                x:20;y:340
                direction: PathArc.Counterclockwise
                radiusX: 80;radiusY: 80
            }

        }
        ShapePath{
            strokeColor: 'darkGray'
            fillColor: 'lightGreen'
            fillGradient: ConicalGradient{//渐变色
                centerX:300
                centerY:100//设置中心点
                angle: 45//设置渐变角度
                GradientStop{position: 0.0;color:'lightGreen'}
                GradientStop{position: 0.7;color:'yellow'}
                GradientStop{position: 1.0;color:'darkGreen'}
            }
            strokeWidth: 3
            startX: 220
            startY: 140
            PathLine{x:380;y:140}
            PathArc{
                x:220;y:140
                direction: PathArc.Counterclockwise
                radiusX: 80;radiusY: 80
            }

        }
        ShapePath{
            strokeColor: 'darkGray'
            fillColor: 'lightGreen'
            fillGradient: RadialGradient{//使用内圆和外圆产生渐变
                centerX:300
                centerY:280//设置中心点
                centerRadius: 120
                focalX: centerX
                focalY: centerY//内圆
                focalRadius:30
                GradientStop{position: 0.0;color:'lightGreen'}
                GradientStop{position: 0.7;color:'yellow'}
                GradientStop{position: 1.0;color:'darkGreen'}
            }
            strokeWidth: 3
            startX: 220
            startY: 340
            PathLine{x:380;y:340}
            PathArc{
                x:220;y:340
                direction: PathArc.Counterclockwise
                radiusX: 80;radiusY: 80
            }

        }

    }
}
