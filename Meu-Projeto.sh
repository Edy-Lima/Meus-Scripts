#!/bin/bash
# filepath: /home/edy/Meus-Scripts/instalar_programas.sh

# Lista de programas disponíveis
PROGRAMAS=$(zenity --list --checklist \
  --title="Instalar Programas" \
  --text="Selecione os programas que deseja instalar:" \
  --column="Selecionar" --column="Programa" --column="Descrição" \
  FALSE "vim" "Editor de texto" \
  FALSE "git" "Controle de versão" \
  FALSE "curl" "Transferência de dados" \
  FALSE "htop" "Monitor de sistema" \
  FALSE "gimp" "Editor de imagens" \
  FALSE "vlc" "Reprodutor de mídia" \
  FALSE "neofetch" "Visualizador do sistema" \
  FALSE "Atualização de sistema" "Atualiza o sistema" \
  --separator=" ")

# Verifica se o usuário selecionou algum programa
if [ -z "$PROGRAMAS" ]; then
  zenity --info --text="Nenhum programa selecionado."
  exit 0
fi

# Confirmação
zenity --question --text="Deseja instalar: $PROGRAMAS ?"
if [ $? -eq 0 ]; then
  gnome-terminal -- bash -c "sudo apt update && sudo apt install -y $PROGRAMAS; echo 'Instalação concluída!'; read"
else
  zenity --info --text="Instalação cancelada."
fi
