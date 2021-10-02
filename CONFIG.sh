#!/usr/bin/env bash
#
# MEU SCRIPT PESSOAL.
# Este Shell-Script foi criado para uso pessoal,podendo tambem ser usado em qualquer distro baseada em Ubuntu. 
# (Edy Lima) Blog: https://edylimatutoriais.blogspot.com/
TIME=1
clear
while true;do
echo " "
echo "BEM VINDO AO $0 PARA UBUNTU!"
echo " "
echo "Escolha uma opção abaixo para começar!
      
      1 - Excluir Swap
      2 - Remover Snap
      3 - Configurar Desktop
      4 - Atualizar Sistema
      5 - Limpeza Sistema
      0 - Sair"
echo " "
echo -n "Opção escolhida: "
read opcao
case $opcao in
        1)
        echo Desativando e excluindo Swap....
              # Este comando irá desativar e excluir o Swapfile.
                sleep $TIME
                sudo sed -i.bak '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab && sudo swapoff -a && sudo rm -f -r /swapfile
                clear
                ;;
        2)
        echo Removendo Suporte ao Snap....
              # Este comando irá excluir todo suporte a Snap.
                sleep $TIME
                sudo apt install gnome-software -y
                sudo rm -rf /var/cache/snapd/
                sudo apt autoremove --purge snapd gnome-software-plugin-snap -y
                sudo rm -fr ~/snap
                clear
                ;;
        3)
        echo Configrando o Sistema...
                sleep $TIME
        echo Instalando Google Chrome....
              # Estes comandos irá baixar e instalar o google-chrome em seu desktop.
                wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                sudo dpkg -i google-chrome-stable_current_amd64.deb
                clear
        echo Adicionando PPA do inkscape....
              # Estes comandos instalam o Inkscape em seu desktop.
                sudo add-apt-repository ppa:inkscape.dev/stable -y
                sudo apt install inkscape -y
                clear
        echo Instalando AnyDesk....
              # Estes comandos instala o Anydessk em seu desktop.
                sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
                sudo echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
                sudo apt update && sudo apt install anydesk -y
              # Desabilita a inicialização do Anydesk com o sistema!.
                sudo systemctl disable anydesk.service
                clear
        echo Instalando Git-GgitHub....
              # Estes comandos instalam o Git-GitHub em seu desktop.
                sudo add-apt-repository ppa:git-core/ppa -y
                sudo apt install git -y
                clear 
        echo Instalando vs-code....
              # Estes comandos instalam o VS-Code em seu desktop.
                sudo apt install software-properties-common apt-transport-https wget -y
                wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
                sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
                sudo apt install code -y
                clear 
        echo Instalando OBS-Studio....
              # Estes comandos instala o OBS-Studio em seu desktop.
                sudo add-apt-repository ppa:obsproject/obs-studio -y
                sudo apt update && sudo apt install obs-studio -y
                clear
        echo instalando OpenShot....
              # Estes comandos instalam o Openshot em seu desktop.
                sudo add-apt-repository ppa:openshot.developers/libopenshot-daily -y
                sudo apt-get update && sudo apt-get install openshot-qt python3-openshot -y
                clear
        echo Atualizando LibreOffice....
              # Estes comandos atualiza o LibreOffice para a versão mais recente.
                sudo add-apt-repository -y ppa:libreoffice/ppa
                sudo apt-get update
                clear
        echo Ativando ExFat....
              # Estes comandos instalam o suporte a Exfat no Ubuntu.-desktop.
                sudo add-apt-repository universe -y
                sudo apt update && sudo apt install exfat-fuse exfat-utils -y
                clear
        echo Instalando programar adicionais...
              # Este comando instala alguns programas extras em seu desktop.
                sudo apt install htop neofetch mousepad blender gimp synaptic gufw testdisk glabels default-jre default-jdk -y
                sudo apt install git p7zip-full python3-pip python3-wxgtk4.0 grub2-common -y
                sudo apt install libgtk-3-dev git meson sassc -y
                clear
        echo Instalando codecs multimidias....
              # Este comando instala o Ubuntu-restricted-extra em seu desktop.
                sudo apt install ubuntu-restricted-extras -y
                sudo apt install ffmpeg libavcodec-extra -y
                clear
                ;;
        4)
        echo Instalando atualizações do Sistema...
              # Comandos para atualizar o Siatema Ubuntu.
                sudo apt update && sudo apt dist-upgrade -y
                clear
                ;;
        5)
        echo Limpando o Sistema aguarde....
                sleep $TIME
                sudo du -sh /var/cache/apt/archives/ 
                sudo rm -rf /var/tmp/*
                sudo rm -vfr ~/.thumbnails/normal/*
                sudo rm -f ~/.cache/thumbnails/normal/*
                sudo rm -rf ${HOME}/.local/share/Trash/* 
                sudo du -sh /var/cache/apt/archives/
                clear
        echo Removendo pacotes desnecessários do sistema....
                sudo apt autoremove -y
                sudo apt autoremove --purge -y
                clear
                ;;
        0)
        echo Saindo....
                sleep $TIME
                exit 0
                ;;
        *)
        echo Opção inválida, tente novamente!
                ;;
esac
done

