#!/usr/bin/env bash
#
# OBS: Este script é destinado a usuários do Ubuntu que desejam configurar seu sistema operacional de maneira rápida e eficiente.
#
TIME=2

while true; do
    opcao=$(zenity --list \
        --title="Configuração do Ubuntu" \
        --text="Escolha uma opção abaixo para começar:" \
        --column="Opção" --column="Descrição" \
        1 "Remover snap e instalar flatpak" \
        2 "Limpeza geral e atualizações" \
        3 "Configurar meu Ubuntu" \
        0 "Sair")

    case $opcao in
        1)
            zenity --info --text="Removendo snap e instalando flatpak..."
            sleep $TIME
            sudo apt remove --purge snapd -y
            sudo apt autoremove -y
            sudo rm -rf ~/snap /snap /var/snap /var/lib/snapd /var/cache/snapd
            sudo apt update && sudo apt full-upgrade -y
            sudo apt install flatpak -y
            sudo apt install gnome-software-plugin-flatpak -y
            flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
            zenity --info --text="Snap removido e Flatpak instalado!"
            ;;
        2)
            zenity --info --text="Fazendo limpeza e atualizando o sistema..."
            sleep $TIME
            sudo rm -rf /var/tmp/*
            sudo rm -rf ~/.thumbnails/normal/*
            sudo rm -rf ~/.cache/thumbnails/normal/*
            sudo rm -rf ${HOME}/.local/share/Trash/*
            sudo apt update && sudo apt full-upgrade -y
            zenity --info --text="Limpeza e atualização concluídas!"
            ;;
        3)
            zenity --info --text="Configurando seu desktop..."
            sleep $TIME
            sudo apt update && sudo apt full-upgrade -y
            sudo apt remove --purge libreoffice* -y
            sudo swapoff /swapfile
            sudo rm -f /swapfile
            sudo sed -i '/\/swapfile/d' /etc/fstab
            sudo apt update && sudo apt upgrade -y
            sudo apt install ubuntu-restricted-extras -y
            sudo apt install exfatprogs ffmpeg -y
            sudo apt install git synaptic gdebi gnome-shell-extension-manager ffmpeg testdisk glabels gnome-tweaks -y
            gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
            zenity --info --text="Configuração concluída! O computador será reiniciado."
            sleep $TIME
            sudo reboot
            ;;
        0)
            zenity --info --text="Saindo..."
            exit 0
            ;;
        *)
            zenity --error --text="Opção inválida ou cancelada!"
            ;;
    esac
done
