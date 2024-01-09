import QtQuick


Rectangle{
    id:root
    width: 640
    height: 480
    Text{
        id:thisLabel
        x:24 ;y:16
        height:2*width
        property int times: 24
        property alias anotherTimes: thisLabel.times
        text: "thisLabel"+anotherTimes
        font.family: "Ubuntu"
        font.pixelSize: 24
        KeyNavigation.tab: thatLabel//按tab键 焦点切换到 thatLabel
        onHeightChanged: console.log('height:',height)
        focus: true
        color: focus?"red":"black"
        Rectangle{
            anchors.fill: parent
            color: 'yellow'
            z:parent.z-1//放到parent后面
        }
    }

    Text{
        id:thatLabel
        color: focus?"red":"black"
        x:24;y:124
        property int spacePresses: 0 //空格按了多少下
        text:"thatLabe"+spacePresses+"thimes"
       // onTextChanged: function(text){console.log("text change to:",text)}
        onTextChanged: (text)=>{console.log("text change to:",text)}
        focus: !thisLabel.focus // thisLabel获取了焦点就不获取焦点
        KeyNavigation.tab: thisLabel //按tab键 焦点切换到 thisLabel
        Keys.onSpacePressed: {increment()}//按下空格就会调用函数
        Keys.onEscapePressed: {thatLabel.text=""}//按退出键 给text重新赋值
        function increment(){
            spacePresses=spacePresses+1
        }

    }


}
