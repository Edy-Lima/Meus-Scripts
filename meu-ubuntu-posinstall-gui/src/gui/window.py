from PyQt5.QtWidgets import QApplication, QMainWindow, QPushButton, QVBoxLayout, QWidget, QMessageBox
import subprocess
import sys

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Meu Ubuntu Posinstall")
        self.setGeometry(100, 100, 300, 400)

        layout = QVBoxLayout()

        options = [
            ("Remover Swap-file", "1"),
            ("Remover Snap e Instalar Flatpak", "2"),
            ("Configurar meu Desktop", "3"),
            ("Atualizar meu Sistema", "4"),
            ("Limpeza do meu Sistema", "5"),
            ("Sair", "0")
        ]

        for option in options:
            button = QPushButton(option[0])
            button.clicked.connect(lambda checked, option=option[1]: self.run_option(option))
            layout.addWidget(button)

        container = QWidget()
        container.setLayout(layout)
        self.setCentralWidget(container)

    def run_option(self, option):
        try:
            result = subprocess.run(["bash", "src/scripts/Meu_Ubuntu_posinstall.sh", option], capture_output=True, text=True)
            QMessageBox.information(self, "Resultado", result.stdout)
        except Exception as e:
            QMessageBox.critical(self, "Erro", str(e))

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec_())