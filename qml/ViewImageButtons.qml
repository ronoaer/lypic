import QtQuick 2.0
import Felgo 3.0
import QtGraphicalEffects 1.0

Item {
    LinearGradient {
        anchors.fill: parent

        start: Qt.point(root.width * 0.5, 0)
        end: Qt.point(root.width * 0.5, root.height)
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#404040"  }
            GradientStop { position: 1; color: "#121212" }
        }
    }

    IconButton {
        id: previosButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        icon: IconType.angleleft

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
        icon: IconType.angleright

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

    IconButton {
        id: homeButton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        icon: IconType.home
    }

    IconButton {
        id: zoomInButton
        anchors.right: zoomOutButton.left
        anchors.bottom: parent.bottom
        icon: IconType.angleleft
    }

    IconButton {
        id: zoomOutButton
        anchors.right: homeButton.left
        anchors.bottom: parent.bottom
        icon: IconType.angleright
    }

    IconButton {
        id: rotutionLeftButton
        anchors.left: homeButton.right
        anchors.bottom: parent.bottom
        icon: IconType.rotateleft
    }

    IconButton {
        id: rotutionRrightButton
        anchors.left: rotutionLeftButton.right
        anchors.bottom: parent.bottom
        icon: IconType.rotateright
    }
}
