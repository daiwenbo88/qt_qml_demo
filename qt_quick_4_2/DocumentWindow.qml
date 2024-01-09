import QtQuick
import QtQuick.Controls
import Qt.labs.platform as NativeDialogs
ApplicationWindow {
    id:root
    width: 640
    height: 480
    menuBar: MenuBar{

        Menu{
            title:"&File"
            MenuItem{
                text:"&New"
                icon.source: "images/new.png"
                onTriggered: root.newDocument()
            }
            MenuItem{
                text:"&Open"
                icon.source: "images/open.png"
                onTriggered: root.opneDocument()
            }
            MenuItem{
                text:"&Save"
                icon.source: "images/save.png"
                onTriggered: root.saveDocument()
            }
            MenuItem{
                text:"Save &As"
                icon.source: "images/saveas.png"
                onTriggered: root.saveAsDocument()
            }

        }
    }
    function createNewDocument(){
        var component= Qt.createComponent("DocumentWindow.qml")
        var window=component.createObject(/*root*/);//设置parent
        return window
    }
    function newDocument(){
        var window =createNewDocument();
        window.show();

    }
    function opneDocument(){
        openDialog.open();

    }
    property string fileName
    property bool idDirty:true
    property bool tryingToClose:false

    NativeDialogs.FileDialog{
        id:openDialog
        title: "Open"
        onAccepted: {
            var window =root.createNewDocument();
            window.fileName=openDialog.file
            window.show()

        }
    }
    function saveAsDocument(){
        saveAsDialog.open()

    }
    function saveDocument(){
        if(fileName.length==0){
            root.saveAsDocument();
        }else{
            root.isDirty=false
            if(root.tryingToClose){
                root.close();
            }
        }
    }
    NativeDialogs.FileDialog{
        id:saveAsDialog
        title: "Save As"
        onAccepted: {
            root.fileName=saveAsDialog.file
            saveDocument();
        }
        onRejected: {
            root.tryingToClose=false

        }
    }
    onClosing: {
        if(root.isDirty){
            closeWarningDialog.open()
            close.accepted=false
            console.log("onClosing")

        }
    }
    NativeDialogs.MessageDialog{
        id:closeWarningDialog
        title:"Closeing document"
        text: "有更新没有保存，是否需要保存"
        buttons: NativeDialogs.MessageDialog.Yes|
                 NativeDialogs.MessageDialog.No|
                NativeDialogs.MessageDialog.Cancel
        onYesClicked: {
                root.tryingToClose=true
                root.saveDocument()
        }
        onNoClicked: {
            root.isDirty=false;
            root.close()
        }
    }

    title: (fileName.length==0?"Document":fileName)+(idDirty?"*":"")
}
