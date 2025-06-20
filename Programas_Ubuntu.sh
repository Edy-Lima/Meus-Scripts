#!/usr/bin/env bash
#PROGRAMAS.
# Criado por EdyLima (https://edylimatutoriais.blogspot.com/), pode ser usado em qualquer distro baseada em (Ubuntu).
# OBS: o script faz uso de PPAs, use-o por sua conta e risco.
TIME=2
clear
while true;do
echo " "
echo "BEM VINDO PESSOAL AO $0 PARA UBUNTU!"
echo " "
echo "Escolha uma opção abaixo para começar!    
1 - Instalar Intel Graphics Driver 
2 - Instalar (Kisak-mesa) Driver             
Opção (1 e 2) apenas para hardwares Mais antigos!
--------------------------------------------------------------------------
3 - Instalar Google-Chrome         | 18- Instalar uGet
4 - Instalar inkscape              | 19- Instalar OpenShot
5 - Instalar Cubic                 | 20- Atualizar LibreOffice
6 - Instalar Krita                 | 21- Instalar codecs de multimídia
7 - Instalar AnyDesk               | 22- Instalar o Lutris Ubuntu
8 - Instalar Git-GitHub            | 23- Instalar Wine Ubuntu
9 - Instalar vs-code               | 24-
10- Instalar prelink e preload     | 25- Corrigir pacotes quebrados
11- Manual prelink                 | 26- Remover suporte ao Snap
12- Instalar compton               | 27- Ativar suporte a ExFat no Ubuntu
13- Manual compton                 | 28- Desativar e remover Swap-file
14- Instalar kdenlive              | 29- Buscar e instalar atualizações
15- Instalar SimpleScreenRecorder  | 30- Limpeza geral do sistema
16- Instalar OBS-Studio            |
17- Instalar Ubuntu Mainline       | OBS:Foram adicionados PPAs
                                   | Usem por sua conta e risco                            
0 - Sair do sistema"                 
echo " "
echo -n "Opção escolhida: "
read opcao
case $opcao in
        1)
        echo Instalando Intel Graphics Driver...
                sleep $TIME
                sudo add-apt-repository ppa:ubuntu-x-swat/intel-graphics-updates -y
                sudo apt upgrade -y 
                ;;
        2)
        echo Instalando Kisak-mesa Driver...
                sleep $TIME
                sudo add-apt-repository ppa:kisak/kisak-mesa -y
                sudo apt upgrade -y
                ;;
        3)
        echo Instalando Google Chrome....
                sleep $TIME
                wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                sudo dpkg -i google-chrome-stable_current_amd64.deb
                sudo apt-get --fix-broken install -y
                rm google-chrome-stable_current_amd64.deb
                ;;
        4)
        echo Instalando inkscape....
                sleep $TIME
                sudo add-apt-repository ppa:inkscape.dev/stable -y
                sudo apt install inkscape -y
                ;;
        5)
        echo Instalando Cubic....
                sleep $TIME
                sudo add-apt-repository ppa:cubic-wizard/release -y
                sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E
                sudo apt install cubic curl -y
                ;;
        6)
        echo Instalando Krita....
                sleep $TIME
                sudo add-apt-repository ppa:kritalime/ppa -y
                sudo apt-get update && sudo apt-get install krita -y
        echo Instalando traduções....
                sudo apt-get install krita-l10n -y
                ;;
        7)
        echo Instalando AnyDesk....
                sleep $TIME
                wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
                echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
                sudo apt update && sudo apt install anydesk -y
                sudo systemctl disable anydesk.service
                ;;
        8)
        echo Instalando Git-GitHub...
                sleep $TIME
                sudo add-apt-repository ppa:git-core/ppa -y
                sudo apt install git -y 
                ;;
        9)
        echo Instalando vs-code...
                sleep $TIME
                sudo apt install software-properties-common apt-transport-https wget -y
                wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
                sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
                sudo apt install code -y 
                ;;
        10)
        echo Instalando prelink e preload...
                sleep $TIME
                sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;
                sudo apt install preload prelink -y
                ;;
        11)
        echo "***Manual prelink no link abaixo***"
                sleep $TIME
                x-www-browser https://drive.google.com/file/d/1_8q_J90faC7kdVO-Z4mo1blsHzRVxXsL/view?usp=sharing
                ;;
        12)
        echo Instalando compton...
                sleep $TIME
                sudo apt install compton compton-conf -y 
                ;;
        13)
        echo "***Manual compton no link abaixo***"
                sleep $TIME
                x-www-browser https://drive.google.com/file/d/1iDIrYXoDQzBOM2rGj-JbQG2e2yuS12u1/view?usp=sharing
                ;;
        14)
        echo Instalando kdenlive...
                sleep $TIME 
                sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y
                sudo apt install kdenlive -y
                sudo apt install kde-style-breeze -y  
                ;;
        15)
        echo Instalando SimpleScreenRecorder...
                sleep $TIME
                sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -y
                sudo apt install simplescreenrecorder -y
                ;;
        16)
        echo Instalando OBS-Studio...
                sleep $TIME
                sudo add-apt-repository ppa:obsproject/obs-studio -y
                sudo apt update && sudo apt install obs-studio -y
                ;;
        17)
        echo Instalando Mainline...
                sleep $TIME
                sudo add-apt-repository ppa:cappelikan/ppa -y
                sudo apt install mainline -y
                ;;
        18)
        echo Instalando uGet...
                sleep $TIME
                sudo add-apt-repository ppa:plushuang-tw/uget-stable -y
                sudo apt update
                sudo apt install uget aria2 -y
                ;;
        19)
        echo Instalando OpenShot....
                sleep $TIME
                sudo add-apt-repository ppa:openshot.developers/libopenshot-daily -y
                sudo apt-get update && sudo apt-get install openshot-qt python3-openshot -y
                ;;
        20)
        echo Instalando LibreOffice....
                sleep $TIME
                sudo add-apt-repository ppa:libreoffice/ppa -y
                sudo apt-get update
                sudo apt-get install libreoffice libreoffice-style-breeze -y
                ;;
        21)
        echo Instalando codecs de multimídia....
                sleep $TIME
                sudo apt install ubuntu-restricted-extras -y
                sudo apt install ffmpeg libavcodec-extra -y
                ;;
        22)
        echo Instalando o Lutris....
                sleep $TIME
                sudo add-apt-repository ppa:lutris-team/lutris -y
                sudo apt update && sudo apt install lutris -y
                ;;
        23)
        echo Instalando Wine....
                sleep $TIME
                sudo dpkg --add-architecture i386
                wget -nc https://dl.winehq.org/wine-builds/winehq.key
                sudo apt-key add winehq.key
                sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
                sudo apt-get update && sudo apt-get install --install-recommends winehq-stable -y
                ;;
        24)
        echo "Nenhuma ação definida para esta opção."
                sleep $TIME
                ;;
        25)
        echo Corrigindo pacotes quebrados....
                sleep $TIME
                sudo apt-get --fix-broken install -y
                sudo apt clean
                sudo apt install -f -y
                sudo dpkg --configure -a
                sudo rm -vf /var/lib/apt/lists/*
                sudo apt update
                sudo apt clean
                sudo apt autoclean
                sudo apt autoremove -y
                sudo dpkg --configure -a
                sudo apt update && sudo apt dist-upgrade -y
                clear
                ;;
        26)
        echo Removendo suporte a Snap....
                sleep $TIME
                sudo apt remove --purge snapd gnome-software-plugin-snap -y
                sudo rm -rf /var/cache/snapd/
                sudo rm -rf ~/snap /snap /var/snap /var/lib/snapd
                sudo apt autoremove -y
                ;;
        27)
        echo Ativando ExFat....
                sleep $TIME
                sudo add-apt-repository universe
                sudo apt update && sudo apt install exfatprogs -y
                ;;
        28)
        echo Desativando e removendo Swap-file....
                sleep $TIME
                sudo swapoff /swapfile
                sudo rm -f /swapfile
                sudo sed -i '/\/swapfile/d' /etc/fstab
                ;;
        29)
        echo Buscando atualizações....
                sleep $TIME
                sudo apt update && sudo apt full-upgrade -y
                ;;
        30)
        echo Limpando o Sistema....
                sleep $TIME
                sudo rm -rf /var/tmp/*
                sudo rm -vf ~/.thumbnails/normal/*
                sudo rm -f ~/.cache/thumbnails/normal/*
                sudo apt clean
                sudo apt autoclean
                sudo rm -rf ${HOME}/.local/share/Trash/*
                clear
        echo Removendo pacotes desnecessários do sistema....
                sudo apt autoremove -y
                sudo apt autoremove --purge -y
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
