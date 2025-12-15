#!/usr/bin/env bash
# Meu-Fedora43-config-pessoal.sh
# Script para preparar Fedora 43 para jogos e remover swap com segurança.
# Execute com cuidado e como usuário com privilégios `sudo`.

set -euo pipefail
IFS=$'\n\t'

NONINTERACTIVE=0
REBOOT_AFTER=1

usage() {
	cat <<EOF
Uso: $0 [--yes|-y] [--no-reboot]
	--yes, -y      : assume 'sim' para todas as confirmações
	--no-reboot    : não reiniciar automaticamente ao final
EOF
}

while [[ ${1:-} != "" ]]; do
	case "$1" in
		-y|--yes) NONINTERACTIVE=1; shift ;;
		--no-reboot) REBOOT_AFTER=0; shift ;;
		-h|--help) usage; exit 0 ;;
		*) echo "Parâmetro desconhecido: $1"; usage; exit 1 ;;
	esac
done

confirm() {
	if [ "$NONINTERACTIVE" -eq 1 ]; then
		return 0
	fi
	read -r -p "$1 [s/N]: " resp
	case "$resp" in
		[sS]|[sS][iI]) return 0 ;;
		*) return 1 ;;
	esac
}

log() { echo -e "[INFO] $*"; }
err() { echo -e "[ERRO] $*" >&2; }

backup_file() {
	local file="$1"
	if [ -e "$file" ]; then
		sudo cp "$file" "${file}.bak-$(date +%Y%m%d%H%M%S)"
		log "Backup: ${file} -> ${file}.bak-$(date +%Y%m%d%H%M%S)"
	fi
}

remove_swap() {
	log "Removendo swap com segurança..."
	backup_file /etc/fstab

	log "Desativando todas as swaps ativas (swapoff -a)"
	sudo swapoff -a || true

	# Remover entradas 'swap' do /etc/fstab
	if sudo grep -E '\bswap\b' /etc/fstab >/dev/null 2>&1; then
		if confirm "Remover entradas de swap de /etc/fstab?"; then
			sudo sed -i.bak -r '/\bswap\b/d' /etc/fstab
			log "Entradas de swap removidas de /etc/fstab (backup criado)."
		else
			log "Preservando entradas de /etc/fstab."
		fi
	else
		log "Nenhuma entrada de swap encontrada em /etc/fstab."
	fi

	# Procurar por swapfile padrão (/swapfile)
	if [ -f /swapfile ]; then
		if confirm "Arquivo /swapfile encontrado. Remover o arquivo de swap?"; then
			sudo rm -f /swapfile
			log "/swapfile removido."
		else
			log "Preservando /swapfile."
		fi
	fi

	# Detectar partições do tipo swap
	local swaps
	swaps=$(awk '/swap/ {print $1}' /proc/swaps | tail -n +2 || true)
	if [ -n "$swaps" ]; then
		log "Swaps ativas detectadas: $swaps"
		log "As partições usadas como swap foram desativadas (swapoff). Recomendado remover entrada no /etc/fstab e, se desejar, apagar a partição manualmente usando fdisk/parted."
	else
		log "Nenhuma swap ativa detectada."
	fi

	log "Ajustando swappiness para 10 (persistente)."
	echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-gaming-swappiness.conf >/dev/null
	sudo sysctl --system >/dev/null || true
}

setup_repos_and_flatpak() {
	log "Habilitando RPM Fusion (free e nonfree) e Flathub..."
	sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
	sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo || true
}

install_gaming_packages() {
	log "Atualizando sistema e instalando pacotes recomendados para jogos..."
	sudo dnf upgrade --refresh -y || true

	# Pacotes principais
	sudo dnf install -y steam glabels gamemode mangohud vkd3d vkd3d-proton vulkan-tools mesa-vulkan-drivers mesa-dri-drivers vulkan-loader || true

	# Flatpaks úteis (nenhuma instalação automática de Steam)
}

install_google_chrome() {
	log "Instalando Google Chrome (stable)..."
	# Tenta instalar diretamente via DNF apontando para o RPM direto
	if ! sudo dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm; then
		err "Falha na instalação direta via DNF. Tentando baixar e instalar manualmente..."
		tmpfile=$(mktemp -t google-chrome-XXXXXX.rpm) || tmpfile=/tmp/google-chrome.rpm
		if curl -fsSL -o "$tmpfile" https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm; then
			sudo dnf install -y "$tmpfile" || err "Falha ao instalar $tmpfile"
			rm -f "$tmpfile"
		else
			err "Falha ao baixar o pacote do Google Chrome." || true
			return 1
		fi
	fi
}

 

detect_and_install_gpu_drivers() {
	log "Detectando GPU..."
	local gpu
	gpu=$(lspci -nnk | grep -E 'VGA|3D' | head -n1 | tr '[:upper:]' '[:lower:]' || true)

	if echo "$gpu" | grep -iq nvidia; then
		log "GPU NVIDIA detectada. Instalando drivers NVIDIA (akmod)..."
		sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda || true
		sudo dnf install -y kernel-devel akmod || true
	elif echo "$gpu" | grep -iq amd; then
		log "GPU AMD detectada. Instalando drivers e Vulkan Mesa..."
		sudo dnf install -y mesa-vulkan-drivers vulkan-tools || true
	elif echo "$gpu" | grep -iq intel; then
		log "GPU Intel detectada. Instalando drivers e Vulkan Mesa..."
		sudo dnf install -y mesa-vulkan-drivers vulkan-tools || true
	else
		log "GPU não identificada automaticamente. Verifique manualmente se precisa de drivers especiais."
	fi
}

performance_tweaks() {
	log "Aplicando ajustes de performance..."
	sudo dnf install -y tuned cpupower kernel-tools || true
	sudo systemctl enable --now tuned || true
	sudo tuned-adm profile latency-performance || true

	# Tentar setar governor para performance
	if command -v cpupower >/dev/null 2>&1; then
		sudo cpupower frequency-set -g performance || true
	fi

	cat <<EOF | sudo tee /etc/sysctl.d/99-gaming.conf >/dev/null
vm.swappiness = 10
vm.vfs_cache_pressure = 50
EOF
	sudo sysctl --system >/dev/null || true
}

post_actions() {
	log "Limpeza e atualização do Flatpak..."
	sudo dnf autoremove -y || true
	sudo dnf clean all || true
	flatpak update -y || true
}

main() {
	log "Script para configurar Fedora 43 para jogos iniciado."

	if ! confirm "Deseja remover swap do sistema agora?"; then
		log "Pulando remoção de swap conforme solicitado."
	else
		remove_swap
	fi

	setup_repos_and_flatpak
	install_gaming_packages

	if confirm "Instalar Google Chrome (stable)?"; then
		install_google_chrome
	fi
	detect_and_install_gpu_drivers
	performance_tweaks
	post_actions

	log "Configuração concluída."
	if [ "$REBOOT_AFTER" -eq 1 ]; then
		if confirm "Reiniciar agora?"; then
			sudo reboot
		else
			log "Reinício cancelado. Reinicie manualmente para aplicar todas as alterações se necessário."
		fi
	else
		log "Não será reiniciado automaticamente (--no-reboot)."
	fi
}

main
