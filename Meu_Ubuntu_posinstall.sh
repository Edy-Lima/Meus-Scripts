#!/usr/bin/env bash
#
# MEU SCRIPT PESSOAL.
# Este Shell-Script foi criado e editado para uso pessoal,podendo tambem ser usado em qualquer distro baseada em Ubuntu_20 e posrerior.
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
      
      1 - Remover Swap-file
      2 - Instalar suporte a flatpak
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
              # Este comando irá desativar e excluir o Swapfile.
                sleep $TIME
                sudo systemctl stop swap.img.swap && sudo systemctl mask swap.img.swap -y
                clear
                ;;
        2)
        echo Instalando Flatpak....
              # Este comando irá excluir todo suporte a Snap.
                sleep $TIME
                sudo apt install flatpak -y
                sudo apt install gnome-software-plugin-flatpak -y
                clear
                ;;
        3)
        echo Configrando o Sistema...
                sleep $TIME
        echo Instalando Google Chrome....
              # Estes comandos irá baixar e instalar o google-chrome em seu desktop.
                wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                sudo dpkg -i google-chrome-stable_current_amd64.deb
                clear
        echo instalando inkscape....
              # Estes comandos instalam o Inkscape em seu desktop.
                sudo add-apt-repository ppa:inkscape.dev/stable -y
                sudo apt install inkscape -y
                clear
        echo Instalando AnyDesk....
              # Estes comandos instala o Anydessk em seu desktop.
                sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
                sudo echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
                sudo apt update && sudo apt install anydesk -y
              # Desabilita a inicialização do Anydesk com o sistema!.
                sudo systemctl disable anydesk.service
                clear
        echo Instalando Git-GgitHub....
              # Estes comandos instalam o Git-GitHub em seu desktop.
                sudo apt install git -y
                clear 
        echo Instalando extensões do gnome....
              # Estes comandos instalam um greciador de extenssões do gnome em seu desktop
                sudo apt update && sudo apt upgrade -y
                sudo apt install gnome-shell-extession-manager gnome-tweaks -y       
                clear 
        echo Instalando OBS-Studio....
              # Estes comandos instala o OBS-Studio em seu desktop.
                sudo add-apt-repository ppa:obsproject/obs-studio -y
                sudo apt update && sudo apt install obs-studio -y
                clear
        echo instalando OpenShot....
              # Estes comandos instalam o Openshot em seu desktop.
                sudo add-apt-repository ppa:openshot.developers/libopenshot-daily -y
                sudo apt update && sudo apt install openshot-qt python3-openshot -y
                clear
        echo Removendo o LibreOffice....
              # Este comando remove o libreoffice antigo do sistema.
                sudo apt remove --purge libreoffice* -y
                clear
        echo Ativando ExFat....
              # Estes comandos instalam o suporte a Exfat no Ubuntu.-desktop.
              # Reiniciar o sistema após a instalação.
                sudo apt update && sudo apt upgrade -y
                sudo apt install exfatprogs ffmpeg -y
                clear
        echo Instalando programar adicionais...
              # Este comando instala alguns programas extras em seu desktop.
                sudo gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews' neofetch synaptic testdisk glabels default-jre -y
                sudo apt purge thunderbird* -y
                clear
        echo Instalando codecs multimidias....
              # Este comando instala o Ubuntu-restricted-extra em seu desktop.
                sudo apt install ubuntu-restricted-extras -y
                sudo apt install ffmpeg libavcodec-extra -y
                sudo reboot -y
                clear
                ;;
        4)
        echo Instalando atualizações do Sistema...
              # Comandos para atualizar o Siatema Ubuntu.
                sudo apt update && sudo apt dist-upgrade -y
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

