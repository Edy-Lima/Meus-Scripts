#!/usr/bin/env bash
#PROGRAMAS.
# Criado por EdyLima (https://edylimatutoriais.blogspot.com/), pode ser usado em qualquer distro baseada em (Ubuntu).
# OBS: o script faz uso de PPA,s, use-o por sua conta e risco.
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
17- Instalar Ubuntu Mainline       | OBS:Foram adicionados PPA,s
                                   | Usem por sua conta e risco                            
0 - Sair do sistema"                 
echo " "
echo -n "Opção escolhida: "
read opcao
case $opcao in
        1)
        echo Instalando Intel Graphics Driver...
                sleep $TIME
                sudo add-apt-repository ppa: ubuntu-x-swat / intel-graphics-updates -y
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
              # Este comando faz o download e instala o google-chrome em seu desktop.
                sleep $TIME
                wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                sudo dpkg -i google-chrome-stable_current_amd64.deb
                ;;
        4)
        echo Instalando inkscape....
              # Este comando instala o inkscape.
                sleep $TIME
                sudo add-apt-repository ppa:inkscape.dev/stable -y
                sudo apt install inkscape -y
                ;;
        5)
        echo Instalando Cubic....
              # Este comando instala o Cubic,poderoso editor de ISO
                sleep $TIME
                sudo add-apt-repository ppa:cubic-wizard/release -y
                sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E
                sudo apt install cubic curl -y
                ;;
        6)
        echo Instalando Krita....
              # Este comando instala o krita em seu desktop.
                sleep $TIME
                sudo add-apt-repository ppa: kritalime / ppa -y
                sudo apt-get update && sudo apt-get install krita -y
        echo instalar traduções....
              # Este comando instala pacote de tradução
                sudo apt-get install krita-l10n -y

                ;;
        7)
        echo Instalando AnyDesk....
              # Este comando instala o Anydesk em seu desktop.
                sleep $TIME
                sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
                sudo echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
                sudo apt update && sudo apt install anydesk -y
              # Desabilita a inicialização do Anydesk com o sistema!.
                sudo systemctl disable anydesk.service
                ;;
        8)
        echo Instalando Git-GgitHub...
                sleep $TIME
                sudo add-apt-repository ppa:git-core/ppa -y
                sudo apt install git -y 
                ;;
        9)
        echo Instalando vs-code...
              # Estes comandos instala o VSCode na versão mais recente
                sleep $TIME
                sudo apt install software-properties-common apt-transport-https wget -y
                wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
                sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
                sudo apt install code -y 
                ;;
        10)
        echo Instalando prelink e preload...
              # Este comando instala o prelink em seu desktop
                sleep $TIME
                sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;
                sudo apt install preload prelink -y
                ;;
        11)
        echo ***Manual prelink no link abaixo***
                sleep $TIME
                x-www-browser https://drive.google.com/file/d/1_8q_J90faC7kdVO-Z4mo1blsHzRVxXsL/view?usp=sharing
                ;;
        12)
        echo Instalando compton...
              # Este comando instala o Compositor de janelas em seu desktop (XFCE)
                sleep $TIME
                sudo apt install compton compton-conf -y 
                ;;
        13)
        echo ***Manual compton no link abaixo***
                sleep $TIME
                x-www-browser https://drive.google.com/file/d/1iDIrYXoDQzBOM2rGj-JbQG2e2yuS12u1/view?usp=sharing
                ;;
        14)
        echo Instalando kdenlive...
              # Estes comandos adicionam PPA e instala o Kdenlive editor de video em seu desktop.
                sleep $TIME 
                sudo add-apt-repository ppa: kdenlive / kdenlive-stable -y
                sudo apt install kdenlive -y
                # Este comando instala o tema breeeze no Kdenlive
                sudo apt install kde-style-breeze -y  
                ;;
        15)
        echo Instalando  SimpleScreenRecorder...
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
        echo instalando Mainline...
                sleep $TIME
                sudo apt-add-repository -y ppa:cappelikan/ppa -y
                sudo apt install mainline -y
                ;;
        18)
        echo instalando uGet...
                sleep $TIME
                sudo add-apt-repository ppa:plushuang-tw/uget-stable -y
                sudo apt update
                sudo apt install uget aria2 -y
                ;;
        19)
        echo instalando OpenShot....
                sleep $TIME
                sudo add-apt-repository ppa:openshot.developers/libopenshot-daily -y
                sudo apt-get update && sudo apt-get install openshot-qt python3-openshot -y
                ;;
        20)
        echo Instalando LibreOffice....
                sleep $TIME
                sudo add-apt-repository -y ppa:libreoffice/ppa -y
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
        echo Instalando o Ltris....
                sleep $TIME
                sudo add-apt-repository ppa:lutris-team/lutris -y
                sudo apt update && sudo apt install lutris -y
                
                ;;
        23)
        echo Instalando Wine....
                sleep $TIME
                sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y
                sudo apt-get update && sudo apt-get install wine-stable -y

                ;;
        24)
        echo
                sleep $TIME

                ;;
        25)
        echo Corrigindo pacotes quegrados....
                sleep $TIME
                sudo apt-get –fix-broken install -y
                sudo apt clean
                sudo apt install -f -y
                sudo dpkg –configure -a
                sudo rm /var/lib/apt/lists/* -vf -y
                sudo apt update
                sudo apt clean
                sudo apt autoclean
                sudo apt autoremove -y
                sudo dpkg –configure -a
                sudo apt update && sudo apt dist-upgrade -y
                clear
                ;;
        26)
        echo Removendo suporte a Snap....
                Sleep $TIME
                sudo apt install gnome-software -y
                sudo rm -rf /var/cache/snapd/
                sudo apt autoremove --purge snapd gnome-software-plugin-snap -y
                sudo rm -fr ~/snap
                ;;
        27)
        echo Ativando ExFat....
                sleep $TIME
                sudo add-apt-repository universe -y
                sudo apt update && sudo apt install exfat-fuse exfat-utils -y
                ;;
        28)
        echo Desativando Swap-file....
                sleep $TIME
                sudo systemctl stop swap.img.swap && sudo systemctl mask swap.img.swap -y
                ;;
        29)
        echo Buscando atualizaçõe....
                sleep $TIME
                sudo apt update && sudo apt full-upgrade -y
                ;;
        30)
        echo Limpando o Sistema....
                sleep $TIME
                sudo rm -rf /var/tmp/*
                sudo rm -vfr ~/.thumbnails/normal/*
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
