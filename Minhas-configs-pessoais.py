import subprocess
import shutil
import sys
import os

def run(cmd, shell=True):
    print(f"Executando: {cmd}")
    subprocess.run(cmd, shell=shell, check=True)

def detect_distro():
    if os.path.exists("/etc/os-release"):
        with open("/etc/os-release") as f:
            data = f.read().lower()
            if "ubuntu" in data:
                return "ubuntu"
            elif "fedora" in data:
                return "fedora"
    return None

def main():
    distro = detect_distro()
    if distro not in ["ubuntu", "fedora"]:
        print("Este script é compatível apenas com Ubuntu e Fedora.")
        sys.exit(1)

    print(f"Detectado sistema: {distro.capitalize()}.")

    if distro == "ubuntu":
        # Remover Snap
        print("Removendo o Snap do Ubuntu...")
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

        # Instalar OBS Studio
        print("Instalando OBS Studio...")
        run("sudo add-apt-repository ppa:obsproject/obs-studio -y")
        run("sudo apt update")
        run("sudo apt install obs-studio -y")

        # Ativar suporte a exFAT
        print("Ativando suporte a exFAT...")
        run("sudo apt install exfatprogs -y")

    elif distro == "fedora":
        # Atualizar sistema
        print("Atualizando o sistema...")
        run("sudo dnf upgrade --refresh -y")

        # Instalar programas essenciais
        print("Instalando programas essenciais...")
        essentials = [
            "git", "gufw", "p7zip", "ffmpeg", "testdisk", "gparted", "neofetch",
            "gnome-tweaks", "steam"
        ]
        run("sudo dnf install " + " ".join(essentials) + " -y")

        # Instalar Flatpak
        print("Instalando suporte ao Flatpak...")
        run("sudo dnf install flatpak -y")
        run("sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo")

        # Instalar OBS Studio
        print("Instalando OBS Studio...")
        run("sudo dnf install obs-studio -y")

        # Ativar suporte a exFAT
        print("Ativando suporte a exFAT...")
        run("sudo dnf install exfatprogs -y")

    # Configurações GNOME (opcional, só se GNOME estiver presente)
    if shutil.which("gsettings"):
        print("Configurando janelas do GNOME...")
        run("gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'")

    # Configuração do Git
    print("Configurando o Git...")
    run("git config --global user.name 'Edy-Lima'")
    run("git config --global user.email edivaldolima603@gmail.com")

    # Instalar VS Code (Flatpak)
    print("Instalando Visual Studio Code via Flatpak...")
    run("flatpak install flathub com.visualstudio.code -y")

    # Instalar Google Chrome (Flatpak)
    print("Instalando Google Chrome via Flatpak...")
    run("flatpak install flathub com.google.Chrome -y")

    print("Configurações efetuadas com sucesso!")
    print("Reinicie o sistema para aplicar as mudanças.")

if __name__ == "__main__":
    main()