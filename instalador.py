import os

def instalar_programas(programas):
    for programa in programas:
        print(f"Instalando {programa}...")
        os.system(f"sudo apt update && sudo apt install -y {programa}")

if __name__ == "__main__":
    lista = input("Digite os nomes dos programas separados por espaço: ")
    programas = lista.strip().split()
    instalar_programas(programas)