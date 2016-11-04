import sys
import threading

from PyQt5 import QtCore, QtGui, QtQml

def FetchUsers():
    return [
        {"login": "One",
         "full_name": "One",
         "email": "one@example.com",
         },
         {"login": "Two",
          "full_name": "Two",
          "email": "two@example.com",
          },
          {"login": "Three",
           "full_name": "Three",
           "email": "three@example.com",
           }
    ]

class UsersManager(QtCore.QObject):

    @QtCore.pyqtSlot()
    def LoadUsers(self):
        def thread():
            users = FetchUsers()
            UserTableManager.users.emit(users)

        threading.Thread(target=thread).start()


class UserTableManager(QtCore.QObject):
    users = QtCore.pyqtSignal(QtCore.QVariant)
    export = QtCore.pyqtSignal(QtCore.QVariant)
    userData = []

    #def __init__(self):
        ##super().__init__(self)
        #Qtcore.QObject.__init__(self)

app = QtGui.QGuiApplication(sys.argv)
QtQml.qmlRegisterType(UsersManager, 'UsersManager', 1, 0, 'UsersManager')
QtQml.qmlRegisterType(UserTableManager, 'UserTableManager', 1, 0, 'UserTableManager')
engine = QtQml.QQmlApplicationEngine("Main.qml")
app.exec_()
