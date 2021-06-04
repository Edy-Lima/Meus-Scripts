#!/usr/bin/env bash
#
echo "Atualizar o sistema:"
    sudo apt update && sudo apt dist-upgrade -y
echo "Removendo Snap"
  # Este comando remove o suporte ao Snap.
    sudo apt remove --purge snapd gnome-software-pluguin-snap -y
    sudo rm -rf /var/cache/snapd
    sudo rm -rf ~/snap
echo "Removendo Libreoffice"
  # Este comando remove todo o pacote Libreoffice.
    sudo apt remove --purge libreoffice*
echo "personalizar-gnome:"
  # Este comando instala alguns plugins.
    sudo apt install gnome-tweak-tool gnome-shell gnome-shell-extension dconf-editor -y
echo "instalando Kdenlive"
  # Este comando adiciona o PPA e instala o Kdenlive.
    sudo add-apt-repository ppa: kdenlive / kdenlive-stable -y
    sudo apt update && sudo apt install kdenlive -y
echo "Instalar tema Dark do Kdenlive:"
  # Este comando instala o tema breeeze no Kdenlive
    sudo apt install kde-style-breeze -y
echo "instalando google-chrome"
  # Este comando vai baixar e instalar o google-chrome.
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt install -f -y
echo "Instalando prelink e preload..."
  # Este comando instala o prelink e o preload.
    sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;
    sudo apt install preload prelink -y
echo " instalando Git-GitHub"
  # Este comando adiciona o PPA e instala o Git.
    sudo add-apt-repository ppa:git-core/ppa -y
    sudo apt update && sudo apt install git -y
echo "Instalando vs-code..."
  # Estes comandos instala o vs-code.
    sudo apt install software-properties-common apt-transport-https wget -y
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update && sudo apt install code -y
echo "instalando Mainline..."
  # Estes comandos adiciona o PPA e instala o mainline.
    sudo apt-add-repository -y ppa:cappelikan/ppa
    sudo apt update && sudo apt install mainline -y
    clear
echo "Buscando e instalando atualizações..."
    sudo apt update && sudo apt dist-upgrade -y
    clear
echo "Tudo pronto!"           

