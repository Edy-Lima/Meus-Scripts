#!/usr/bin/env bash
# filepath: Meu-Ubuntu-config-pessoal.sh
# Script atualizado para configurar o Ubuntu para uso 'pessoal' e 'trabalho'.
# Agora suporta perfis, confirmações para ações destrutivas e modo dry-run.

set -euo pipefail

DRY_RUN=false
FORCE=false
PROFILE="pessoal"
REBOOT=false
REMOVE_SNAP=false
REMOVE_SWAP=false
UBUNTU_PRO_TOKEN=""

log() { echo -e "[INFO] $*"; }
err() { echo -e "[ERROR] $*" >&2; }
info() { log "$*"; }

run() {
     if $DRY_RUN; then
          echo "+ $*"
     else
          eval "$@"
     fi
}

usage() {
     cat <<EOF
Uso: $0 [opções]

Opções:
  --profile <pessoal|trabalho|both>   Perfil de instalação (default: pessoal)
  --remove-snap                       Remove snapd (opção destrutiva)
  --remove-swap                       Desativa e remove swap (opção destrutiva)
  --token <token>                     Anexa Ubuntu Pro com token
  --yes                               Assume 'sim' para confirmações
  --dry-run                           Mostra ações sem executá-las
  --reboot                            Reinicia ao final (somente com --yes)
  -h, --help                          Mostra esta ajuda
EOF
}

confirm() {
     local msg="$1"
     if $FORCE; then
          return 0
     fi
     read -p "$msg [s/N]: " resp
     case "$resp" in
          [sS]|[yY]) return 0 ;;
          *) return 1 ;;
     esac
}

parse_args() {
     while (( "$#" )); do
          case "$1" in
               --profile)
                    PROFILE="$2"; shift 2;;
               --remove-snap)
                    REMOVE_SNAP=true; shift;;
               --remove-swap)
                    REMOVE_SWAP=true; shift;;
               --token)
                    UBUNTU_PRO_TOKEN="$2"; shift 2;;
               --yes)
                    FORCE=true; shift;;
               --dry-run)
                    DRY_RUN=true; shift;;
               --reboot)
                    REBOOT=true; shift;;
               -h|--help)
                    usage; exit 0;;
               *) err "Opção desconhecida: $1"; usage; exit 1;;
          esac
     done
}

install_common() {
     info "Atualizando repositórios e instalando pacotes básicos..."
     run sudo apt update
     run sudo apt install -y git gufw synaptic gdebi p7zip-full gnome-shell-extension-manager ffmpeg testdisk gnome-tweaks gparted neofetch ubuntu-restricted-extras
     run sudo apt install -y mesa-utils || true
}

install_flatpaks_personal() {
     info "Instalando aplicativos pessoais via Flatpak..."
     run sudo apt install -y flatpak
     run sudo apt install -y gnome-software-plugin-flatpak || true
     run sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
     run flatpak install -y flathub org.gimp.GIMP org.inkscape.Inkscape org.onlyoffice.desktopeditors org.shotcut.Shotcut org.openshot.OpenShot com.discordapp.Discord com.obsproject.Studio com.valvesoftware.Steam
}

install_chrome() {
     info "Instalando Google Chrome..."
     run wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb
     run sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb || true
     run sudo apt-get --fix-broken install -y
     run rm -f /tmp/google-chrome-stable_current_amd64.deb
}

install_vscode() {
     info "Instalando Visual Studio Code..."
     run sudo apt update
     run sudo apt install -y wget gpg
    run bash -lc 'wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/microsoft.gpg'
     run sudo install -o root -g root -m 644 /tmp/microsoft.gpg /etc/apt/trusted.gpg.d/ || true
     run rm -f /tmp/microsoft.gpg
     run bash -lc 'echo "deb [arch=$(dpkg --print-architecture)] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list'
     run sudo apt update
     run sudo apt install -y code
}

remove_snap() {
     if $REMOVE_SNAP; then
          if confirm "Remover snapd e pacotes relacionados? Isto também pode remover LibreOffice. Continuar?"; then
               info "Removendo snapd e pastas residuais..."
               run sudo systemctl stop snapd || true
               run sudo apt remove --purge -y snapd
               run sudo rm -rf /snap /var/snap /var/lib/snapd /var/cache/snapd || true
               run sudo apt autoremove -y
          else
               info "Pular remoção do snapd"
          fi
     fi
}

remove_swap() {
     if $REMOVE_SWAP; then
          if confirm "Desativar e mascarar swap (pode causar problemas em sistemas com pouca RAM). Continuar?"; then
               info "Desativando swap..."
               run sudo swapoff -a || true
               # Não remove arquivos de swap automaticamente, apenas desativa e mascara se gerenciado por systemd
               run sudo systemctl mask swap.img.swap || true
          else
               info "Pular remoção de swap"
          fi
     fi
}

configure_gnome() {
     info "Configurando comportamento do dock do GNOME..."
     run gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews' || true
}

configure_git() {
     info "Configurando Git para o perfil: $PROFILE"
     if [[ "$PROFILE" == "pessoal" ]]; then
          run git config --global user.name "Edy-Lima"
          run git config --global user.email "edivaldolima603@gmail.com"
     else
          # Valores de exemplo para trabalho; ajuste conforme necessário
          run git config --global user.name "Edy (Trabalho)"
          run git config --global user.email "edy.trabalho@example.com"
     fi
}

attach_ubuntu_pro() {
     if [[ -n "$UBUNTU_PRO_TOKEN" ]]; then
          info "Instalando ubuntu-advantage-tools e anexando token..."
          run sudo apt update
          run sudo apt install -y ubuntu-advantage-tools
          run sudo pro attach "$UBUNTU_PRO_TOKEN"
     fi
}

kernel_mainline_support() {
     info "Instalando ferramenta 'mainline' para gerenciar kernels (opcional)..."
     run sudo add-apt-repository ppa:cappelikan/ppa -y
     run sudo apt update
     run sudo apt install -y mainline || true
}

final_updates() {
     info "Executando atualização e limpeza final..."
     run sudo apt update && sudo apt full-upgrade -y
     run sudo apt autoclean -y
     run sudo apt autoremove -y
}

main() {
     parse_args "$@"

     info "Perfil selecionado: $PROFILE"
     if $DRY_RUN; then info "Modo dry-run ativado: nenhuma ação será executada"; fi

     attach_ubuntu_pro
     install_common

     if [[ "$PROFILE" == "pessoal" || "$PROFILE" == "both" ]]; then
          install_flatpaks_personal
          install_chrome
     fi

     if [[ "$PROFILE" == "trabalho" || "$PROFILE" == "both" ]]; then
          install_vscode
          # Pacotes de trabalho comuns (descomente se quiser instalar automaticamente)
          run sudo apt install -y remmina docker.io || true
     fi

     remove_snap
     remove_swap
     configure_gnome
     configure_git
     kernel_mainline_support
     final_updates

     if $REBOOT; then
          if $FORCE || confirm "Reiniciar agora para aplicar mudanças?"; then
               info "Reiniciando sistema..."
               run sudo reboot
          else
               info "Reinício cancelado"
          fi
     else
          info "Concluído. Reinicie o sistema manualmente se necessário."
     fi
}

main "$@"



