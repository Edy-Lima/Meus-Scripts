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
sudo systemctl disable zram-swap.service -y
sudo dnf remove zram-generator-defaults -y
clear
echo "Zram e swap desabilitados."
sleep 5
echo "instalando fontes Microsoft..."
sleep 5
sudo dnf install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm -y
# Configurando o GitHub
echo "Configurando o GitHub..."
sleep 5
git config --global user.name "Edy-Lima"
git config --global user.email edivaldolima603@gmail.com
clear
# Instalar Google Chrome
echo "Instalando Google Chrome..."
sleep 5
sudo dnf install --assumeyes wget
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf install --assumeyes ./google-chrome-stable_current_x86_64.rpm
rm google-chrome-stable_current_x86_64.rpm
clear
# Instalar Visual Studio Code
echo "Instalando Visual Studio Code..."
sleep 5
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo
sudo dnf check-update
sudo dnf install --assumeyes code
clear
# Instala programas via Flatpak
echo "Instalando apps via Flatpak..."
sleep 5
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.inkscape.Inkscape -y
flatpak install flathub org.onlyoffice.desktopeditors -y
flatpak install flathub org.shotcut.Shotcut -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.obsproject.Studio -y
flatpak install flathub com.valvesoftware.Steam -y
flatpak install flathub io.github.flattool.Warehouse -y

clear
echo "Atualização e limpeza geral do sistema..."
sleep 5
sudo dnf5 upgrade --refresh -y
sudo flatpak upgrade -y
sudo dnf upgrade --assumeyes
sudo dnf autoremove --assumeyes
sudo dnf clean all
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
