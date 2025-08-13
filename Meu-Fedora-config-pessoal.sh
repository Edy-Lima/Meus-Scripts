#!/usr/bin/env bash
# filepath: Meu-Fedora-config-pessoal.sh

echo "Configurando o Fedora..."

# Atualiza o sistema
echo "Atualizando o sistema..."
sudo dnf upgrade --refresh -y

# Instalação de programas essenciais
echo "Instalando programas essenciais..."
sudo dnf install git gufw p7zip ffmpeg testdisk gparted neofetch gnome-tweaks steam -y

# Instalação do suporte ao Flatpak
echo "Instalando suporte ao Flatpak..."
sudo dnf install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Configurando janelas do GNOME
echo "Configurando janelas do GNOME..."
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'

# Configurando o GitHub
echo "Configurando o Git..."
git config --global user.name "Edy-Lima"
git config --global user.email edivaldolima603@gmail.com

# Instalar o OBS Studio
echo "Instalando OBS Studio..."
sudo dnf install obs-studio -y

# Instalar Google Chrome via Flatpak
echo "Instalando Google Chrome via Flatpak..."
flatpak install flathub com.google.Chrome -y

# Ativar suporte a exFAT
echo "Ativando suporte a exFAT..."
sudo dnf install exfatprogs ffmpeg -y

echo "Configurações efetuadas com sucesso!"

# Reinicia o sistema para aplicar as mudanças
echo "Reiniciando o sistema para aplicar as mudanças..."
sudo reboot
