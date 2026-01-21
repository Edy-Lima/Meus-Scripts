#!/usr/bin/env bash
# filepath: Meu-Fedora42-config-pessoal.sh
# Este script é destinado a configurar o Fedora 42 de acordo com as preferências pessoais do usuário.
# Ele remove o snapd (se existir) e instala uma série de programas essenciais e adicionais, além de realizar
# algumas configurações específicas do sistema.
# Certifique-se de que você tem permissões de administrador para executar este script.
# Use-o por sua conta e risco.

echo "Iniciando o script para Fedora 42..."
sleep 5
clear
echo Desabilitar Zram e swap.
sleep 5
sudo swapoff -a
sudo systemctl disable zram-swap.service
sudo dnf remove zram-generator-defaults --assumeyes
clear
echo "Zram e swap desabilitados."
sleep 5
# Adiciona repositório flathub!
echo "Adicionando repositório Flathub..."
sleep 5
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
clear
echo "Repositório Flathub adicionado."
sleep 5
clear
# Configura o GitHub!
echo "Configurando o GitHub..."
sleep 5
git config --global user.name "Edy-Lima"
git config --global user.email edivaldolima603@gmail.com
clear
# Instalar Google Chrome!
echo "Instalando Google Chrome..."
sleep 5
sudo dnf install --assumeyes wget
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf install --assumeyes ./google-chrome-stable_current_x86_64.rpm
rm google-chrome-stable_current_x86_64.rpm
clear
# Instalar Visual Studio Code!
echo "Instalando Visual Studio Code..."
sleep 5
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo
sudo dnf check-update
sudo dnf install --assumeyes code
clear
# Instala programas via Flatpak!
echo "Instalando apps via Flatpak..."
sleep 5
flatpak upgrade -y
flatpak install -y flathub org.gimp.GIMP
flatpak install -y flathub org.inkscape.Inkscape
flatpak install -y flathub org.onlyoffice.desktopeditors
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub org.freedownloadmanager.Manager
clear
# Instala programas via dnf5
echo "Instalando programas via DNF 5..."
sleep 5
sudo dnf5 up --refresh -y
sudo dnf5 install -y steam
sudo dnf5 install -y shotcut
sudo dnf5 install -y glabels
sudo dnf5 install -y gnome-tweaks
sudo dnf5 install -y gnome-extensions-app
sudo dnf5 install -y gnome-shell-extension-dash-to-dock
sudo dnf5 install -y gnome-shell-extension-user-themes
sudo dnf5 install -y gnome-shell-extension-compact-top-bar
sudo dnf5 install -y gnome-shell-extension-blur-my-shell
sudo dnf5 install -y gnome-shell-extension-gsconnect
sudo dnf5 install -y fastfetch
sudo dnf5 install -y curl
sudo dnf5 install -y gparted
sudo dnf5 install -y fuse fuse-libs
clear
echo "Atualização e limpeza geral do sistema..."
sleep 5
sudo dnf5 up --refresh -y
sudo dnf5 upgrade --assumeyes
sudo dnf5 autoremove --assumeyes
sudo dnf5 clean all
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
clear
echo "Configurações concluídas com sucesso!"
sleep 5
clear
echo "Reinicie o sistema para aplicar as mudanças..."
sleep 5
clear
echo "Reiniciando o sistema para aplicar as mudanças..."
sleep 5
sudo systemctl reboot
# Fim do script