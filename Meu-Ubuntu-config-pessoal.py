#!/usr/bin/env python3
import subprocess
import os
import sys

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

def run(cmd, check=True):
    print(f"Executando: {cmd}")
    try:
        subprocess.run(cmd, shell=True, check=check)
    except subprocess.CalledProcessError as e:
        print(f"Erro ao executar: {cmd}\n{e}")
        if check:
            sys.exit(1)

def main():
    if os.geteuid() != 0:
        print("Este script precisa ser executado como root. Use: sudo python3 Meu-Ubuntu-config-pessoal.py")
        sys.exit(1)

    print_banner()
    print("Removendo o Snap do Ubuntu...")

    # Remove o snapd e todos os pacotes relacionados
    run("systemctl stop snapd", check=False)
    run("apt remove --purge snapd* -y")
    run("apt autoremove -y")

    # Remove pastas residuais do snap
    run("rm -rf /home/$SUDO_USER/snap")
    run("rm -rf /snap")
    run("rm -rf /var/snap")
    run("rm -rf /var/lib/snapd")
    run("rm -rf /var/cache/snapd")
    run("apt remove --purge libreoffice* -y")
    run("apt autoremove -y")

    # Instalação de programas e configurações pessoais
    print("Instalando programas e configurando o sistema...")
    run("apt update && apt full-upgrade -y")

    # Instalação de programas essenciais
    print("Instalando programas essenciais...")
    run("apt install ubuntu-restricted-extras -y")
    run("apt install git synaptic gdebi p7zip-full gnome-shell-extension-manager ffmpeg testdisk glabels gnome-tweaks steam gparted -y")

    # Instalação do suporte ao Flatpak
    print("Instalando suporte ao Flatpak...")
    run("apt install flatpak -y")
    run("apt install gnome-software-plugin-flatpak -y")
    run("flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo")

    # Configurando janelas do GNOME
    print("Configurando janelas do GNOME...")
    run("gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'", check=False)

    # Configurando o GitHub
    print("Configurando o GitHub...")
    run('git config --global user.name "Edy-Lima"', check=False)
    run('git config --global user.email edivaldolima603@gmail.com', check=False)

    # Instalar o obs-studio
    print("Instalando OBS Studio...")
    run("add-apt-repository ppa:obsproject/obs-studio -y")
    run("apt update")
    run("apt install obs-studio -y")

    # Instalar Google Chrome
    print("Instalando Google Chrome....")
    run("wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb")
    run("dpkg -i google-chrome-stable_current_amd64.deb", check=False)
    run("apt-get --fix-broken install -y")
    run("rm -f google-chrome-stable_current_amd64.deb")

    # Atualizar o sistema
    print("Atualizando o sistema...")
    run("apt update && apt full-upgrade -y")

    print("Configurações efetuadas com sucesso!")

    # Reinicia o sistema para aplicar as mudanças
    print("Reiniciando o sistema para aplicar as mudanças...")
    run("reboot", check=False)

if __name__ == "__main__":
    main()