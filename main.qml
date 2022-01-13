import QtQuick 2.3
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 800; height: 600
    visible: true


    GridLayout {
        id: gridLayout
        rows: 3
        columns: 2
        flow: GridLayout.TopToBottom
        anchors.fill: parent
    }
        Button {
            text: qsTr("Create liveplot")

            onClicked: {
                var component = Qt.createComponent("child.qml")
                if (component.status === Component.Ready)
                    var window = component.createObject(gridLayout);
                    if (window === null){
                        console.log("Error creating image");
                    }
            }
    }
}
