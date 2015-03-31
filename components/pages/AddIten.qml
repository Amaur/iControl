import QtQuick 2.0
import Ubuntu.Components 0.1
import U1db 1.0 as U1db
import "../../js/Jstesta.js" as Testa


Page{
    id:addIten
    title: i18n.tr("Add Iten")


    U1db.Database { id: db; path: "simpleu1dbdemo2.u1db" }
    U1db.Index {
        database: db
        id: by_type
        /* You have to specify in the index all fields you want to retrieve
           The query should return the whole document, not just indexed fields
           https://bugs.launchpad.net/u1db-qt/+bug/1271973 */
        expression: ["things.type", "things.placename"]
    }


    Column {
        id: col
        width: parent.width
        spacing: units.gu(1)
        Label {
            width: parent.width
            text: "Enter a place to add to list"
            horizontalAlignment: Text.AlignHCenter
        }
        Rectangle {
            id: ta
            width: parent.width - units.gu(2)
            color: "white"
            height: inp.height * 2
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 5
            TextInput {
                id: inp
                width: parent.width - units.gu(2)
                anchors.centerIn: parent
                onAccepted: inp.Testa.adddoc(db,inp.text)


                Component.onCompleted: Testa.adddoc(db,inp.text)
            }
        }
        Button {
            text: "Add"
            width: ta.width
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: Testa.adddoc(db,inp.text)
        }
    }
}


