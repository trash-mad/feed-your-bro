import QtQuick 2.4
import QtQuick.Window 2.2

Rectangle {
id: player

width: 20 * Screen.logicalPixelDensity
height: width

radius: width / 2
color: "transparent"


property double speed: 2 * Screen.logicalPixelDensity

function centerX(){ return x+width/2; }
function centerY(){ return y+height/2;}
}
