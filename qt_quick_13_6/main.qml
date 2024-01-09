import QtQuick
import QtQuick.LocalStorage
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Rectangle{
        id:crazy
        width: 100
        height: width
        x:50
        y:50
        color: 'green'
        Text {
            anchors.centerIn: parent
            text: Math.round(parent.x)+"/"+Math.round(parent.y)
        }
        MouseArea{
            anchors.fill: parent
            drag.target: parent//拖拽

        }

    }
    property var db

    function initDB(){
        console.log('initDB');
        //数据库名 版本 描述 大小
        db=LocalStorage.openDatabaseSync("Crazybox",'1.0','Position Box',10000)
        db.transaction(function(tx){
            console.log('create table');
            tx.executeSql('CREATE TABLE IF NOT EXISTS data(name TEXT,value TEXT)')

        })
    }

    function readDB(){
        console.log('readDB');
        if(!db)return
        db.transaction(function(tx){
            console.log('read table');
            var result= tx.executeSql('select * from data where name="crazy"')
            if(result.rows.lwngth===1){
               console.log('update crazybox position');
               var value=result.rows[0].value
                var obj=JSON.parse(value)
                cracy.x=obj.x
                cracy.y=obj.y
            }
        })
    }

    function storeDB(){
        console.log('storeDB');
        if(!db)return

        db.transaction(function(tx){
            console.log('read table');
            var result= tx.executeSql('select * from data where name="crazy"')
            if(result.rows.lwngth===1){
               console.log('crazy onfo exists,update it');
                var obj ={x:cracy.x,y:cracy.y}
                tx.executeSql('UPDATE data set value=? where name="crazy"',[JSON.stringify(ojb)])
            }else{
                 console.log('crazy onfo exists');
                tx.executeSql('INSERT INTO data VALUES(?,?)',['crazy',JSON.stringify(ojb)])
            }
        })
    }

    Component.onCompleted: {
        initDB()
        readDB()
    }

    Component.onDestruction: storeDB()
}
