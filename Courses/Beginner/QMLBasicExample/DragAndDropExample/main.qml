import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property string theykey: "special key here"
    property color goalOn: "green"
    property color goalOff: "red"
    property color ballOn: "yellow"
    property color ballOff: "orange"

    DropArea{
        id: dropZone
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: 300
        Drag.keys: [theykey]

        onDropped: {
            console.log("Dropped!")
            goal.color = goalOn
        }

        Rectangle{
            id: goal
            anchors.fill: parent
            color: goalOff
            border.color: "black"
            border.width: 5
        }

        Rectangle{
            id: ball
            width: 100
            height: 100
            radius: width
            x: 25
            y: (parent.height / 2) - (height / 2)

            color: ballOff
            border.color: "black"
            border.width: 5

            Drag.active: dragArea.drag.active
            Drag.keys: [theykey]

            Text {
                id: title
                anchors.centerIn: parent
                text: Math.round(parent.x) + " x " + Math.round(parent.y)
            }

            MouseArea{
                id: dragArea
                anchors.fill: parent
                drag.target: parent
                onPressed: {
                    parent.color = ballOn
                    goal.color = goalOff
                }
                onReleased: {
                    parent.color = ballOff
                    parent.Drag.drop()
                }
            }
        }
    }

}
