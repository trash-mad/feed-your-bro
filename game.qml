import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

Image {
id: gamelayer
anchors.fill: parent
source: "qrc:/images/arena.gif"
function startgame(targetspeed){
timer.start();
epifuntimer.interval=targetspeed;
epifuntimer.start();
}

Component.onCompleted: startgame(appWindow.speed);

Rectangle {
id: joystickExample
anchors.fill: parent
color: "transparent"




Player {
id: player
x: 50 * Screen.logicalPixelDensity
y: 10 * Screen.logicalPixelDensity
Image {
anchors.fill: parent
source: "qrc:/images/pahom.png"
rotation: 180
}
}

Player{
id: epifan
x: 300
y: 300
rotation: 0
Image {
anchors.fill: parent
source: "qrc:/images/epifan.png"
rotation: 180
}
}


Item{
anchors.bottom: parent.bottom
anchors.left: parent.left
anchors.right: parent.right
height: 50 * Screen.logicalPixelDensity
Joystick {
id: joystick
anchors.centerIn: parent
opacity: 0.9
}
}
Timer{
id: epifuntimer
interval: 50
repeat: true
onTriggered:{
var x2x1,y2y1,q,z;
x2x1=epifan.centerX()-player.centerX();
y2y1=epifan.centerY()-player.centerY();
z=0;
q=1;
if(x2x1>0){
epifan.x--;
q=(y2y1>0)?-1:1;
z=(y2y1>0)?180:0;
}
if(x2x1<0){
epifan.x++;
q=(y2y1>0)?1:-1;
z=(y2y1>0)?180:0;
}
epifan.y+=(y2y1>0)?-1:1;
epifan.rotation=q*(Math.atan(Math.abs(x2x1/y2y1))/Math.PI*180)+z;
}

}


Timer {
id: timer
interval: 25
repeat: true

onTriggered: {
if (joystick.pressed) {
var newX = player.x + joystick.inputX * player.speed
var newY = player.y + joystick.inputY * player.speed

if (newX + player.width > joystickExample.width)
newX = joystickExample.width - player.width
else if (newX < 0)
newX = 0

if (newY + player.height > joystickExample.height)
newY = joystickExample.height - player.height
else if (newY < 0)
newY = 0

player.x = newX
player.y = newY




var x2x1,y2y1,q,z;
x2x1=epifan.centerX()-player.centerX();
y2y1=epifan.centerY()-player.centerY();
z=0;
q=1;
if(x2x1>0){
q=(y2y1>0)?-1:1;
z=(y2y1>0)?180:0;
}
if(x2x1<0){
q=(y2y1>0)?1:-1;
z=(y2y1>0)?180:0;
}
player.rotation=q*(Math.atan(Math.abs(x2x1/y2y1))/Math.PI*180)+z+180;


}
}
}
}

}
