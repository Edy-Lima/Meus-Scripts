import subprocess

def run(cmd, shell=True):
    print(f"Executando: {cmd}")
    subprocess.run(cmd, shell=shell, check=True)

def main():
    print("Removendo o Snap do Ubuntu...")

    # Remove o snapd e todos os pacotes relacionados
    print("Parando e removendo o Snap...")
    run("sudo systemctl stop snapd")
    run("sudo apt remove --purge 'snapd*' -y")
    run("sudo apt autoremove -y")

    # Remove pastas residuais do snap
    print("Removendo pastas residuais do Snap...")
    run("sudo rm -rf ~/snap")
    run("sudo rm -rf /snap")
    run("sudo rm -rf /var/snap")
    run("sudo rm -rf /var/lib/snapd")
    run("sudo rm -rf /var/cache/snapd")
    run("sudo apt remove --purge 'libreoffice*' -y")
    run("sudo apt autoremove -y")

    # Instalação de programas e configurações pessoais
    print("Instalando programas e configurando o sistema...")
    run("sudo apt update && sudo apt full-upgrade -y")

    # Instalação de programas essenciais
    print("Instalando programas essenciais...")
    run("sudo apt install ubuntu-restricted-extras -y")
    run("sudo apt install git gufw synaptic gdebi p7zip-full gnome-shell-extension-manager ffmpeg testdisk glabels gnome-tweaks steam gparted neofetch -y")

    # Instalação do suporte ao Flatpak
    print("Instalando suporte ao Flatpak...")
    run("sudo apt install flatpak -y")
    run("sudo apt install gnome-software-plugin-flatpak -y")
    run("sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo")

    # Configurando janelas do GNOME
    print("Configurando janelas do GNOME...")
    run("gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'")

    # Configurando o github
    print("Configurando o GitHub...")
    run("sudo apt update && sudo apt full-upgrade -y")
    run("git config --global user.name 'Edy-Lima'")
    run("git config --global user.email edivaldolima603@gmail.com")
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

    # Excluindo swap
    print("Desativando e removendo a partição de swap...")
    run("sudo systemctl stop swap.img.swap")
    run("sudo systemctl mask swap.img.swap")

    # Ativar suporte a exFAT
    print("Ativando suporte a exFAT...")
    run("sudo apt update && sudo apt upgrade -y")
    run("sudo apt install exfatprogs ffmpeg -y")

    # Atualizar drivers Intel no Ubuntu 24.04
    print("Atualizando lista de pacotes...")
    run("sudo apt update")
    print("Instalando dependências necessárias...")
    run("sudo apt install -y wget software-properties-common")
    print("Adicionando repositório oficial de drivers Intel...")
    run("sudo add-apt-repository ppa:oibaf/graphics-drivers -y")
    print("Atualizando lista de pacotes novamente...")
    run("sudo apt update")
    print("Atualizando drivers Intel...")
    run("sudo apt full-upgrade -y")
    print("Drivers Intel atualizados! Reinicie o computador para aplicar as mudanças.")

    print("Configurações efetuadas com sucesso!")

    # Reinicia o sistema para aplicar as mudanças
    print("Reiniciando o sistema para aplicar as mudanças...")
    run("sudo reboot")

if __name__ == "__main__":
    main()