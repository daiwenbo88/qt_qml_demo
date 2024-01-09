import QtQuick
import QtQuick.Window
import QtQuick.Shapes

Rectangle {
    width: 600
    height: 600

    Shape{
        anchors.centerIn: parent
        ShapePath{
            id:shapePath
            property real t: 0.0

            NumberAnimation on t{
                duration: 500
                from: 0.0
                to:1.0
                loops: Animation.Infinite//动画执行方式 循环执行
                running: true
            }
            strokeColor: 'darkGray'
            fillColor:'lightGray'
            strokeWidth: 3
            startX: -40
            startY: 200
            PathArc{x:40;y:200;radiusX:200;radiusY:200;useLargeArc: true}
            PathLine{x:40;y:120}
            //direction: PathArc.Counterclockwise 逆时针绘制
            PathArc{x:-40;y:120;radiusX:120;radiusY:120;useLargeArc: true;direction: PathArc.Counterclockwise}
            PathLine{x:-40;y:200}

            PathMove{x:-20+(1.0-shapePath.t)*20;y:80+shapePath.t*50}
            PathArc{x:20-(1.0-shapePath.t)*20;y:80+shapePath.t*50;radiusX:20*shapePath.t;radiusY:20*shapePath.t;useLargeArc: true}
            PathArc{x:-20+(1.0-shapePath.t)*20;y:80+shapePath.t*50;radiusX:20*shapePath.t;radiusY:20*shapePath.t;useLargeArc: true}

            PathMove{x:-20;y:130+shapePath.t*50}
            PathArc{x:20;y:130+shapePath.t*50;radiusX:20;radiusY:20;useLargeArc: true}
            PathArc{x:-20;y:130+shapePath.t*50;radiusX:20;radiusY:20;useLargeArc: true}

            PathMove{x:-20;y:180+shapePath.t*50}
            PathArc{x:20;y:180+shapePath.t*50;radiusX:20;radiusY:20;useLargeArc: true}
            PathArc{x:-20;y:180+shapePath.t*50;radiusX:20;radiusY:20;useLargeArc: true}

            PathMove{x:-20+shapePath.t*20;y:230+shapePath.t*50}
            PathArc{x:20-shapePath.t*20;y:230+shapePath.t*50;radiusX:20*(1-shapePath.t);radiusY:20*(1-shapePath.t);useLargeArc: true}
            PathArc{x:-20+shapePath.t*20;y:230+shapePath.t*50;radiusX:20*(1-shapePath.t);radiusY:20*(1-shapePath.t);useLargeArc: true}
        }
    }
}
