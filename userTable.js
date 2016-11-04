"use strict";

function UserTableManager() {
    return Qt.createQmlObject("import UserTableManager 1.0; UserTableManager {}",
                              appWindow, "UserTableManager");
}

var userTableManager = new UserTableManager();

function onLoad(){
    userTableManager.users.connect(function(UserList){
        userTableView.model.clear();
        for(var i = 0;i<UserList.length;i++){
            userTableView.model.add(UserList[i]);
        }
    });
}
