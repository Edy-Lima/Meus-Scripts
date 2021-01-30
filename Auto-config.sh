#!/usr/bin/env bash
#MEU NOVO SCRIPT PESSOAL.
TIME=1
clear
while true;do
echo " "
echo "SEJA BEM VINDO AO $0 DO UBUNTU!"
echo " "
echo "Escolha uma opção abaixo para começar!
      
      1 - Verificar repositório do sistema
      2 - Mostrar atualizações do sistema
      3 - Instalar atualizações do sistema
      4 - Limpar o sistema + Lixeira
      5 - Remover pacotes não necessários
      6 - Configuração automatica do meu desktop
      0 - Sair do sistema"
echo " "
echo -n "Opção escolhida: "
read opcao
case $opcao in
        1)
                echo Verificando o sistema por atualizações...
                sleep $TIME
                sudo apt update
                ;;
        2)
                echo Mostrando as atualizações do sistema...
                sleep $TIME
                sudo apt list --upgradable
                ;;
        3)
                echo Instalando atualizações do sistema...
                sleep $TIME
                sudo apt upgrade -y
                ;;
        4)
                echo Limpando sistema + Lixeira...
                sleep $TIME
                sudo du -sh /var/cache/apt/archives/ 
                sudo rm -rf /var/tmp/*
                sudo apt clean
                sudo apt autoclean
                sudo apt autoremove --purge -y
                sudo rm -rf ${HOME}/.local/share/Trash/* 
                sudo du -sh /var/cache/apt/archives/ 
                ;;
        5)
                echo Removendo pacotes desnecessários do sistema...
                sleep $TIME
                sudo apt autoremove -y
                sudo apt autoremove --purge -y
                ;;
        6)
                echo Configuração do meu desktop...
                sleep $TIME
                echo Ativação do TRIM
                sudo systemctl enable fstrim.timer
                echo TRIM ativado
                echo ***Agora vamos remover algumas coisas do sistema***
                sudo apt remove gnome-keyring -y
                sudo apt remove --auto-remove gnome-keyring -y
                sudo apt remove --purge snapd gnome-software-plugin-snap -y
                sudo rm -rf /var/cache/snapd
                sudo rm -rf ~/snap
                sudo apt remove --purge apport apport-gtk apport-symptoms -y
                sudo apt remove xfburn* atril* firefox* thunderbird* pidgin* -y          
                echo Vamos agora remover o swap...
                # Desativa e remove o swapfile!.
                sudo sed -i.bak '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab && sudo swapoff -a && sudo rm -f -r /swapfile
                echo Swap removido!
                echo ""
                echo ***Aguarde! vamos instalar alguns programas***
                echo 
                echo Instalação do inkskape...
                sudo add-apt-repository ppa:inkscape.dev/stable -y
                sudo apt update && sudo apt install inkscape -y
                echo Instalação do Cubic...
                sudo add-apt-repository ppa:cubic-wizard/release -y
                sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E
                sudo apt update && sudo apt install cubic -y
                echo Instalando programas extras...
                sudo apt install gnome-disk-utility exfat-fuse exfat-utils default-jre -y 
                sudo apt install xfce4-appmenu-plugin appmenu-gtk2-module appmenu-gtk3-module htop screenfetch -y 
                sudo apt install neofetch gdebi gufw plank pitivi synaptic kazam evince -y 
                sudo apt install gtk2-engines-murrine gtk2-engines-pixbuf winff gedit guvcview curl -y
                sudo apt install sassc libcanberra-gtk-module libglib2.0-dev -y
                echo Instalação do Google Chrome...
                wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                sudo dpkg -i google-chrome-stable_current_amd64.deb
                echo Instalação do UNetbootin...
                sudo add-apt-repository ppa:gezakovacs/ppa -y
                sudo apt update && sudo apt install unetbootin -y
                echo Instalação do AnyDesk...
                sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
                echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
                sudo apt update
                sudo apt install anydesk -y
                # Desabilita a inicialização do Anydesk com o sistema!.
                sudo systemctl disable anydesk.service
                echo Instalação do Git-GitHub...
                sudo add-apt-repository ppa:git-core/ppa -y
                sudo apt update && sudo apt install git -y 
                echo Instalação do vs-code...
                sudo apt update
                sudo apt install software-properties-common apt-transport-https wget -y
                wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
                sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
                sudo apt install code -y
                echo Instalação do prelink e preload...
                sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;
                sudo apt install preload prelink -y
                echo Instalação do compton...
                sudo apt install compton-conf -y
                sudo apt install libconfig-dev libqt4-dev qt4-qmake cmake make -y
                clear
                echo Reparando pacotes quebrados...
                sudo apt -f install && sudo dpkg --configure -a
                echo Ok!
                clear
                echo Aguarde vamos atualizar tudo agora!
                sudo apt update && sudo apt full-upgrade -y
                clear
                echo Tudo pronto!
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

