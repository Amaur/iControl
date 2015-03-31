import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem
import U1db 1.0 as U1db
import "../../js/Jstesta.js" as Testa


Page{
    id:listpage
    title: i18n.tr("List page")
    U1db.Database { id: db; path: "simpleu1dbdemo2.u1db" }
    U1db.Index {
            database: db
            id: by_type
            /* You have to specify in the index all fields you want to retrieve
               The query should return the whole document, not just indexed fields
               https://bugs.launchpad.net/u1db-qt/+bug/1271973 */
            expression: ["things.type", "things.placename"]
        }
        U1db.Query {
            id: places
            index: by_type
            query: ["*", "*"]
        }


    ListView {
        anchors.top:parent.top
        anchors.bottom: parent.bottom
        width: parent.width
        model: places
        clip: true
        delegate: ListItem.Standard {
            text: model.contents.placename+'('+model.contents.type+')'
            control: Button {
                text: "x"
                width: units.gu(4)
                onClicked: {
                    /* To delete a document, you currently have to set its
                       contents to empty string. There will be db.delete_doc
                       eventually.
                       https://bugs.launchpad.net/u1db-qt/+bug/1243395 */
                    db.putDoc("", model.docId);
                }
            }
        }
    }


}
