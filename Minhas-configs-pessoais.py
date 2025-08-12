import subprocess
import shutil
import sys
import os

def run(cmd, shell=True):
    print(f"Executando: {cmd}")
    subprocess.run(cmd, shell=shell, check=True)

def is_debian_or_ubuntu():
    if os.path.exists("/etc/os-release"):
        with open("/etc/os-release") as f:
            data = f.read().lower()
            if "ubuntu" in data or "debian" in data:
                return True
    return False

def main():
    if not shutil.which("apt") or not is_debian_or_ubuntu():
        print("Este script é compatível apenas com Ubuntu e Debian.")
        sys.exit(1)

    print("Detectado sistema Ubuntu/Debian.")

    # Remover Snap
    print("Removendo o Snap do Ubuntu/Debian...")
    run("sudo systemctl stop snapd")
    run("sudo apt remove --purge 'snapd*' -y")
    run("sudo apt autoremove -y")
    run("sudo rm -rf ~/snap /snap /var/snap /var/lib/snapd /var/cache/snapd")
    run("sudo apt remove --purge 'libreoffice*' -y")
    run("sudo apt autoremove -y")

    # Atualizar sistema
    print("Atualizando o sistema...")
    run("sudo apt update && sudo apt full-upgrade -y")

    # Instalar programas essenciais
    print("Instalando programas essenciais...")
    essentials = [
        "git", "gufw", "p7zip", "ffmpeg", "testdisk", "gparted", "neofetch",
        "ubuntu-restricted-extras", "synaptic", "gdebi", "gnome-shell-extension-manager",
        "glabels", "gnome-tweaks", "steam"
    ]
    run("sudo apt install " + " ".join(essentials) + " -y")

    # Instalar Flatpak
    print("Instalando suporte ao Flatpak...")
    run("sudo apt install flatpak gnome-software-plugin-flatpak -y")
    run("sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo")

    # Configurações GNOME (opcional, só se GNOME estiver presente)
    if shutil.which("gsettings"):
        print("Configurando janelas do GNOME...")
        run("gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'")

    # Configuração do Git
    print("Configurando o Git...")
    run("git config --global user.name 'Edy-Lima'")
    run("git config --global user.email edivaldolima603@gmail.com")

    # Instalar OBS Studio
    print("Instalando OBS Studio...")
    run("sudo add-apt-repository ppa:obsproject/obs-studio -y")
    run("sudo apt update")
    run("sudo apt install obs-studio -y")

    # Instalar VS Code (Flatpak)
    print("Instalando Visual Studio Code via Flatpak...")
    run("flatpak install flathub com.visualstudio.code -y")

    # Instalar Google Chrome (Flatpak)
    print("Instalando Google Chrome via Flatpak...")
    run("flatpak install flathub com.google.Chrome -y")

    # Ativar suporte a exFAT
    print("Ativando suporte a exFAT...")
    run("sudo apt install exfatprogs -y")

    print("Configurações efetuadas com sucesso!")
    print("Reinicie o sistema para aplicar as mudanças.")

if __name__ == "__main__":
    main()