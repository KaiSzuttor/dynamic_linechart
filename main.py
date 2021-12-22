import sys
import random

from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine, qmlRegisterType
from PySide6.QtCore import QTimer, QObject, Signal, Slot


class DataGenerator(QObject):
    newData = Signal(float, arguments=['y'])

    def __init__(self):
        super().__init__()
        # Define timer.
        self.timer = QTimer()
        self.timer.setInterval(100)
        self.timer.timeout.connect(self.get_data)
        self.timer.start()

    def get_data(self):
        self.newData.emit(random.random()*100)


if __name__ == "__main__":
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()

    qmlRegisterType(DataGenerator, 'Generators', 1, 0, 'DataGenerator')

    engine.quit.connect(app.quit)
    engine.load('main.qml')
    sys.exit(app.exec())
