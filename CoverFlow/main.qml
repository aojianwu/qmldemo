import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 900
    height: 600
    title: qsTr("Cover Flow")

    ListModel {
        id: model
        ListElement { url: "./Cover/jay.jpg" }
        ListElement { url: "./Cover/timg.jpg" }
        ListElement { url: "./Cover/timg2.jpg" }
        ListElement { url: "./Cover/timg3.jpg" }
        ListElement { url: "./Cover/timg4.jpg" }
    }

    CoverFlow {
        anchors.fill: parent
        model: model
    }

}
