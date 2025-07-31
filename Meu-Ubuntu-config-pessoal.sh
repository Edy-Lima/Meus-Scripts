#!/usr/bin/env bash
# filepath: remover-snap.sh

echo "Removendo o Snap do Ubuntu..."

# Remove o snapd e todos os pacotes relacionados
echo "Parando e removendo o Snap..."
sudo systemctl stop snapd
sudo apt remove --purge snapd* -y
sudo apt autoremove -y

# Remove pastas residuais do snap
echo "Removendo pastas residuais do Snap..."
sudo rm -rf ~/snap -y
sudo rm -rf /snap -y
sudo rm -rf /var/snap -y
sudo rm -rf /var/lib/snapd -y
sudo rm -rf /var/cache/snapd -y
sudo apt remove --purge libreoffice* -y
sudo apt autoremove -y

# Instalação de programas e configurações pessoais
echo "Instalando programas e configurando o sistema..."
sudo apt update && sudo apt full-upgrade -y
# Instalação de programas essenciais
echo "Instalando programas essenciais..."
sudo apt install ubuntu-restricted-extras -y
sudo apt install git synaptic gdebi p7zip-full gnome-shell-extension-manager ffmpeg testdisk glabels gnome-tweaks steam gparted -y
# Instalação do suporte ao Flatpak
echo "Instalando suporte ao Flatpak..."
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# Configurando janelas do GNOME
echo "Configurando janelas do GNOME..."
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
# Configurando o github
echo "Configurando o GitHub..."
sudo apt update && sudo apt full-upgrade -y
git config --global user.name "Edy-Lima"
git config --global user.email edivaldolima603@gmail.com
sudo apt update && sudo apt full-upgrade -y
# Instalar o obs-studio 
echo "Instalando OBS Studio..."
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt update
sudo apt install obs-studio -y
# Instalar Google Chrome
echo "Instalando Google Chrome...."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get --fix-broken install -y
rm google-chrome-stable_current_amd64.deb
# Atualizar o sistema
echo "Atualizando o sistema..."
sudo apt update && sudo apt full-upgrade -y

echo "Configurações efetuadas com sucesso!"

# Reinicia o sistema para aplicar as mudança
echo "Reiniciando o sistema para aplicar as mudanças..."
sudo reboot


