import QtQuick
import QtQuick.Window
import QtQuick3D

Window {
    width: 640
    height: 480
    visible: true
    View3D{
        anchors.fill: parent
        environment: SceneEnvironment{
            clearColor: "#222222"//每一帧背景色
            backgroundMode: SceneEnvironment.Color//使用颜色清空背景
        }
        Model{
            position: Qt.vector3d(0,0,0)
            scale: Qt.vector3d(1,1.25,1)//缩放
            source: "#Cone"//锥形
            materials: [PrincipledMaterial{baseColor: "yellow"}]//纹理

        }
        Model{
            position: Qt.vector3d(80,0,50)

            source: "#Sphere"//球形
            materials: [PrincipledMaterial{baseColor: "green"}]//纹理

        }
        Model{
            position: Qt.vector3d(-100,0,50)
            source: "#Cube"//正方行
            materials: [PrincipledMaterial{baseColor: "red"}]//纹理
        }
        Model{
            position: Qt.vector3d(0,-50,0)
            eulerRotation.x: -90
             scale: Qt.vector3d(4,4,4)
            source: "#Rectangle"//正方行
            materials: [PrincipledMaterial{baseColor: "white"}]//纹理
        }
        //灯光
        PointLight{
            position: Qt.vector3d(100,100,100)
            castsShadow:true
        }
        //太阳光
        DirectionalLight{//平行光
            eulerRotation.x: -20
            eulerRotation.y:110
            castsShadow:true
        }
        //手电筒
        SpotLight{
            position: Qt.vector3d(50,200,50)
            eulerRotation.x:-90//从上往下看
            brightness: 5//亮度
            castsShadow:true
            ambientColor: Qt.rgba(0.1,0.1,0.1,1)//环境光颜色
        }
        PerspectiveCamera{//投影方式 透视投影
            position: Qt.vector3d(0,200,300)//摄像机位置
            Component.onCompleted: lookAt(Qt.vector3d(0,0,0))//摄像机往哪里看

        }

    }
}
