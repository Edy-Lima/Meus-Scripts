#!/bin/env bash
#
echo "Atualizar o sistema:"
sudo apt update && sudo apt dist-upgrade -y
echo "personalizar-gnome:"
# este comando instala alguns plugins.
sudo apt install gnome-tweak-tool gnome-shell gnome-shell-extension dconf-editor -y
echo "Instalar tema Dark do Kdenlive:"
# este comando instala o tema breeeze no Kdenlive
sudo apt install kde-style-breeze -y

