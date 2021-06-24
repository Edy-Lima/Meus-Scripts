#!/usr/bin/env bash
#PROGRAMAS.
TIME=1
clear
while true;do
echo " "
echo "SEJA BEM VINDO AO $0 PARA UBUNTU!"
echo " "
echo "Escolha uma opção abaixo para começar!
      
      1 - Instalar Intel Graphics Driver
      2 - Instalar (Kisak-mesa) Driver
      3 - Instalar Google-Chrome
      4 - Instalar inkskape
      5 - Instalar Cubic
      6 - Instalar UNetbootin
      7 - Instalar AnyDesk
      8 - Instalar Git-GitHub
      9 - Instalar vs-code
      10- Instalar prelink e preload * 11- Manual prelink
      12- Instalar compton * 13- Manual compton
      14- Instalar kdenlive
      15- Instalar SimpleScreenRecorder
      16- Instalar Lutris
      17- Instalar Ubuntu Mainline Kernel Installer
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
                echo Instalando Google Chrome...
                sleep $TIME
                wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                sudo dpkg -i google-chrome-stable_current_amd64.deb
                ;;
        4)
                echo Instalando inkskape...
                sudo add-apt-repository ppa:inkscape.dev/stable -y
                sudo apt install inkscape -y
                ;;
        5)
                echo Instalando Cubic...
                sleep $TIME
                sudo add-apt-repository ppa:cubic-wizard/release -y
                sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E
                sudo apt install cubic curl -y
                ;;
        6)
                echo Instalando UNetbootin...
                sleep $TIME
                sudo add-apt-repository ppa:gezakovacs/ppa -y
                sudo apt install unetbootin -y
                ;;
        7)
                echo Instalando AnyDesk...
                sleep $TIME
                sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
                sudo echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
                sudo apt update && sudo apt install anydesk -y
                ;;
        8)
                echo Instalando Git-GgitHub...
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
                echo ***Manual prelink no link abaixo***
                sleep $TIME
                x-www-browser https://drive.google.com/file/d/1_8q_J90faC7kdVO-Z4mo1blsHzRVxXsL/view?usp=sharing
                ;;
        12)
                echo Instalando compton...
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
                sleep $TIME 
                sudo add-apt-repository ppa: kdenlive / kdenlive-stable -y
                sudo apt install kdenlive -y     
                ;;
        15)
                echo Instalando  SimpleScreenRecorder...
                sleep $TIME
                sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -y
                sudo apt install simplescreenrecorder -y
                ;;
        16)
                echo Instalando Lutris...
                sudo add-apt-repository ppa:lutris-team/lutris -y
                sudo apt install lutris -y
                ;;
        17)
                echo instalando Mainline...
                sudo apt-add-repository -y ppa:cappelikan/ppa
                sudo apt install mainline -y
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
