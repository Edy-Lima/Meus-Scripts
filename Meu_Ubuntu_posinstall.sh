#!/usr/bin/env bash
#
# MEU SCRIPT PESSOAL.
# Este Shell-Script foi criado e editado para uso pessoal,podendo tambem ser usado em qualquer distro baseada em Ubuntu_20 e posterior.
# Este script tem como objetivo remover o Swap-file, remover o suporte a Snap, configurar o desktop, atualizar o sistema e limpar o sistema.
# Este script foi criado e editado por Edy Lima.
# Este script é de uso pessoal, não me responsabilizo por qualquer erro ou dano causado ao seu sistema.     
# (Edy Lima) Blog: https://edylimatutoriais.blogspot.com/
TIME=2
clear
while true;do
echo " "
echo "Bem Vindo ao $0 Para Ubuntu!"
echo " "
echo "Escolha uma opção abaixo para começar!
      
      1 - Remover Swap-file - opcional
      2 - Remover snap e Instalar flatpak - opcional
      3 - Configurar meu Desktop
      4 - Atualizar meu Sistema
      5 - Limpeza do meu Sistema
      0 - Sair"
echo " "
echo -n "Opção escolhida: "
read opcao
case $opcao in
        1)
        echo "Desativando e excluindo Swap...."
        sleep $TIME
        if [ -f /swapfile ]; then
            sudo swapoff /swapfile
            sudo rm -f /swapfile
            sudo sed -i '/\/swapfile/d' /etc/fstab
            echo "Swapfile removido."
        else
            echo "Nenhum swapfile encontrado."
        fi
        ;;
        2)
        # Remover Snap e instalar Flatpak
        echo "Removendo snap e instalando Flatpak...."
        sleep $TIME
            sudo apt remove --purge snapd -y
            sudo apt autoremove -y
            sudo rm -rf "${HOME}/snap" /snap /var/snap /var/lib/snapd /var/cache/snapd
            sudo apt update && sudo apt full-upgrade -y
            sudo apt install flatpak -y
            sudo apt install gnome-software-plugin-flatpak -y
            sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
        ;;
        3)
        # Configurar o Desktop
        echo "Configurando o Desktop, aguarde...."
            sudo apt update && sudo apt full-upgrade -y
        sleep $TIME
        # Instalar o google Chrome
        echo "Instalando Google Chrome...."
            wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
            sudo dpkg -i google-chrome-stable_current_amd64.deb || sudo apt -f install -y
            rm -f google-chrome-stable_current_amd64.deb
        # Instalar o Inkscape
        echo "Instalando Inkscape...."
            sudo add-apt-repository ppa:inkscape.dev/stable -y
            sudo apt update
            sudo apt install inkscape -y
        # Instalar o AnyDesk
        echo "Instalando AnyDesk...."
            wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
        echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
            sudo apt update && sudo apt install anydesk -y
            sudo systemctl disable anydesk.service
        # Instalar git
        echo "Instalando Git...."
            sudo apt install git -y
        # Configurar o GitHub
            git config --global user.name "Edy-Lima"
            git config --global user.email edivaldolima603@gmail.com
        # Instalar extensões do GNOME
        echo "Instalando extensões do GNOME...."
            sudo apt install gnome-shell-extension-manager gnome-tweaks -y
        # Instalar o OBS Studio e OpenShot
        echo "Instalando OBS-Studio...."
            sudo add-apt-repository ppa:obsproject/obs-studio -y
            sudo apt update && sudo apt install obs-studio -y
        # Instalar o OpenShot
        echo "Instalando OpenShot...."
            sudo add-apt-repository ppa:openshot.developers/libopenshot-daily -y
            sudo apt update && sudo apt install openshot-qt python3-openshot -y
        # Remover o LibreOffice
        echo "Removendo o LibreOffice...."
            sudo apt remove --purge libreoffice* -y
            sudo apt autoremove -y
        # Instalar o suporte a exFAT
        echo "Ativando ExFAT...."
            sudo apt install exfatprogs ffmpeg -y
        # Instalar programas adicionais
        echo "Instalando programas adicionais..."
            gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
            sudo apt install neofetch synaptic testdisk gufw glabels default-jre -y
            sudo apt purge thunderbird* -y
        # Instalar codecs multimídia
        echo "Instalando codecs multimídia...."
            sudo apt install ubuntu-restricted-extras -y
            sudo apt install ffmpeg libavcodec-extra -y
        ;;
        4)
        echo "Instalando atualizações do Sistema..."
            sudo apt update && sudo apt full-upgrade -y
        ;;
        5)
        echo "Limpando o Sistema, aguarde...."
        sleep $TIME 
            sudo rm -rf /var/tmp/*
            rm -rf ~/.cache/thumbnails/* 2>/dev/null
            rm -rf "${HOME}/.local/share/Trash/"* 2>/dev/null
        echo "Removendo pacotes desnecessários do sistema...."
            sudo apt autoremove -y
            sudo apt autoclean -y
            sudo apt clean -y
        ;;
        0)
        echo "Saindo...."
        sleep $TIME
        exit 0
        ;;
        *)
        echo "Opção inválida, pode tentar novamente!"
        ;;
esac
done

