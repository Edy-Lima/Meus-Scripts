#!/usr/bin/env bash
#
# Script para configuração rápida do Ubuntu via terminal.
#
TIME=2

while true; do
    echo "=============================="
    echo "Configuração do Ubuntu"
    echo "1 - Remover snap e instalar flatpak"
    echo "2 - Limpeza geral e atualizações"
    echo "3 - Configurar meu Ubuntu"
    echo "4 - Procurar atualizações disponíveis"
    echo "0 - Sair"
    echo "=============================="
    read -rp "Escolha uma opção: " opcao

    case $opcao in
        1)
            echo "Removendo snap e instalando flatpak..."
            sleep $TIME
            # Remover Snap e pacotes relacionados
            sudo systemctl stop snapd
            sudo apt purge snapd -y
            sudo rm -rf ~/snap /snap /var/snap /var/lib/snapd /var/cache/snapd
            # Instalar Flatpak e GNOME Software
            sudo apt update
            sudo apt install flatpak gnome-software-plugin-flatpak gnome-software -y
            # Adicionar repositório Flathub
            sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
            echo "Snap removido, Flatpak e GNOME Software instalados com suporte ao Flathub."
            echo "Reinicie o computador para aplicar as mudanças."
            sleep $TIME
            sudo reboot
            ;;
        2)
            echo "Fazendo limpeza e atualizando o sistema..."
            sleep $TIME
            sudo rm -rf /var/tmp/*
            rm -rf "${HOME}/.thumbnails/"* 2>/dev/null
            rm -rf "${HOME}/.cache/thumbnails/"* 2>/dev/null
            rm -rf "${HOME}/.local/share/Trash/"* 2>/dev/null
            sudo apt update && sudo apt full-upgrade -y
            echo "Limpeza e atualização concluídas!"
            ;;
        3)
            echo "Configurando seu desktop..."
            sleep $TIME
            sudo apt update && sudo apt full-upgrade -y
            sudo apt remove --purge libreoffice* -y
            sudo apt update && sudo apt upgrade -y
            sudo apt install ubuntu-restricted-extras -y
            sudo apt install exfatprogs ffmpeg -y
            sudo apt install -y mesa-utils mesa-vulkan-drivers intel-media-va-driver firmware-misc-nonfree -y
            sudo apt install git synaptic gdebi gnome-shell-extension-manager ffmpeg testdisk glabels gnome-tweaks -y
            gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
            # Definir plano de fundo temporário (exemplo de caminho local)
            # gsettings set org.gnome.desktop.background picture-uri "file://${HOME}/Imagens/sua-imagem.jpg"
            echo "Configuração concluída! O computador será reiniciado."
            sleep $TIME
            sudo reboot
            ;;
        4)
            echo "Procurando por atualizações disponíveis..."
            sleep $TIME
            sudo apt update
            ;;
        0)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida ou cancelada!"
            ;;
    esac
done
