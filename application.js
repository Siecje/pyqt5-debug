"use strict";

function UsersManager() {
    return Qt.createQmlObject("import UsersManager 1.0; UsersManager {}",
                              appWindow, "UsersManager");
}

function loadUsers(){
    var usersManager = new UsersManager();
    usersManager.LoadUsers();
}
