import Felgo 3.0
import QtQuick 2.0


App {
    //view
    Navigation {
        id: navigation
        navigationMode: navigationModeTabs

        NavigationItem {
            id: homePageItem
            title: qsTr("Home")
            icon: IconType.home

            NavigationStack {
                initialPage: homePage
            }
        }
    }

    HomePage {
        id: homePage
    }

    Component {
        id: vievImageComponent
        ViewImagePage{}
    }

    DataModel {
      id: pictureModel
    }

    SelectPictureFolder {
        id: selectPictureFolder
    }

    Logic {
        id: logic
    }
}
