#!/usr/bin/env python3
import os

def instalar_programas(programas):
    for programa in programas:
        print(f"Instalando {programa}...")
        os.system(f"sudo apt update && sudo apt install -y {programa}")

if __name__ == "__main__":
    lista = input("Digite os nomes dos programas separados por espaço: ")
    programas = lista.strip().split()
    # Adiciona git e gdebi à lista, evitando duplicatas
    programas += [p for p in ['git', 'gdebi'] if p not in programas]
    instalar_programas(programas)