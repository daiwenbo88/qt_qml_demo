import QtQuick
import QtQuick.Window
import QtWebSockets
Rectangle {
    width: 640
    height: 480
    color: "#333"
    ChatView{
        id:box
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: input.top

    }
    ChatInput{
        id:input
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        focus: true
        onAccepted: function(message){
            print('send message: ' + text)
            socket.sendTextMessage(text)
            box.append('>',text)
            text=''
        }
    }
    WebSocket{
        id:socket
        url:"ws://localhost:3000"
        active: true
        onTextMessageReceived:function(message) {//收到消息
            print('received message: ' + message)
            box.append('<',message)

        }
        onStatusChanged: {
            if(socket.status==WebSocket.Error){
                box.append("#",'socket error'+socket.errorString)
            } else if(socket.status==WebSocket.Open){
                box.append("#",'socket open')
            }else if(socket.status===WebSocket.Close){
                box.append("#",'socket closed')
            }
        }
    }

}
