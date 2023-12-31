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


    RoundedImage {
        id: imageContainer

        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height - buttons.height
        width: parent.width

        fillMode: Image.PreserveAspectFit

        source: pictureModel.getCover(modelEntry)
    }

    ViewImageButtons {
        id: buttons
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        height: dp(50)
        width: parent.width
    }

    Component.onCompleted: {
        buttons.rotationLeftImage.connect(onRotationLeftImage)
        buttons.rotationRightImage.connect(onRotationRightImage)
        buttons.zoomInImage.connect(onZoomInImage)
        buttons.zoomOutImage.connect(onZoomOutImage)
    }

    function onRotationLeftImage() {
        imageContainer.rotation -= 5
    }

    function onRotationRightImage() {
        imageContainer.rotation += 5
    }

    function onZoomInImage() {
        imageContainer.scale -= 0.1
    }

    function onZoomOutImage() {
        imageContainer.scale += 0.1
    }
}

