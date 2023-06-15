import Felgo 3.0
import QtQuick 2.0


JsonListModel {
    id: root

    property var dataSource
    fields: [
        "name",
        "image"
    ]

    source: dataSource

    function getCover(entry) {
        if (entry === undefined) {
            return ""
        }

        return entry.image
    }
}
