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
# Remove o snapd e todos os pacotes relacionados (se existir)
echo "Removendo o suporte ao Snap (se existir)..."
sleep 5
sudo dnf remove --assumeyes snapd
sudo rm -rf /snap /var/snap /var/lib/snapd /var/cache/snapd
sudo dnf autoremove --assumeyes
clear
# Instalação de programas essenciais
echo "Instalando programas essenciais..."
sleep 5
sudo dnf install --assumeyes @core @base gnome-tweaks gnome-extensions-app git gufw p7zip p7zip-plugins gparted neofetch mesa-dri-drivers intel-media-driver ffmpeg testdisk glabels
clear
# Instalação do Flatpak
echo "Instalando suporte ao Flatpak..."
sleep 5
sudo dnf install --assumeyes flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
clear
# Configurando janelas do GNOME
echo "Configurando janelas do GNOME..."
sleep 5
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
clear
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
# Ativar suporte a exFAT
echo "Ativando suporte a exFAT..."
sleep 5
sudo dnf install --assumeyes exfatprogs ffmpeg
clear
# Instala programas via Flatpak
echo "Instalando apps via Flatpak..."
sleep 5
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.inkscape.Inkscape -y
flatpak install flathub org.onlyoffice.desktopeditors -y
flatpak install flathub org.shotcut.Shotcut -y
flatpak install flathub org.openshot.OpenShot -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.obsproject.Studio -y
flatpak install flathub com.valvesoftware.Steam -y
clear
echo "Atualização e limpeza geral do sistema..."
sleep 5
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
sudo reboot
# Fim do script
