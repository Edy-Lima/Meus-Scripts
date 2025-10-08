#!/usr/bin/env bash
# filepath: Meu-Ubuntu-config-pessoal.sh
# Este script é destinado a configurar o Ubuntu de acordo com as preferências pessoais do usuário.
# Ele remove o snapd e instala uma série de programas essenciais e adicionais, além de realizar
# algumas configurações específicas do sistema.
# Certifique-se de que você tem permissões de administrador para executar este script.
# Useo-o por sua conta e risco, pois ele remove o snapd e todos os pacotes relacionados, incluindo o LibreOffice.

echo "Iniciando o sscript..."
sleep 3
clear
#
# Remove o snapd e todos os pacotes relacionados
# Obs: Este comando remove o snap e todos os pacotes relacionados, incluindo o LibreOffice, faça por sua conta e risco.
echo "Certifique-se de que 
leu e analizou todos os comandos inclusos neste script antes de executá-lo."
sleep 5
clear
echo "Preparando para iniciar as configurações......." 
sleep 3
clear
# Esse comando ativa o Ubuntu pro
echo "Iniciando a ativação do Ubuntu pro"
sleep 3
     sudo apt update
     sudo apt install ubuntu-advantage-tools -y
clear
echo "Ativando o Ubuntu via token"
sleep 3
# Substitua <token> pelo seu token real do Ubuntu Pro
     sudo pro attach <token>
echo "Ubuntu pro ativado com sucesso"
clear      
# Solicita a senha de administrador para continuar
echo "Removendo o suporte ao Snap..."
sleep 3
      sudo systemctl stop snapd
      sudo apt remove --purge snapd -y
      sudo apt autoremove -y
clear
# Remove pastas residuais do snap
# obs: caso não queira remover as pastas residuais, comente as linhas abaixo incluinto ( # ) no começo da linha.
echo "Removendo pastas residuais do Snap..."
sleep 3
     sudo rm -rf /snap
     sudo rm -rf /var/snap
     sudo rm -rf /var/lib/snapd
     sudo rm -rf /var/cache/snapd
     sudo apt remove --purge snapd -y
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
     sudo apt install git gufw synaptic gdebi p7zip-full gnome-shell-extension-manager ffmpeg testdisk glabels gnome-tweaks gparted neofetch -y
     sudo apt install mesa-utils -y
     sudo apt install intel-opencl-icd intel-level-zero-gpu level-zero intel-media-va-driver-non-free libmfx1 -y
clear
# Instalação do suporte ao Flatpak
echo "Instalando suporte ao Flatpak..."
sleep 3
     sudo apt update
     sudo apt install flatpak -y
     sudo apt install gnome-software-plugin-flatpak -y
     sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
     sudo apt remove --purge snapd -y
     sudo apt autoremove -y
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
clear
# Instalar Google Chrome
echo "Instalando Google Chrome...."
sleep 3
     sudo apt update
     wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
     sudo dpkg -i google-chrome-stable_current_amd64.deb
     sudo apt-get --fix-broken install -y
     rm google-chrome-stable_current_amd64.deb
clear
# Instalaar o vscode
echo "Instalando Visual Studio Code..."
sleep 3
# Atualiza a lista de pacotes
     sudo apt update
# Instala dependências necessárias
     sudo apt install -y wget gpg
# Importa a chave GPG do repositório do VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
     sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
rm microsoft.gpg
# Adiciona o repositório do VS Code
echo "deb [arch=$(dpkg --print-architecture)] https://packages.microsoft.com/repos/code stable main" | \
     sudo tee /etc/apt/sources.list.d/vscode.list
# Atualiza a lista de pacotes novamente
     sudo apt update
# Instala o VS Code
     sudo apt install -y code
echo "Instalação do VS Code concluída!"
sleep 3
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
echo Instando gimp , openshot , inkscape , Obs-Studio , onlyoffice e shotcut via flatpak
sleep 3
     flatpak install flathub org.gimp.GIMP -y
     flatpak install flathub org.inkscape.Inkscape -y
     flatpak install flathub org.onlyoffice.desktopeditors -y
     flatpak install flathub org.shotcut.Shotcut -y  
     flatpak install flathub org.openshot.OpenShot -y
     flatpak install flathub com.discordapp.Discord -y
     flatpak install flathub com.obsproject.Studio -y
     flatpak install flathub com.valvesoftware.Steam -y
clear
echo "Atualização  geral do sistema..."
sleep 3
# Finaliza com uma atualização geral do sistema
     sudo apt update && sudo apt full-upgrade -y
     sudo apt remove --purge snapd -y
     sudo apt autoclean -y
     sudo apt autoremove -y   
clear
echo "configurações concluidas com sucesso!."
sleep 3
clear
echo "Reinicie o sistema para aplicar as mudanças..."
sleep 3
clear
# Reinicia o sistema para aplicar as mudança
echo "Reiniciando o sistema para aplicar as mudanças..."
sleep 5
    sudo reboot
# Fim do script


