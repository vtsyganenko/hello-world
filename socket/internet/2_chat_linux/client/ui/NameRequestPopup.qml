import QtQuick 2.0
import QtQuick.Controls 2.5

Popup {
    x: 100
    y: 100
    width: 300
    height: 145
    modal: true
    focus: true
    //closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    signal nameRequestResult(bool accepted, string name)

    property int margin: 10
    margins: margin

    Column {
        spacing: margin

        anchors.fill: parent
        //anchors.left: parent.left
        //anchors.right: parent.right


        Label {
            text: "Insert your name"

            anchors.left: parent.left
            anchors.right: parent.right
        }

        TextField {
            id: field
            width: parent.width
            focus: true

        }

        Row {
            spacing: margin*3

            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                text: "accept"
                onClicked: nameRequestResult(true, field.text)
            }
            Button {
                text: "exit"
                onClicked: nameRequestResult(false, field.text)
            }
        }
    }
/*
    Rectangle {

        border.color: 'red'

        anchors.fill: parent

        /*
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        */
//    }



}

