#!/usr/bin/env bash
#
#
#
TIME=2
clear
while true;do
echo " "
echo "Bem Vindo ao $0 Para Ubuntu!"
echo " "
echo "Escolha uma opção abaixo para começar!

      1 - Remover snap e instal flatpak
      2 - Limpeza geral e atualizações
      3 - Configurar meu Ubuntu
      0 - Sair"
echo " "
echo -n "Opçao escolhida: "
read opçao
case $opcao in
     1)
echo Removendo snap e instalando flatpak....
     # Edte comando vai remover todo o suporte ao snap e instalar flatpak com o gnome-software.
     sleep $TIME
      sudo apt remove --purge snapd -y
      sudo apt autoremove -y
      clear
      sudo apt update && sudo apt full-upgrade -y
      sudo apt install flatpak -y
      sudo apt install gnome-software-plugin-flatpak -y
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo -y
     clear
         ;;
     2)
echo Fazendo limpeza e atualizabdo o Sistema....
     # Este comando limpa e atualiza o Sistema.
     sleep $TIME
      sudo rm -rf /var/tmp/*
      sudo rm -vfr ~/.thumbnails/normal/*
      sudo rm -f ~/.cache/thumbnails/normal/*
      sudo rm -rf ${HOME}/.local/share/Trash/* 
      sudo apt update && sudo apt full-upgrade -y
      clear
      ;;
     3)
echo Configurando seu desktop....
     # Este comando vai configurar seu sistema operacional. 
     sleep $TIME
      clear
     ;;
     0)
echo Saindo....
     # Este comando encerra o programa!
     sleep $TIME
         exit 0
         ;;
     *)
echo Opçao invalida, tente novamente!
         ;;
