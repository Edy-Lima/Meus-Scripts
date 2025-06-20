#!/usr/bin/env bash
#
# MEU SCRIPT PESSOAL.
# Este Shell-Script foi criado e editado para uso pessoal, podendo também ser usado em qualquer distro baseada em Ubuntu_20 e posterior.
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
        echo Desativando e excluindo Swap....
                sleep $TIME
                sudo systemctl stop swap.img.swap -y
                sudo systemctl mask swap.img.swap -y
                clear
                ;;
        2)
        echo Removendo snap e instalando Flatpak....
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
        3)
        echo Configurando o Sistema...
                sleep $TIME
        echo Instalando Google Chrome....
                wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                sudo dpkg -i google-chrome-stable_current_amd64.deb
                clear
        echo Instalando Inkscape....
                sudo add-apt-repository ppa:inkscape.dev/stable -y
                sudo apt install inkscape -y
                clear
        echo "Instalando AnyDesk...."
                wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
                echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
                sudo apt update && sudo apt install anydesk -y
                sudo systemctl disable anydesk.service
                clear
        echo "Instalando Git e GitHub...."
                sudo apt install git -y
                clear 
        echo "Instalando extensões do GNOME...."
                sudo apt update && sudo apt upgrade -y
                sudo apt install gnome-shell-extension-manager gnome-tweaks -y       
                clear 
        echo "Instalando OBS-Studio...."
                sudo add-apt-repository ppa:obsproject/obs-studio -y
                sudo apt update && sudo apt install obs-studio -y
                clear
        echo "Instalando OpenShot...."
                sudo add-apt-repository ppa:openshot.developers/libopenshot-daily -y
                sudo apt update && sudo apt install openshot-qt python3-openshot -y
                clear
        echo "Removendo o LibreOffice...."
                sudo apt remove --purge libreoffice* -y
                clear
        echo "Ativando ExFAT...."
                sudo apt update && sudo apt upgrade -y
                sudo apt install exfatprogs ffmpeg -y
                clear
        echo "Instalando programas adicionais..."
                gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
                sudo apt install neofetch synaptic testdisk glabels default-jre -y
                sudo apt purge thunderbird* -y
                clear
        echo "Instalando codecs multimídia...."
                sudo apt install ubuntu-restricted-extras -y
                sudo apt install ffmpeg libavcodec-extra -y
                clear
                ;;
        4)
        echo Instalando atualizações do Sistema...
                sudo apt update && sudo apt full-upgrade -y
                clear
                ;;
        5)
        echo Limpando o Sistema aguarde....
                sleep $TIME 
                sudo rm -rf /var/tmp/*
                sudo rm -vfr ~/.thumbnails/normal/*
                sudo rm -f ~/.cache/thumbnails/normal/*
                sudo rm -rf ${HOME}/.local/share/Trash/* 
                clear
        echo Removendo pacotes desnecessários do sistema....
                sudo apt autoremove -y
                sudo apt autoclean -y
                sudo apt clean -y
                clear
                ;;
        0)
        echo Saindo....
                sleep $TIME
                exit 0
                ;;
        *)
        echo Opção inválida, pode tentar novamente!
                ;;
esac
done