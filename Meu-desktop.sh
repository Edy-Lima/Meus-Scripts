#!/usr/bin/env bash
#
# OBS: Este script é destinado a usuários do Ubuntu que desejam configurar seu sistema operacional de maneira rápida e eficiente.
#
TIME=2
clear
while true;do
echo " "
echo "Configurando meu Ubuntu!"
echo " "
echo "Escolha uma opção abaixo para começar!

      1 - Remover snap e instal flatpak
      2 - Limpeza geral e atualizações
      3 - Configurar meu Ubuntu
      0 - Sair"
echo " "
echo -n "Opçao escolhida: "
read opcao
case $opcao in
     1)
echo Removendo snap....
     # Edte comando vai remover todo o suporte ao snap e instalar flatpak com o gnome-software.
     sleep $TIME
      sudo apt remove --purge snapd* -y
      sudo apt autoremove -y
      clear
echo Instalando suporte a flatpak....
     # Este comando instal todas as depedências para o flatpak.
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
      sudo apt update && sudo apt full-upgrade -y
      sudo apt remove --purge libreoffice* -y 
      clear
echo Desativar e excluir Swap....
     # Este comando vai desativar e excluir o Swap do Ubuntu.
      sleep $TIME
      sudo systemctl stop swap.img.swap -y
      sudo systemctl mask swap.img.swap -y
      clear
echo Instalando Codecs extras....
     # Este comando vai instalar os codecs extras do Ubuntu.
      sleep $TIME
      sudo apt update && sudo apt upgrade -y
      sudo apt install ubuntu-restricted-extras -y 
      clear
echo Ativando suporte a exfat no ubuntu....
     # Este comando vai ativar o suporte a exfat no Ubuntu.
      sleep $TIME
      sudo apt install exfat-fuse exfat-utils -y
      sudo apt install exfatprogs ffmpeg -y
      clear
echo Instalando programas essenciais....
     # Este comando vai instalar programas essenciais no Ubuntu.
      sleep $TIME
      sudo apt install git synaptic gdebi gnome-shell-extension-manager ffmpeg testdisk glabels gnome-tweaks -y
      gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
      clear
echo Tudo pronto , agora vamos reinicar o computador!
     # Este comando vai reiniciar o computador.
      sleep $TIME
      sudo reboot
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
esac
done
