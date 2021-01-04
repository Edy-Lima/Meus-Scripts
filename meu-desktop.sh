#!/bin/bash

#Meu-Desktop
echo "Lista de programas"
read -s -n1 -p "O que deseja instalar?
  (1)=Instalar Intel Graphics Driver     (7)=Instalar AnyDesk
  (2)=Instalar (Kisak-mesa) Driver       (8)=Instalar Git-GgitHub
  (3)=Instalar Google-Chrome             (9)=Instalar prelink e preload
  (4)=Instalar inkskape                  (0)=Instalar compton
  (5)=Instalar Cubic                     (A)=Atualizar LibreOffice
  (6)=Instalar UNetbootin                (M)=Manual do Compton
  (S)=Sair                               
Digite => " resposta                                                                 


case "${resposta}" in
  1|1|"")
    echo "( Instalando Intel Graphics Driver )"
    echo "Digite sua senha de usuário para continhar"
sudo add-apt-repository ppa: ubuntu-x-swat / intel-graphics-updates -y
sudo apt update && sudo apt upgrade -y     
  ;;

  2|2)
    echo "( Instalando Driver Kisak-mesa )"
    echo "Digite sua senha de usuário para continuar"
sudo apt-add-repository ppa:kisak/kisak-mesa -y
sudo apt update && sudo apt upgrade -y

  ;;
  3|3)
    echo "Instalando Gogle-Crome"
    echo "Digite sua senha de usuário para continuar"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
    
    ;;   
    4|4)
    echo "(Instalando inkskape)"
    echo "Digite sua senha de usuário para continuar"
sudo add-apt-repository ppa:inkscape.dev/stable -y
sudo apt update && sudo apt install inkscape -y

    ;;
    5|5)
    echo "(Instalando Cubic)"
    echo "Digite sua senha de usuário para continuar"
sudo apt-add-repository ppa:cubic-wizard/release -y
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E
sudo apt update && sudo apt install cubic curl -y

    ;;
    6|6)
    echo "(Instalando UNetbootin)"
    echo "Digite sua senha de usuário para continuar"
sudo add-apt-repository ppa:gezakovacs/ppa -y
sudo apt update && sudo apt install unetbootin -y

    ;;
    7|7)
    echo "(Instalando AnyDesk)"
    echo "Digite sua senha de usuário para continuar"
sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list 
    
    ;;
    8|8)
    echo "(Instalando Git-GgitHub)"
    echo "Digite sua senha de usuário para continuar"
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update && sudo apt install git -y  
   
    ;;
    9|9)
    echo "(Instalando prelink e preload)"
    echo "Digite sua senha de usuário para continuar"
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;
sudo apt install preload prelink -y
 
    ;;
    0|0)
    echo "(Instalando compton)"
    echo "Digite sua senha de usuário para continuar"
sudo apt install compton-conf -y 
    
    ;;
    a|A)
    echo "(Atualizando LibreOffice)"
    echo "Digite sua senha de usuário para continuar"
sudo apt upgrade libreoffice -y
    
    ;;
    m|M)
    echo "( Manual do Compton => copie e cole em um bloco de notas )"
echo ""
echo ""

#Configurando o Compton:

echo "Crie o arquivo local no seu /home:

sudo touch ~/.compton.conf

Agora crie o arquivo ( composite.desktop ) com seu Editor de Texto Preferido:

sudo gedit composite.desktop

E cole o testo abaixo:


[Desktop Entry]
Name=Composite
Comment=Composite
Exec=compton --backend glx --paint-on-overlay --glx-no-stencil --vsync opengl-swc --shadow-exclude "! name~=''" --config ~/.compton.conf -b
Terminal=false
Type=Application



Agora rode os comandos abaixo, na ordem:


sudo chown root.root composite.desktop
sudo chmod 644 composite.desktop
sudo mv composite.desktop /etc/xdg/autostart


Reinicie o PC e pronto."  
   
  ;;
  s|S)
    echo "Sair"
  ;;
  *)
    echo -e "Erro: Opção inválida\n\n"
    ${0}
  ;;
esac
