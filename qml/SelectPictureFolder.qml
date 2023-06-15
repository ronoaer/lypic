import QtQuick 2.0
import Felgo 3.0

import Qt.labs.folderlistmodel 2.15
import Qt.labs.platform 1.0
import QtQuick.Dialogs 1.0          // FileDialog

Item {
    id: root

    FolderListModel
    {
        id: folderModel
        showDirs: true
        showFiles: true
        folder: ""
        nameFilters: ["*.jpg", "*.png"]
        sortField: FolderListModel.Name
    }

    Repeater {
        model: folderModel

        Component {
            Item {
                Component.onCompleted: {
                    // update model
                    if (!model.fileIsDir) {
                        var newItem = {
                                   "name": model.fileName,
                                   "image": model.filePath
                                 }

                        pictureModel.append(newItem)
                    }
                }
            }
        }
    }

    FolderDialog
    {
        id:             folderDialog
        title:          "Select the photo directory:"
        folder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]

        onAccepted: {
            if (folderModel.folder === folderDialog.currentFolder) {
                return
            }

            // reset info
            pictureModel.clear()
            folderModel.folder = folderDialog.currentFolder
            logic.folderChanged(folderDialog.folder)
        }
    }

    function open() {
        folderDialog.open()
    }
}
