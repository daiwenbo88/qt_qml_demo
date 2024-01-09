import QtQuick
import QtQuick.Controls

Page {
    title:"Home"
    SwipeView{
        id:swipeView
        anchors.fill: parent

        ViewPage{}
        ViewPage{}
        ViewPage{}
    }
    PageIndicator{
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        currentIndex: swipeView.currentIndex
        count: swipeView.count

    }
}
