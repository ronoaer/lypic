import Felgo 3.0
import QtQuick 2.0


App {
    NavigationStack {
        HomePage {
            id: homePage
        }
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
