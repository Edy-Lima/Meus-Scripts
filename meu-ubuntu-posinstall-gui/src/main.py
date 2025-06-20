from tkinter import Tk, Label, Button, messagebox
import subprocess
import os

class MainWindow:
    def __init__(self, master):
        self.master = master
        master.title("Meu Ubuntu Posinstall")

        self.label = Label(master, text="Bem Vindo ao Meu Ubuntu Posinstall!")
        self.label.pack()

        self.create_buttons()

    def create_buttons(self):
        options = [
            ("Remover Swap-file", "1"),
            ("Remover Snap e Instalar Flatpak", "2"),
            ("Configurar meu Desktop", "3"),
            ("Atualizar meu Sistema", "4"),
            ("Limpeza do meu Sistema", "5"),
            ("Sair", "0")
        ]

        for text, option in options:
            button = Button(self.master, text=text, command=lambda opt=option: self.run_script(opt))
            button.pack(pady=5)

    def run_script(self, option):
        script_path = os.path.join(os.path.dirname(__file__), 'scripts', 'Meu_Ubuntu_posinstall.sh')
        command = f"bash {script_path} {option}"
        
        try:
            output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
            messagebox.showinfo("Saída", output.decode())
        except subprocess.CalledProcessError as e:
            messagebox.showerror("Erro", e.output.decode())

if __name__ == "__main__":
    root = Tk()
    main_window = MainWindow(root)
    root.mainloop()