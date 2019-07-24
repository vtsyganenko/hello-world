import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

import CalculatorActionWrapper 1.0
import Calculator 1.0

Window {
    visible: true
    width: 550
    height: 140
    title: caption

    property int textWidth: 100
    property int textHeight: 25
    property int rowTopMargin: 40

    Calc {
        id: calcElement
        onResultChanged: {
            currentResult.text = result
        }
    }

    Row {
        anchors.fill: parent
        spacing: 5
        anchors.leftMargin: 20
        anchors.topMargin: 20

        Rectangle {
            width: textWidth; height: textHeight
            border.width: 2
            anchors.top: parent.top
            anchors.topMargin: rowTopMargin
            TextInput {
                id: value1
                anchors.fill: parent
                font.pointSize: 14
            }
        }
        Rectangle {
            width: textWidth/4; height: textHeight*4
            border.width: 2

            Tumbler {
                id: action
                anchors.fill: parent
                model: ['+', '-', '*', '/']
                visibleItemCount: 3

                delegate: delegateComponent
            }
        }
        Rectangle {
            width: textWidth; height: textHeight
            border.width: 2
            anchors.top: parent.top
            anchors.topMargin: rowTopMargin
            TextInput {
                id: value2
                anchors.fill: parent
                font.pointSize: 14
            }
        }
        Button {
            id: calcButton
            width: textWidth; height: textHeight
            anchors.top: parent.top
            anchors.topMargin: rowTopMargin
            text: '='

            onClicked: {
                calcElement.setValue1(value1.text);
                calcElement.setValue2(value2.text);

                switch(action.model[action.currentIndex]) {
                case "+":
                    resultValue.text = calcElement.calculate(CalcAction.ACTION_ADDITION);
                    break;
                case "-":
                    resultValue.text = calcElement.calculate(CalcAction.ACTION_SUBTRACTION);
                    break;
                case "*":
                    resultValue.text = calcElement.calculate(CalcAction.ACTION_MULTIPLICATION);
                    break;
                case "/":
                    resultValue.text = calcElement.calculate(CalcAction.ACTION_DIVISION);
                    break;
                }
            }
        }
        Rectangle {
            width: textWidth; height: textHeight
            border.width: 2
            anchors.top: parent.top
            anchors.topMargin: rowTopMargin
            TextInput {
                id: resultValue
                anchors.fill: parent
                font.pointSize: 14
            }
        }
    }

    FontMetrics {
        id: fontMetrics
    }

    Component {
        id: delegateComponent
        Label {
            text: modelData
            color: action.model[action.currentIndex] === modelData ? "red" : "black"

            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: fontMetrics.font.pixelSize * 3
        }
    }

    Text {
        id: currentResult
        // instead
        //x: parent.width - 20; y: parent.height - 20
        // use this
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
    }
}
