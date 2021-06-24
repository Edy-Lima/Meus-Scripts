#!/usr/bin/env bash
#
echo "Atualizando o sistema..."
  # Estes comandos atualiza o seu sistema Ubuntu.
    sudo apt update && sudo apt dist-upgrade -y
    clear
echo "Tudo pronto gora vamos começar..."
echo ""
echo "Removendo Swap-file..."
  # Este comando desativa e remove o Swap-file.
    sudo sed -i.bak '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab && sudo swapoff -a && sudo rm -f -r /swapfile
    clear
echo Swap removido!
echo "Removendo Snap..."
  # Este comando remove o suporte ao Snap.
    sudo apt remove --purge snapd gnome-software-pluguin-snap -y
    sudo rm -rf /var/cache/snapd
    sudo rm -rf ~/snap
    clear
echo "Removendo Libreoffice..."
  # Este comando remove todo o pacote Libreoffice.
    sudo apt remove --purge libreoffice*
    clear
echo "personalizar-gnome:"
  # Este comando instala alguns plugins.
    sudo apt install gnome-tweak-tool gnome-shell gnome-shell-plugins dconf-editor -y
    clear
echo "instalando google-chrome..."
  # Este comando vai baixar e instalar o google-chrome.
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt install -f -y
    clear
echo "Instalando prelink e preload..."
  # Este comando instala o prelink e o preload.
    sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;
    sudo apt install preload prelink -y
    clear
echo " instalando Git-GitHub..."
  # Este comando adiciona o PPA e instala o Git.
    sudo add-apt-repository ppa:git-core/ppa -y
    sudo apt update && sudo apt install git -y
    clear
echo "instalando Ubuntu-Mainline..."
  # Estes comandos adiciona o PPA e instala o mainline.
    sudo apt-add-repository -y ppa:cappelikan/ppa -y
    sudo apt update && sudo apt install mainline -y
    clear
echo "Instalando OBS-Studio..."
# Este comando adiciona o PPA e instala o OBS-Studio.
    sudo add-apt-repository ppa:obsproject/obs-studio -y
    sudo apt update && sudo apt install obs-studio -y
    clear
echo "Buscando atualizações e limpando o sistema..."
    sudo apt update && sudo apt full-upgrade -y
    sudo apt autoremove -y
    clear
echo "Tudo pronto!"           

