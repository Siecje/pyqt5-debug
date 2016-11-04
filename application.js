"use strict";

function UsersManager() {
    return Qt.createQmlObject("import UsersManager 1.0; UsersManager {}",
                              appWindow, "UsersManager");
}

var usersManager = new UsersManager();

function loadUsers(){
    usersManager.LoadUsers();
}
