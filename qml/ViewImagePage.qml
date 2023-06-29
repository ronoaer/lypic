import QtQuick 2.0
import Felgo 3.0
import QtGraphicalEffects 1.0

Page {
    id: root

    property var modelEntry: undefined

    title: modelEntry.name

    LinearGradient {
        anchors.fill: parent

        start: Qt.point(root.width * 0.5, 0)
        end: Qt.point(root.width * 0.5, root.height)
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#404040"  }
            GradientStop { position: 1; color: "#121212" }
        }
    }


    AppImage {
        id: imageContainer

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop

        source: pictureModel.getCover(modelEntry)
    }

    IconButton {
        id: previosButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        icon: IconType.arrowcircleleft

        visible: pictureModel.count > 1

        onClicked: {
            // previes picture, should be moved to class model
            var curIndex = pictureModel.indexOf("name", modelEntry.name)

            if (curIndex > 0) {
                curIndex = curIndex - 1
            }

            modelEntry = pictureModel.get(curIndex)
        }
    }

    IconButton {
        id: nextButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        icon: IconType.arrowcircleright

        visible: pictureModel.count > 1

        onClicked: {
            // next picture, should be moved to class model
            var curIndex = pictureModel.indexOf("name", modelEntry.name)

            if (curIndex < pictureModel.count - 1) {
                curIndex = curIndex + 1
            }

            modelEntry = pictureModel.get(curIndex)
        }
    }
}
