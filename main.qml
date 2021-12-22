import QtQuick 2.3
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 800; height: 600
    visible: true


    Button {
        text: qsTr("Click me")

        onClicked: {
            var component = Qt.createComponent("child.qml")
            if (component.status === Component.Ready)
                var window = component.createObject(root);
                if (window === null){
                    console.log("Error creating image");
                }
        }
    }
}
