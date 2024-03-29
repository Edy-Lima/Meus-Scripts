#!/usr/bin/env bash
#
# MEU SCRIPT PESSOAL.
# Este Shell-Script foi criado para uso pessoal,podendo tambem ser usado em qualquer distro baseada em Ubuntu. 
# (Edy Lima) Blog: https://edylimatutoriais.blogspot.com/
TIME=2
clear
while true;do
echo " "
echo "Bem Vindo ao $0 Para Ubuntu!"
echo " "
echo "Escolha uma opção abaixo para começar!
      
      1 - Remover Swap-file
      2 - Remover suporte Snap
      3 - Configurar Desktop
      4 - Atualizar Sistema
      5 - Limpeza do Sistema
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
        echo instalando inkscape....
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
                wget https://az764295.vo.msecnd.net/stable/6cba118ac49a1b88332f312a8f67186f7f3c1643/code_1.61.2-1634656828_amd64.deb
                sudo dpkg -i code_1.61.2-1634656828_amd64.deb
                clear 
        echo Instalando OBS-Studio....
              # Estes comandos instala o OBS-Studio em seu desktop.
                sudo add-apt-repository ppa:obsproject/obs-studio -y
                sudo apt update && sudo apt install obs-studio -y
                clear
        echo instalando OpenShot....
              # Estes comandos instalam o Openshot em seu desktop.
                sudo add-apt-repository ppa:openshot.developers/libopenshot-daily -y
                sudo apt update && sudo apt install openshot-qt python3-openshot -y
                clear
        echo Atualizando LibreOffice....
              # Este comando remove o libreoffice antigo do sistema.
                sudo apt remove --purge libreoffice* -y
              # Estes comandos instala o LibreOffice para a versão mais recente.
                sudo add-apt-repository -y ppa:libreoffice/ppa
                sudo apt update && sudo apt install libreoffice -y
                clear
        echo Ativando ExFat....
              # Estes comandos instalam o suporte a Exfat no Ubuntu.-desktop.
                sudo add-apt-repository universe -y
                sudo apt update && sudo apt install exfat-fuse exfat-utils -y
                clear
        echo Instalando programar adicionais...
              # Este comando instala alguns programas extras em seu desktop.
                sudo apt install htop neofetch mousepad qbittorrent blender gimp synaptic gufw testdisk glabels default-jre gnome-tweak-tool dconf-editor -y
                sudo apt install stacer git p7zip-full python3-pip python3-wxgtk4.0 grub2-common -y
                sudo apt install libgtk-3-dev git meson sassc -y
                sudo apt remove thunderbird* -y
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
                sudo rm -rf /var/tmp/*
                sudo rm -vfr ~/.thumbnails/normal/*
                sudo rm -f ~/.cache/thumbnails/normal/*
                sudo rm -rf ${HOME}/.local/share/Trash/* 
                clear
        echo Removendo pacotes desnecessários do sistema....
                sudo apt autoremove -y
                sudo apt autoclean -y
                sudo apt clean -y
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

