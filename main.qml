import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
//import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Styles 1.4


ApplicationWindow {
    id: appWindow
    visible: true
    width: 320
    height: 480
    title: "Накорми братишку!"
    background: Rectangle {
        gradient: Gradient {
            GradientStop { position: 0 ; color: "#000000" }
        }

    }

    property int speed: 10;

    Component.onCompleted: stackView.push("qrc:/mainpage.qml");


    StackView {
        id: stackView
        anchors.fill: parent;

    }



}
