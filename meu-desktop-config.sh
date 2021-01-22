#!/bin/bash
#
#Script criado para deixar o Xubuntu do meu jeito! (Edy-Lima)
echo ""
   echo "(Primeiro vamos ativar o TRIM em seu SSD)"
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
sudo apt update && sudo apt install cubic curl -y
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
sleep 5
exit
