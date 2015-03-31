import QtQuick 2.0
import Ubuntu.Components 0.1
import "components"
import "components/pages"
import U1db 1.0 as U1db
import Ubuntu.Components.ListItems 0.1 as ListItem


/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "com.ubuntu.developer..iControl"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true
    useDeprecatedToolbar: false

    width: units.gu(40)
    height: units.gu(70)

    PageStack{
        id:stack
        Component.onCompleted: push(tabs)
        Tabs {
            id: tabs
            Tab { title: page.title; page: AddIten { id: addIten } }
            Tab { title: page.title; page: ListPage { id: listPage } }
            Tab { title: page.title; page: About { id: about } }

        }
    }

}
