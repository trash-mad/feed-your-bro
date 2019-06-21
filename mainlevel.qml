import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Item{
anchors.fill: parent

Rectangle {
id: rectangle1
anchors.fill: parent;

gradient: Gradient { GradientStop { position: 0 ; color: "#ffffff" }
}

Label {
    id: label1
    height: 23
    text: "Выберите сложность:"
    font.pointSize: 15
    anchors.right: parent.right
    anchors.rightMargin: 0
    anchors.left: parent.left
    anchors.leftMargin: 0
    anchors.top: parent.top
    anchors.topMargin: 0
}


TextArea{
anchors.centerIn: parent
width: parent.width
readOnly: true
wrapMode: TextEdit.WordWrap
text: "Выберите уровень сложности. От уровня сложности зависет скорость епифана, который захочет дать вам по дыхалке"
}



Frame {
    id: frame1
    y: 183
    height: 67
    anchors.right: parent.right
    anchors.rightMargin: 0
    anchors.left: parent.left
    anchors.leftMargin: 0
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0

    Button{
    anchors.left: parent.left
    height: parent.height
    anchors.leftMargin: 5
    text: "Назад"
    onClicked: stackView.pop();
    }

    Button{
    anchors.right: parent.right
    height: parent.height
    anchors.rightMargin: 5
    text: "Далее"
    onClicked: {
        appWindow.speed=Math.abs(100-slider.value*100+10)/2;
        stackView.push("qrc:/game.qml");
    }
    }
}

RowLayout {
    id: columnLayout1
    y: 218
    height: 54
    anchors.right: parent.right
    anchors.rightMargin: 0
    anchors.left: parent.left
    anchors.leftMargin: 0
    anchors.bottom: frame1.top
    anchors.bottomMargin: 1
    Text {
    text: "Просто"
    anchors.leftMargin: 5
    }
    Slider {
        id: slider
        width: parent.width/2
        Layout.maximumHeight: 300
        Layout.maximumWidth: 300
        Layout.fillHeight: true
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        value: 1/2;
    }
    Text {
        text: "Сложно"
        anchors.rightMargin: 5
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
    }
}



}


}
