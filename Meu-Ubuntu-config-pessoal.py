#!/usr/bin/env python3
import os

def print_banner():
    ORANGE = "\033[38;5;208m"
    WHITE = "\033[97m"
    RESET = "\033[0m"
    print(ORANGE + "="*60 + RESET)
    print(ORANGE + "        MEU UBUNTU CONFIG PESSOAL - by Edy Lima" + RESET)
    print(ORANGE + "="*60 + RESET)
    print(WHITE + r"""
           .-/+oossssoo+/-.           
       `:+ssssssssssssssssss+:`       
     -+ssssssssssssssssssyyssss+-     
   .ossssssssssssssssssdMMMNysssso.   
  /ssssssssssshdmmNNmmyNMMMMhssssss/  
 +ssssssssshmydMMMMMMMNddddyssssssss+ 
/sssssssshNMMMyhhyyyyhmNMMMNhssssssss/
.ssssssssdMMMNhsssssssssshNMMMdsssssss.
+sssshhhyNMMNyssssssssssssyNMMMysssssss+
ossyNMMMNyMMhsssssssssssssshmmmhssssssso
ossyNMMMNyMMhsssssssssssssshmmmhssssssso
+sssshhhyNMMNyssssssssssssyNMMMysssssss+
.ssssssssdMMMNhsssssssssshNMMMdsssssss.
 /sssssssshNMMMyhhyyyyhdNMMMNhssssssss/
  +sssssssssdmydMMMMMMMMddddyssssssss+ 
   /ssssssssssshdmNNNNmyNMMMMhssssss/  
    .ossssssssssssssssssdMMMNysssso.   
      -+sssssssssssssssssyyyssss+-     
        `:+ssssssssssssssssss+:`       
            .-/+oossssoo+/-.
""" + RESET)
    print(ORANGE + "="*60 + RESET)

def run(cmd):
    print(f"Executando: {cmd}")
    os.system(cmd)

def main():
    print_banner()
    print("Removendo o Snap do Ubuntu...")

    # Remove o snapd e todos os pacotes relacionados
    run("sudo systemctl stop snapd")
    run("sudo apt remove --purge snapd* -y")
    run("sudo apt autoremove -y")

    # Remove pastas residuais do snap
    run("sudo rm -rf ~/snap")
    run("sudo rm -rf /snap")
    run("sudo rm -rf /var/snap")
    run("sudo rm -rf /var/lib/snapd")
    run("sudo rm -rf /var/cache/snapd")
    run("sudo apt remove --purge libreoffice* -y")
    run("sudo apt autoremove -y")

    # Instalação de programas e configurações pessoais
    print("Instalando programas e configurando o sistema...")
    run("sudo apt update && sudo apt full-upgrade -y")

    # Instalação de programas essenciais
    print("Instalando programas essenciais...")
    run("sudo apt install ubuntu-restricted-extras -y")
    run("sudo apt install git synaptic gdebi p7zip-full gnome-shell-extension-manager ffmpeg testdisk glabels gnome-tweaks steam gparted -y")

    # Instalação do suporte ao Flatpak
    print("Instalando suporte ao Flatpak...")
    run("sudo apt install flatpak -y")
    run("sudo apt install gnome-software-plugin-flatpak -y")
    run("sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo")

    # Configurando janelas do GNOME
    print("Configurando janelas do GNOME...")
    run("gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'")

    # Configurando o GitHub
    print("Configurando o GitHub...")
    run("sudo apt update && sudo apt full-upgrade -y")
    run('git config --global user.name "Edy-Lima"')
    run('git config --global user.email edivaldolima603@gmail.com')
    run("sudo apt update && sudo apt full-upgrade -y")

    # Instalar o obs-studio
    print("Instalando OBS Studio...")
    run("sudo add-apt-repository ppa:obsproject/obs-studio -y")
    run("sudo apt update")
    run("sudo apt install obs-studio -y")

    # Instalar Google Chrome
    print("Instalando Google Chrome....")
    run("wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb")
    run("sudo dpkg -i google-chrome-stable_current_amd64.deb")
    run("sudo apt-get --fix-broken install -y")
    run("rm google-chrome-stable_current_amd64.deb")

    # Atualizar o sistema
    print("Atualizando o sistema...")
    run("sudo apt update && sudo apt full-upgrade -y")

    print("Configurações efetuadas com sucesso!")

    # Reinicia o sistema para aplicar as mudanças
    print("Reiniciando o sistema para aplicar as mudanças...")
    run("sudo reboot")

if __name__ == "__main__":
    main()