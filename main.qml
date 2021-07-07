import QtQuick 2.12
import QtQuick.Window 2.0
import Qt.labs.qmlmodels 1.0

import Generator.io 1.0

Window {
    id:main_window
    width: 600
    height: 600
    title: qsTr("Qmob Solutions - Diogo Rodrigues Roessler")
    visible: true

    TableView {
        anchors.fill: parent
        columnSpacing: 1
        rowSpacing: 1
        clip: true

        RootPlayerItem {
            id: rootPlayerItem
        }

        model: TableModel {
            TableModelColumn { display: "TypeId"}
            TableModelColumn { display: "Speed" }
            TableModelColumn { display: "Ammo" }
            TableModelColumn { display: "Active" }
            TableModelColumn { display: "CoordinatesId" }

            rows: [
                {
                    "TypeId": "TypeId",
                    "Speed": "Speed",
                    "Ammo": "Ammo",
                    "Active": "Active",
                    "CoordinatesId": "CoordinatesId"
                },
                {
                    "TypeId": rootPlayerItem.setReturnTypeId(4),
                    "Speed": rootPlayerItem.setCoordinateId(4.1),
                    "Ammo": rootPlayerItem.setReturnTypeId(50),
                    "Active": rootPlayerItem.setActivated(true),
                    "CoordinatesId": rootPlayerItem.setCoordinateId(1.0)
                },
                {
                    "TypeId": rootPlayerItem.setReturnTypeId(3),
                    "Speed": rootPlayerItem.setCoordinateId(4.3),
                    "Ammo": rootPlayerItem.setReturnTypeId(10),
                    "Active": rootPlayerItem.setActivated(false),
                    "CoordinatesId": rootPlayerItem.setCoordinateId(3.0)
                },
                {
                    "TypeId": rootPlayerItem.setReturnTypeId(1),
                    "Speed": rootPlayerItem.setCoordinateId(2.3),
                    "Ammo": rootPlayerItem.setReturnTypeId(20),
                    "Active": rootPlayerItem.setActivated(true),
                    "CoordinatesId": rootPlayerItem.setCoordinateId(2.0)
                },
                {
                    "TypeId": rootPlayerItem.setReturnTypeId(2),
                    "Speed": rootPlayerItem.setCoordinateId(1.23),
                    "Ammo": rootPlayerItem.setReturnTypeId(15),
                    "Active": rootPlayerItem.setActivated(false),
                    "CoordinatesId": rootPlayerItem.setCoordinateId(1.1)
                },
                {
                    "TypeId": rootPlayerItem.setReturnTypeId(0),
                    "Speed": rootPlayerItem.setCoordinateId(2.323),
                    "Ammo": rootPlayerItem.setReturnTypeId(60),
                    "Active": rootPlayerItem.setActivated(true),
                    "CoordinatesId": rootPlayerItem.setCoordinateId(4.0)
                }
            ]
        }

        delegate: Rectangle {
            implicitWidth: 100
            implicitHeight: 30
            border.width: 0.5

            Text {
                text: display
                anchors.centerIn: parent
            }
        }
    }
}
