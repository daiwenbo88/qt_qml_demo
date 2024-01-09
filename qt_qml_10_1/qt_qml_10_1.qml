import QtQuick
import QtQuick.Window

Rectangle  {
    width: 640
    height: 480
   color: "#333"
   Row{
        anchors.centerIn: parent
        spacing: 20
        Image {
            id: sourceImage
            source: "../assets/tulips.jpg"
            width: 90
            height: width
        }
        //波动效果
        ShaderEffect {
            width: 90;
            height: width
            property variant source: sourceImage

            //频率为8
            property real frequency: 8
            //幅度为0.1
            property real amplitude: 0.1
            //事件从0到2PI
            property real time: 0.0
            NumberAnimation on time {
                from: 0; to: Math.PI*2; duration: 1000; loops: Animation.Infinite
            }

            fragmentShader: "
                   varying highp vec2 qt_TexCoord0;
                   uniform sampler2D source;
                   uniform lowp float qt_Opacity;
                   uniform highp float frequency;
                   uniform highp float amplitude;
                   uniform highp float time;
                   void main() {
                       //指定正弦波
                       highp vec2 pulse = sin(time - frequency * qt_TexCoord0);
                       highp vec2 coord = qt_TexCoord0 + amplitude * vec2(pulse.x, -pulse.x);
                       gl_FragColor = texture2D(source, coord) * qt_Opacity;
                   }"
        }
   }
}
