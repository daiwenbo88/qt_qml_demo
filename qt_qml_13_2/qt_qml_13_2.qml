import QtQuick
import QtQuick.Window

Rectangle {
    width: 320
    height: 480
    visible: true
    ListView {
        id: view
        anchors.fill: parent
        delegate: Thumbnail {
            width: view.width
            text: modelData.title
            iconSource: modelData.media.m
        }
    }


    function request(){
        var request =new XMLHttpRequest()
        request.onreadystatechange=function(){
            if(request.readyState===XMLHttpRequest.HEADERS_RECEIVED){
                print('HEADERS_RECEIVED')
            }else if(request.readyState===XMLHttpRequest.DONE){
                print('DONE')
                let response = {
                                 status : request.status,
                                 headers : request.getAllResponseHeaders(),
                                 contentType : request.responseType,
                                 content : request.response
                             };
                var json = JSON.parse(response.content.toString())
                print(json.toString())
                view.model=json.items
            }
        }
        request.open("GET","http://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=munich")
        request.send()
    }
    MouseArea{
        anchors.fill: parent
        onClicked: request()
    }
    Component.onCompleted: {
        request()
    }
}
