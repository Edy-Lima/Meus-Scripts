#!/usr/bin/env bash
# filepath: Meu-Ubuntu-config-pessoal.sh

echo "Iniciando as configurações..."
sleep 3
clear
#
# Remove o snapd e todos os pacotes relacionados
# Obs: Este comando remove o snap e todos os pacotes relacionados, incluindo o LibreOffice, faça por sua conta e risco.
echo "Certifique-se de qque leu e analizou todos os comandos deste script antes de executá-lo."
echo "Parando pa remover o Snap por favor digite a senha de administrador para começar..."
sleep 3
      sudo systemctl stop snapd
      sudo apt remove --purge snapd* -y
      sudo apt autoremove -y
clear

# Remove pastas residuais do snap
# obs: caso não queira remover as pastas residuais, comente as linhas abaixo incluinto ( # ) no começo da linha.
echo "Removendo pastas residuais do Snap..."
sleep 3
     sudo rm -rf /snap
     sudo rm -rf /var/snap -y
     sudo rm -rf /var/lib/snapd -y
     sudo rm -rf /var/cache/snapd -y
     sudo apt remove --purge libreoffice* -y
     sudo apt autoremove -y
clear

# Instalação de programas e configurações pessoais
echo "Instalando programas e configurando o sistema..."
sleep 3
     sudo apt update
clear
# Instalação de programas essenciais
echo "Instalando programas essenciais..."
sleep 3
     sudo apt install ubuntu-restricted-extras -y
clear
# Instalação de programas adicionais com base no Ubuntu.deb
echo "Instalando programas adicionais com base no Ubuntu.deb..."
sleep 3
     sudo apt install git gufw synaptic gdebi p7zip-full gnome-shell-extension-manager ffmpeg testdisk glabels gnome-tweaks steam gparted neofetch -y
clear
# Instalação do suporte ao Flatpak
echo "Instalando suporte ao Flatpak..."
sleep 3
     sudo apt update
     sudo apt install flatpak -y
     sudo apt install gnome-software-plugin-flatpak -y
     sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
clear
# Configurando janelas do GNOME essa configuração é para que o clique no dock minimize ou mostre as prévias das janelas.
echo "Configurando janelas do GNOME..."
sleep 3
     gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'   
clear
# Configurando o github, esse comando configura o usuário e o email do GitHub.
# Altere os valores de acordo com suas informações pessoais.
# Exemplo: git config --global user.name "Seu-Nome" e git config --global user.email "
echo "Configurando o GitHub..."
sleep 3
     sudo apt update
     git config --global user.name "Edy-Lima"
     git config --global user.email edivaldolima603@gmail.com
     sudo apt update
clear
# Instalar o obs-studio 
echo "Instalando OBS Studio..."
sleep 3
     sudo add-apt-repository ppa:obsproject/obs-studio -y
     sudo apt update
     sudo apt install obs-studio -y
clear
# Instalar Google Chrome
echo "Instalando Google Chrome...."
sleep 3
     wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
     sudo dpkg -i google-chrome-stable_current_amd64.deb
     sudo apt-get --fix-broken install -y
     rm google-chrome-stable_current_amd64.deb
clear
# Atualizar o sistema
echo "Atualizando o sistema..."
sleep 3
     sudo apt update 
clear
# Instalaar o vscode
echo "Instalando Visual Studio Code..."
sleep 3
     wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/microsoft.gpg
     sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
     sudo apt update
     sudo apt install code -y
clear
# Excluindo swap
# observação: O comando abaixo desativa e remove a partição de swap, o que pode não ser recomendado em todos os sistemas. Use com cautela.
# caso deseje manter a partição de swap, comente as linhas abaixo.
echo "Desativando e removendo a partição de swap..."
sleep 3
     sudo systemctl stop swap.img.swap
     sudo systemctl mask swap.img.swap
clear
# Ativar suporte a exFAT
echo "Ativando suporte a exFAT..."
sleep 3
     sudo apt update
     sudo apt install exfatprogs ffmpeg -y
clear
# Instala esses programas via Flatpak
echo Instando gimp , openshot , inkscape , onlyoffice e shotcut via flatpak
sleep 3
     flatpak install flathub org.gimp.GIMP -y
     flatpak install flathub org.inkscape.Inkscape -y
     flatpak install flathub org.onlyoffice.desktopeditors -y
     flatpak install flathub org.shotcut.Shotcut -y  
     flatpak install flathub org.openshot.OpenShot -y
clear
echo "Atualização  geral do sistema..."
sleep 3
# Finaliza com uma atualização geral do sistema
     sudo apt update && sudo apt full-upgrade -y
clear
echo "configurações concluidas com sucesso!."
sleep 3
clear
echo "Reibiciando o sistema para aplicar as mudanças..."

# Reinicia o sistema para aplicar as mudança
#echo "Reiniciando o sistema para aplicar as mudanças..."
     #sudo reboot
# Fim do script


