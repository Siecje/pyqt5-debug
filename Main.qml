import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

import "application.js" as App

ApplicationWindow {
  id: appWindow
  objectName: "appWindow"
  width: 800;
  height: 600;
  minimumWidth: 300;
  minimumHeight: 100;
  visible: true;

  ListModel {
      id: userModel
      objectName: "userModel"
      function add(user) {
          userModel.append(user);
      }
  }

  ColumnLayout{
    anchors.fill: parent
    GroupBox {
      Layout.fillWidth: true
      RowLayout {
          anchors.fill: parent

          Button {
              id: btnPass
              objectName: "btnPass"
              text: qsTr("Get Users")
              enabled: true
              onClicked: {
                App.loadUsers();
              }
          }
      }
    }
    UserTable {
      id: userTable
      objectName: "userTable"

      model: userModel

      function selectUser(){
        // Only one will be selected
        userTable.selection.forEach(function(rowIndex){
            var user = userModel.get(rowIndex);
            console.log(user);
        });
      }
    }
  }
  //Component.onCompleted: {
      //console.log('here')
  //}
}
