#!/usr/bin/env bash
# filepath: remover-snap.sh

echo "Removendo o Snap do Ubuntu..."

# Remove o snapd e todos os pacotes relacionados
echo "Parando e removendo o Snap..."
      sudo systemctl stop snapd
      sudo apt remove --purge 'snapd*' -y
      sudo apt autoremove -y

# Remove pastas residuais do snap
# obs: caso não queira remover as pastas residuais, comente as linhas abaixo
echo "Removendo pastas residuais do Snap..."
     sudo rm -rf /snap
     sudo rm -rf /var/snap -y
     sudo rm -rf /var/lib/snapd -y
     sudo rm -rf /var/cache/snapd -y
     sudo apt remove --purge libreoffice* -y
     sudo apt autoremove -y

# Instalação de programas e configurações pessoais
echo "Instalando programas e configurando o sistema..."
     sudo apt update
# Instalação de programas essenciais
echo "Instalando programas essenciais..."
     sudo apt install ubuntu-restricted-extras -y
# Instalação de programas adicionais
echo "Instalando programas adicionais..."
     sudo apt install git gufw synaptic gdebi p7zip-full gnome-shell-extension-manager ffmpeg testdisk glabels gnome-tweaks steam gparted neofetch -y
# Instalação do suporte ao Flatpak
echo "Instalando suporte ao Flatpak..."
     sudo apt update
     sudo apt install flatpak -y
     sudo apt install gnome-software-plugin-flatpak -y
     sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# Configurando janelas do GNOME
echo "Configurando janelas do GNOME..."
     gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
# Configurando o github
echo "Configurando o GitHub..."
     sudo apt update
     git config --global user.name "-----"
     git config --global user.email "-----"
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
     sudo apt update 
# Instalaar o vscode
echo "Instalando Visual Studio Code..."
     wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/microsoft.gpg
     sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
     sudo apt update
     sudo apt install code -y
# Excluindo swap
# observação: O comando abaixo desativa e remove a partição de swap, o que pode não ser recomendado em todos os sistemas. Use com cautela.
# caso deseje manter a partição de swap, comente as linhas abaixo.
echo "Desativando e removendo a partição de swap..."
     sudo systemctl stop swap.img.swap
     sudo systemctl mask swap.img.swap
# Ativar suporte a exFAT
echo "Ativando suporte a exFAT..."
     sudo apt update
     sudo apt install exfatprogs ffmpeg -y
# Instala esses programas via Flatpak
echo Instando gimp , inkscape , onlyoffice e shotcut via flatpak
     flatpak install flathub org.gimp.GIMP -y
     flatpak install flathub org.inkscape.Inkscape -y
     flatpak install flathub org.onlyoffice.desktopeditors -y
     flatpak install flathub org.shotcut.Shotcut -y  
echo "Atualização  geral do sistema..."
# Finaliza com uma atualização geral do sistema
     sudo apt update && sudo apt full-upgrade -y
echo "Reinicie o computador para aplicar todas as mudanças."

# Reinicia o sistema para aplicar as mudança
#echo "Reiniciando o sistema para aplicar as mudanças..."
     #sudo reboot
# Fim do script


