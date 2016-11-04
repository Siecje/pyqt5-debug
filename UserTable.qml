import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.3

import "userTable.js" as App

ColumnLayout {
    // Usage:
    // Need to specify
    // model
    // function selectUser()

    property alias model: userTableView.model;
    property alias selection: userTableView.selection;

    Component.onCompleted: {
        userTableView.selectionChanged.connect(selectUser);
        userTableView.clicked.connect(selectUser);
        App.onLoad();
    }
    TableView {
        id: userTableView
        objectName: "userTableView"
        Layout.fillWidth: true
        Layout.fillHeight: true

        TableViewColumn {
            role: "login"
            title: qsTr("Login")
        }
        TableViewColumn {
            role: "full_name"
            title: qsTr("Full Name")
        }
        TableViewColumn {
            role: "email"
            title: qsTr("Email")
        }
    }
}
