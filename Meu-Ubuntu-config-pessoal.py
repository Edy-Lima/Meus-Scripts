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

def run(cmd, check=True, interativo=False):
    if interativo:
        resposta = input(f"\nDeseja executar o comando abaixo? [s/N]\n{cmd}\n> ").strip().lower()
        if resposta != "s":
            print("Comando ignorado pelo usuário.\n")
            return
    print(f"Executando: {cmd}")
    try:
        result = subprocess.run(cmd, shell=True, check=check, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        if result.stdout:
            print(result.stdout)
        if result.stderr:
            print(result.stderr, file=sys.stderr)
    except subprocess.CalledProcessError as e:
        print(f"Erro ao executar: {cmd}\n{e.stderr}", file=sys.stderr)
        if check:
            sys.exit(1)

def main():
    if os.geteuid() != 0:
        print(f"Este script precisa ser executado como root. Use: sudo {sys.argv[0]}")
        sys.exit(1)

    interativo = True

    print_banner()
    print("Removendo o Snap do Ubuntu...")

    run("systemctl stop snapd", check=False, interativo=interativo)
    run("apt remove --purge snapd* -y", interativo=interativo)
    run("apt autoremove -y", interativo=interativo)

    # Remover diretórios do snap do usuário e do sistema
    home_dir = os.environ.get("SUDO_USER")
    if home_dir:
        user_home = os.path.expanduser(f"~{home_dir}")
    else:
        user_home = os.path.expanduser("~")
    run(f"rm -rf {user_home}/snap", interativo=interativo)
    run("rm -rf /snap", interativo=interativo)
    run("rm -rf /var/snap", interativo=interativo)
    run("rm -rf /var/lib/snapd", interativo=interativo)
    run("rm -rf /var/cache/snapd", interativo=interativo)
    run("apt remove --purge libreoffice* -y", interativo=interativo)
    run("apt autoremove -y", interativo=interativo)

    print("Instalando programas e configurando o sistema...")
    run("apt update && apt full-upgrade -y", interativo=interativo)

    print("Instalando programas essenciais...")
    run("apt install ubuntu-restricted-extras -y", interativo=interativo)
    run("apt install git synaptic gdebi p7zip-full gnome-shell-extension-manager ffmpeg testdisk glabels gnome-tweaks steam gparted -y", interativo=interativo)

    print("Instalando suporte ao Flatpak...")
    run("apt install flatpak -y", interativo=interativo)
    run("apt install gnome-software-plugin-flatpak -y", interativo=interativo)
    run("flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo", interativo=interativo)

    print("Configurando janelas do GNOME...")
    run("gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'", check=False, interativo=interativo)

    print("Configurando o GitHub...")
    run('git config --global user.name "Edy-Lima"', check=False, interativo=interativo)
    run('git config --global user.email edivaldolima603@gmail.com', check=False, interativo=interativo)

    print("Instalando OBS Studio...")
    run("add-apt-repository ppa:obsproject/obs-studio -y", interativo=interativo)
    run("apt update", interativo=interativo)
    run("apt install obs-studio -y", interativo=interativo)

    print("Instalando Google Chrome....")
    run("wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb", interativo=interativo)
    run("dpkg -i google-chrome-stable_current_amd64.deb", check=False, interativo=interativo)
    run("apt-get --fix-broken install -y", interativo=interativo)
    run("rm -f google-chrome-stable_current_amd64.deb", interativo=interativo)

    print("Atualizando o sistema...")
    run("apt update && apt full-upgrade -y", interativo=interativo)

    print("Configurações efetuadas com sucesso!")
    print("Reiniciando o sistema para aplicar as mudanças...")
    run("reboot", check=False, interativo=interativo)

if __name__ == "__main__":
    main()