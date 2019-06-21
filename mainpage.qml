import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
//import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
Item{
anchors.fill: parent;


ToolBar {
    id: toolBar
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: parent.top
    height: 50;

    background: Rectangle {
        gradient: Gradient {
            GradientStop { position: 0 ; color: "#009933" }
        }
    }

    Label {
        anchors.fill: parent;
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        text: "Накорми братишку!"
        color: "#FFFFFF"
    }
}

Image{
id: image
anchors.centerIn: parent;
width: Math.min(parent.width,parent.height)
height: width/2

source: "qrc:/"+(Math.floor(Math.random() * (4) + 1))+".jpg"
Desaturate{
id: ani
anchors.fill: parent
source: parent
desaturation: 1
}

PropertyAnimation {id: animaker; target: ani; properties: "desaturation"; to: "0"; duration: 1000}
Component.onCompleted: animaker.start()
}

Button {
id: gobutton
y: 326
text: "Играть!"
anchors.right: parent.right
anchors.rightMargin: 10
anchors.left: parent.left
anchors.leftMargin: 10
anchors.bottom: parent.bottom
anchors.bottomMargin: 10
onClicked: stackView.push("qrc:/mainlevel.qml");
}

TextArea {
id: textArea1
readOnly: true
color: "#FFFFFF"
wrapMode: TextEdit.WordWrap
text: "Испытайте себя в роли пахома из легендарного фильма ЗЕЛЕНЫЙ СЛОНИК. Вам предстоит накормить братишку, собирать бонусы и погону, а так же не получить по дыхалке!"
anchors.right: parent.right
anchors.rightMargin: 10
anchors.left: parent.left
anchors.leftMargin: 10
anchors.bottom: gobutton.top
anchors.bottomMargin: 10
}


}
