#!/bin/bash
#
# Script pessoal (Meu-Desktop)
    echo "(Lista de programas)"
read -s -n1 -p "O que deseja instalar?
  (A)=Instalar Intel Graphics Driver     
  (B)=Instalar (Kisak-mesa) Driver       
  (C)=Instalar Google-Chrome             
  (D)=Instalar inkskape                  
  (E)=Instalar Cubic                     
  (F)=Instalar UNetbootin
  (G)=Instalar AnyDesk
  (H)=Instalar Git-GgitHub
  (I)=Instalar prelink e preload 
  (J)=Manual prelink
  (L)=Instalar compton
  (M)=Manual compton                
  (N)=Instalar vs-code
  (S)=Sair                               
Digite => " resposta                                                                 


case "${resposta}" in
  a|A|"")
    echo "( Instalando Intel Graphics Driver )"
    echo "Digite sua senha de usuário para continhar"
sudo add-apt-repository ppa: ubuntu-x-swat / intel-graphics-updates -y
sudo apt update && sudo apt upgrade -y     
  ;;

  b|B)
    echo "( Instalando Driver Kisak-mesa )"
    echo "Digite sua senha de usuário para continuar"
sudo add-apt-repository ppa:kisak/kisak-mesa -y
sudo apt update && sudo apt upgrade -y

  ;;
  c|C)
    echo "Instalando Gogle-Crome"
    echo "Digite sua senha de usuário para continuar"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
    
    ;;   
    d|D)
    echo "(Instalando inkskape)"
    echo "Digite sua senha de usuário para continuar"
sudo add-apt-repository ppa:inkscape.dev/stable -y
sudo apt update && sudo apt install inkscape -y

    ;;
    e|E)
    echo "(Instalando Cubic)"
    echo "Digite sua senha de usuário para continuar"
sudo add-apt-repository ppa:cubic-wizard/release -y
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E
sudo apt update && sudo apt install cubic curl -y

    ;;
    f|F)
    echo "(Instalando UNetbootin)"
    echo "Digite sua senha de usuário para continuar"
sudo add-apt-repository ppa:gezakovacs/ppa -y
sudo apt update && sudo apt install unetbootin -y

    ;;
    g|G)
    echo "(Instalando AnyDesk)"
    echo "Digite sua senha de usuário para continuar"
sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list 
    
    ;;
    h|H)
    echo "(Instalando Git-GgitHub)"
    echo "Digite sua senha de usuário para continuar"
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update && sudo apt install git -y  
   
    ;;
    i|I)
    echo "(Instalando prelink e preload)"
    echo "Digite sua senha de usuário para continuar"
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;
sudo apt install preload prelink -y

;;
j|J)
echo "(=> Manual pelinl <=)"
echo "
==============================================================================
configuração do Prelink:

sudo gedit /etc/default/prelink

Procure a linha:

PRELINKING=unknown

E mude para:

PRELINKING=yes

Agora execute o Prelink para que ele possa linkar as bibliotecas dos programas:

sudo /etc/cron.daily/prelink

==============================================================================
"
 
    ;;
    l|L)
    echo "(Instalando compton)"
    echo "Digite sua senha de usuário para continuar"
sudo apt install compton-conf -y 
      
    ;;
    m|M)
    echo "( Manual do Compton => copie e cole em um bloco de notas )"
echo ""

# onfigurando o Compton:

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
n|N)
   echo "(Instalando vs-code)"
   echo "Digite sua senha de usuário para continuar" 
sudo apt update
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code -y 
   
  ;;
  s|S)
    echo "Sair"
  ;;
  *)
    echo -e "Erro: Opção inválida\n\n"
    ${0}
  ;;
esac
