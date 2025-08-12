import subprocess
import platform
import shutil
import sys

def run(cmd, shell=True):
    print(f"Executando: {cmd}")
    subprocess.run(cmd, shell=shell, check=True)

def detect_package_manager():
    if shutil.which("apt"):
        return "apt"
    elif shutil.which("dnf"):
        return "dnf"
    elif shutil.which("yum"):
        return "yum"
    elif shutil.which("zypper"):
        return "zypper"
    elif shutil.which("pacman"):
        return "pacman"
    else:
        print("Gerenciador de pacotes não suportado.")
        sys.exit(1)

def main():
    distro = platform.linux_distribution()[0].lower() if hasattr(platform, "linux_distribution") else ""
    pkg = detect_package_manager()

    print(f"Detectado gerenciador de pacotes: {pkg}")

    # Remover Snap (apenas Ubuntu/Debian)
    if pkg == "apt":
        print("Removendo o Snap do Ubuntu/Debian...")
        run("sudo systemctl stop snapd")
        run("sudo apt remove --purge 'snapd*' -y")
        run("sudo apt autoremove -y")
        run("sudo rm -rf ~/snap /snap /var/snap /var/lib/snapd /var/cache/snapd")
        run("sudo apt remove --purge 'libreoffice*' -y")
        run("sudo apt autoremove -y")

    # Atualizar sistema
    print("Atualizando o sistema...")
    if pkg == "apt":
        run("sudo apt update && sudo apt full-upgrade -y")
    elif pkg == "dnf":
        run("sudo dnf upgrade --refresh -y")
    elif pkg == "yum":
        run("sudo yum update -y")
    elif pkg == "zypper":
        run("sudo zypper refresh && sudo zypper update -y")
    elif pkg == "pacman":
        run("sudo pacman -Syu --noconfirm")

    # Instalar programas essenciais (exemplo para cada gerenciador)
    print("Instalando programas essenciais...")
    essentials = [
        "git", "gufw", "p7zip", "ffmpeg", "testdisk", "gparted", "neofetch"
    ]
    if pkg == "apt":
        run("sudo apt install ubuntu-restricted-extras synaptic gdebi gnome-shell-extension-manager glabels gnome-tweaks steam " + " ".join(essentials) + " -y")
    elif pkg == "dnf":
        run("sudo dnf install " + " ".join(essentials) + " -y")
    elif pkg == "yum":
        run("sudo yum install " + " ".join(essentials) + " -y")
    elif pkg == "zypper":
        run("sudo zypper install " + " ".join(essentials) + " -y")
    elif pkg == "pacman":
        run("sudo pacman -S --noconfirm " + " ".join(essentials))

    # Instalar Flatpak
    print("Instalando suporte ao Flatpak...")
    if pkg == "apt":
        run("sudo apt install flatpak gnome-software-plugin-flatpak -y")
    elif pkg == "dnf":
        run("sudo dnf install flatpak -y")
    elif pkg == "yum":
        run("sudo yum install flatpak -y")
    elif pkg == "zypper":
        run("sudo zypper install flatpak -y")
    elif pkg == "pacman":
        run("sudo pacman -S --noconfirm flatpak")
    run("sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo")

    # Configurações GNOME (opcional, só se GNOME estiver presente)
    if shutil.which("gsettings"):
        print("Configurando janelas do GNOME...")
        run("gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'")

    # Configuração do Git
    print("Configurando o Git...")
    run("git config --global user.name 'Edy-Lima'")
    run("git config --global user.email edivaldolima603@gmail.com")

    # Instalar OBS Studio (exemplo para apt/dnf/pacman)
    print("Instalando OBS Studio...")
    if pkg == "apt":
        run("sudo add-apt-repository ppa:obsproject/obs-studio -y")
        run("sudo apt update")
        run("sudo apt install obs-studio -y")
    elif pkg == "dnf":
        run("sudo dnf install obs-studio -y")
    elif pkg == "yum":
        run("sudo yum install obs-studio -y")
    elif pkg == "zypper":
        run("sudo zypper install obs-studio -y")
    elif pkg == "pacman":
        run("sudo pacman -S --noconfirm obs-studio")

    # Instalar VS Code (Flatpak como alternativa universal)
    print("Instalando Visual Studio Code via Flatpak...")
    run("flatpak install flathub com.visualstudio.code -y")

    # Instalar Google Chrome (Flatpak como alternativa universal)
    print("Instalando Google Chrome via Flatpak...")
    run("flatpak install flathub com.google.Chrome -y")

    # Ativar suporte a exFAT
    print("Ativando suporte a exFAT...")
    if pkg == "apt":
        run("sudo apt install exfatprogs -y")
    elif pkg == "dnf":
        run("sudo dnf install exfatprogs -y")
    elif pkg == "yum":
        run("sudo yum install exfatprogs -y")
    elif pkg == "zypper":
        run("sudo zypper install exfatprogs -y")
    elif pkg == "pacman":
        run("sudo pacman -S --noconfirm exfatprogs")

    print("Configurações efetuadas com sucesso!")
    print("Reinicie o sistema para aplicar as mudanças.")

if __name__ == "__main__":
    main()