import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Window {
    x: 100; y: 100
    visible: true
    title: qsTr("Example of exchange between threads")

    property int margin: 8
    width: mainLayout.implicitWidth + 2 * margin
    height: mainLayout.implicitHeight + 2 * margin
    minimumWidth: mainLayout.Layout.minimumWidth + 2 * margin
    minimumHeight: mainLayout.Layout.minimumHeight + 2 * margin

    signal sendMessage(string s);

    ListModel
    {
        id: listModel

        ListElement {
            text: "hello"
        }
        ListElement {
            text: "world"
        }
    }

    function addValue(value)
    {
        listModel.append( { text: value } )
        scroll.position = 1.0
    }

    ColumnLayout
    {
        id: mainLayout
        anchors.fill: parent
        anchors.margins: margin
        spacing: margin

        Rectangle {
            border.width: 2
            border.color: 'blue'

            Layout.fillWidth: true
            //Layout.fillHeight: true

            implicitWidth: 500
            implicitHeight: 400


            ListView {
                anchors.fill: parent
                clip: true
                spacing: 5
                //Layout.fillWidth: true
                //Layout.fillHeight: true

                //flickableDirection: Flickable.AutoFlickDirection

                model: listModel
                delegate: Text {
                    text: "model text: " + model.text
                }

                ScrollBar.vertical: ScrollBar { id: scroll; /*active: true;*/ policy: ScrollBar.AlwaysOn }
            }


            //Layout.preferredWidth: 400
            //Layout.preferredHeight: 400
        }

//        Rectangle {
//            color: 'green'

//            Layout.fillWidth: true
//            Layout.fillHeight: true
//        }

        Rectangle {

            border.color: 'red'
            border.width: 2

            //Layout.preferredWidth: 100
            //Layout.preferredHeight: 25

            //implicitWidth: 400
            implicitHeight: 50

            Layout.fillWidth: true
            //Layout.fillHeight: true


            RowLayout {
                id: rowLayout
                anchors.fill: parent
                anchors.margins: 6

                Layout.fillHeight: true

                TextField {
                    id: textField
                    placeholderText: "insert here"
                    //Layout.fillHeight: true
                    Layout.fillWidth: true

                    onPressed: textField.text = ""
                }
                Button {
                    text: "Send"
                    onClicked: sendMessage(textField.text)
                }
                Button {
                    text: "Add"
                    onClicked: {
                        addValue( textField.text )
                    }
                }
                Button {
                    id: stopButton
                    objectName: "stopButton"
                    text: "Stop"
                }
            }
        }
    }
}
