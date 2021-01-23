#!/bin/bash
read -s -n1 -p"****O que deseja fazer?****

(A)=>Lista do que será removido
(B)=>Lista do será instalado
(C)=>Manual Prelink
(D)=>Manual Compton
(E)=>Configurar meu desktop
(F)=>Limpar meu desktop
(S)=>Sair
Digite =>"
read resposta
case "$resposta" in
    a|A|"")
echo ""
      echo "***Serão removidos***
=======================================
1-Gnome-keyring
2-Snapd
3-Gtk-apport-Sympton
4-Xfburn
5-Atril
6-Pidgin
7-Thunderbird
8-Firefox
9-Swapfile
========================================
***Digite ( ./meu-desktop-config.sh + ENTER para voltar ao inicio)***
"
    ;;
    b|B)
echo ""
      echo "***Serão instalados***
==================================================
1-Inkscape                    11-Curl
2-Cubic                       12-Bleachbit
3-Gnome-disk-utility          13-Google-Chrome
4-default-jre (Java)          14-UNetbootin
5-xfce4-appmenu-plugin        15-AnyDesk
6-Htop                        16-Git-GitHub
7-Neofetch                    17-ADB-fastboot
8-Gdebi                       18-vs-code
9-Gufw                        19-prelink e preload
10-Guvcview                   20-Compton
===================================================
***Digite ( ./meu-desktop-config.sh + ENTER para voltar ao inicio)***
"

    ;;
    c|C)
echo ""
      echo "***Manual Prelink***
===================================================
configuração do Prelink:

sudo gedit /etc/default/prelink

Procure a linha:

PRELINKING=unknown

E mude para:

PRELINKING=yes

Agora execute o Prelink:

sudo /etc/cron.daily/prelink 
====================================================
***Digite ( ./meu-desktop-config.sh + ENTER para voltar ao inicio)***
"

    ;;
    d|D)
echo ""
      echo "***Manual compton no link abaixo***"
echo "https://edylimatutoriais.blogspot.com/2021/01/instalando-e-configurando-o-compton-no.html" 

    ;;
    e|E)
echo ""
      echo "Configurando seu desktop..."
      echo "Digite a senha de usuário para continuar"
sudo systemctl enable fstrim.timer
      echo "TRIM ativado!"
echo ""
      echo "(Agora vamos remover algumas coisas)."
sudo apt remove gnome-keyring -y
sudo apt remove --auto-remove gnome-keyring -y
sudo apt remove --purge snapd gnome-software-plugin-snap -y
sudo rm -rf /var/cache/snapd
sudo rm -rf ~/snap
sudo apt remove --purge apport apport-gtk apport-symptoms -y
sudo apt remove xfburn* atril* firefox* thunderbird* pidgin* -y
sudo apt autoremove -y
echo ""
      echo "(Vamos agora remover o swap)"
#Desativa e remove o swapfile!
sudo sed -i.bak '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab && sudo swapoff -a && sudo rm -f -r /swapfile
      echo "Swap removido"
echo ""
      echo "(Aguarde! vamos instalar alguns programas.)"
echo ""
      echo "(Instalando inkskape)"
sudo add-apt-repository ppa:inkscape.dev/stable -y
sudo apt update && sudo apt install inkscape -y
echo ""
      echo "(Instalando Cubic)"
sudo add-apt-repository ppa:cubic-wizard/release -y
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E
sudo apt update && sudo apt install cubic -y
echo ""
      echo "(Instalando programas extras)"
sudo apt install gnome-disk-utility exfat-fuse exfat-utils default-jre xfce4-appmenu-plugin appmenu-gtk2-module appmenu-gtk3-module htop screenfetch neofetch gdebi gufw plank pitivi synaptic kazam evince gtk2-engines-murrine gtk2-engines-pixbuf winff gedit guvcview curl bleachbit -y
echo ""
      echo "(Instalando Google Chrome)"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
echo ""
      echo "(Vamos instalar o UNetbootin!)"
sudo add-apt-repository ppa:gezakovacs/ppa -y
sudo apt update && sudo apt install unetbootin -y
echo ""
      echo "(Instalando AnyDesk)"
sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update
sudo apt install anydesk -y
#Desabilita a inicialização do Anydesk com o sistema!
sudo systemctl disable anydesk.service
echo ""
      echo "(Instalando Git-GitHub)"
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update && sudo apt install git -y 
echo ""
      echo "(Vamos instalar o ADB para voçê)"
sudo add-apt-repository ppa:nilarimogard/webupd8 -y
sudo apt update
sudo apt install android-tools-adb android-tools-fastboot -y
echo ""
      echo "(Instalando vs-code)"
sudo apt update
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code -y
echo "" 
      echo "(Vamos instalar o prelink e preload)"
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;
sudo apt install preload prelink -y
echo ""
      echo " (Vamos instalar o compton)"
sudo apt install compton-conf -y
clear
echo ""
      echo "(Reparando pacotes quebrados)"
sudo apt -f install && sudo dpkg --configure -a
      echo "Ok!"
clear
echo ""
      echo "(Aguarde vamos atualizar tudo agora!)"
sudo apt update && sudo apt full-upgrade -y
echo ""
clear
echo ""
      echo "Tudo pronto!"
sleep 2
sudo ./meu-desktop-config.sh
    ;;
    f|F)
echo ""
      echo "Limpando seu desktop aguarde..."
      echo "Digite a senha de usuário para continuar"
sudo du -h /var/cache/apt/archives/ 
sudo rm -rf /var/tmp/*
sudo apt clean -y
sudo apt autoclean -y
sudo apt autoremove --purge -y
sudo rm -rf ${HOME}/.local/share/Trash/* 
sudo du -h /var/cache/apt/archives/ 
      echo "Tudo Limpo!"
sleep 2
sudo ./meu-desktop-config.sh


    ;;
    s|S)
      echo "Saindo..."
      sleep 1
      echo "Antes!"
      sleep 1
      echo "Visite meu blog: "https://edylimatutoriais.blogspot.com/""
      echo ""
    ;;
    *)
      echo -e "Erro: Opção inválida\n\n"
    ${0}
  ;;
esac
