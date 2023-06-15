import Felgo 3.0
import QtQuick 2.8
import QtGraphicalEffects 1.0

Page {
    id: root
    title: "Select a photo directory"

    LinearGradient {
        anchors.fill: parent

        start: Qt.point(root.width * 0.5, 0)
        end: Qt.point(root.width * 0.5, root.height)
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#404040"  }
            GradientStop { position: 1; color: "#121212" }
        }
    }

    leftBarItem: IconButtonBarItem {
        icon: IconType.folder
        enabled: opacity > 0
        onClicked: {
            selectPictureFolder.open()
        }
    }

    Page {
        title: "GridView"
        anchors.horizontalCenter: parent.horizontalCenter

        // A gridview takes a linear model and displays it as a grid
        ImagePicker {
            id: imagePicker
            anchors.fill: parent
            bottomMargin: nativeUtils.safeAreaInsets.bottom

            model: pictureModel

            // We force the cellWidth to be exactly one fourth of total width (so that 4 columns are displayed)
            cellWidth: imagePicker.width / 4

            // We force the cell to be squared
            cellHeight: cellWidth

            delegate: Item {
                id: delegateImage
                // We force the delegate to have the exact size of the cell
                width: imagePicker.cellWidth
                height: imagePicker.cellHeight

                AppPaper {
                    anchors {
                        margins: dp(10)
                        fill: parent
                    }
                }


                AppImage {
                    anchors {
                        fill: parent
                        margins: dp(Theme.contentPadding)
                    }
                    fillMode: Image.PreserveAspectFit

                    source: pictureModel.getCover(model)
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.navigationStack.push(vievImageComponent, {"modelEntry": model})
                    }
                }
            }
        }

        Component.onCompleted: {
            logic.folderChanged.connect(onFolderChanged)
        }

        function onFolderChanged(folder) {
            root.title = folder
        }
    }
}
