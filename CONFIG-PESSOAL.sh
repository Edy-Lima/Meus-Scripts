#!/usr/bin/env bash
#CONFIG-PESSOAL.
TIME=1
clear
while true;do
echo " "
echo "SEJA BEM VINDO AO $0 DO UBUNTU!"
echo " "
echo "Escolha uma opção abaixo para começar!
      
      1 - Remover snap e plugins
      2 - Remover Swap-file
      3 - Remover lista de programas
      4 - Configurar meu Desktop
      5 - Limpeza e atualização
      6 - Remover pacotes não necessários
      0 - Sair do sistema"
echo " "
echo -n "Opção escolhida: "
read opcao
case $opcao in
        1)
                echo Removendo snap e alguns plugins do sistema...
                sleep $TIME
                # Remove snap , apport-symptoms e gnome-keyring.
                sudo apt remove gnome-keyring -y
                sudo apt remove --auto-remove gnome-keyring -y
                sudo apt remove --purge snapd gnome-software-plugin-snap -y
                sudo rm -rf /var/cache/snapd
                sudo rm -rf ~/snap
                sudo apt remove --purge apport apport-gtk apport-symptoms -y
                ;;
        2)
                echo Removendo swap-file do sistema...
                sleep $TIME
                # Desativa e remove o swapfile!.
                sudo sed -i.bak '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab && sudo swapoff -a && sudo rm -f -r /swapfile
                echo Swap removido!
                ;;
        3)
                echo Removendo alguns programas do sistema...
                sleep $TIME
                sudo apt autoremove --purge libreoffice* xfburn* atril* firefox* thunderbird* pidgin* -y
                echo OK!
                ;;
        4)
                echo Configurando o seu Desktop...
                sleep $TIME
                echo ***Aguarde! vamos instalar alguns programas***
                echo 
                echo Instalação do inkskape...
                sudo add-apt-repository ppa:inkscape.dev/stable -y
                sudo apt install inkscape -y
                echo Instalação do Cubic...
                sudo add-apt-repository ppa:cubic-wizard/release -y
                sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E
                sudo apt install cubic -y
                # Instalar alguns programas extras.
                echo Instalando programas extras...
                sudo apt install gnome-disk-utility exfat-fuse exfat-utils default-jre usb-creator-gtk -y 
                sudo apt install xfce4-appmenu-plugin appmenu-gtk2-module appmenu-gtk3-module htop screenfetch -y 
                sudo apt install neofetch gufw plank pitivi synaptic simplescreenrecorder evince testdisk -y 
                sudo apt install gtk2-engines-murrine gtk2-engines-pixbuf winff gedit guvcview curl p7zip-rar -y
                sudo apt install sassc libcanberra-gtk-module libglib2.0-dev gamemode steam -y
                echo Instalação do Google Chrome...
                wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                sudo dpkg -i google-chrome-stable_current_amd64.deb
                echo Instalação do UNetbootin...
                sudo add-apt-repository ppa:gezakovacs/ppa -y
                sudo apt install unetbootin -y
                echo Instalação do AnyDesk...
                wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
                sudo echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
                sudo apt install anydesk -y
                # Desabilita a inicialização do Anydesk com o sistema!.
                sudo systemctl disable anydesk.service
                echo Instalação do Git-GitHub...
                sudo add-apt-repository ppa:git-core/ppa -y
                sudo apt install git -y 
                echo Instalação do vs-code...
                sudo apt install software-properties-common apt-transport-https wget -y
                wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
                sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
                sudo apt install code -y
                # Melhorar o desempenho do sistema.
                echo Instalação do prelink e preload...
                sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;
                sudo apt install preload prelink -y
                echo Instalação do compton...
                sudo apt install compton compton-conf -y
                clear
                echo Reparando pacotes quebrados...
                sudo apt -f install && sudo dpkg --configure -a
                echo Ok!
                ;;
        5)
                echo Fazendo a limpeza e atualização do sistema...
                sleep $TIME
                # Procedimento de limpeza.
                sudo du -sh /var/cache/apt/archives/ 
                sudo rm -rf /var/tmp/*
                sudo rm -vfr ~/.thumbnails/normal/*
                sudo rm -f ~/.cache/thumbnails/normal/*
                sudo apt clean
                sudo apt autoclean
                sudo rm -rf ${HOME}/.local/share/Trash/* 
                sudo du -sh /var/cache/apt/archives/*
                # Procedimento de atualização.
                sudo apt update
                sudo apt list --upgradable
                sudo apt full-upgrade -y
                echo OK!
                ;;
        6)
                echo Removendo pacotes obsoletos do sistema...
                sleep $TIME
                sudo apt autoremove -y
                sudo apt autoremove --purge -y
                echo OK!
                ;;
        0)
                echo Saindo do sistema...
                sleep $TIME
                exit 0
                ;;
        *)
                echo Opção inválida, tente novamente!
                ;;
esac
done
