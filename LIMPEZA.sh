#!/usr/bin/env bash
#
# MEU SCRIPT PESSOAL.
# Este Shell-Script foi criado para uso pessoal,podendo tambem ser usado em qualquer distro baseada em Ubuntu. 
# (Edy Lima) Blog: https://edylimatutoriais.blogspot.com/
TIME=2
clear
while true;do
echo " "
echo "BEM VINDO AO $0 PARA UBUNTU!"
echo " "
echo "Escolha uma opção abaixo para começar!
      
      1 - Visualiza cache do APT
      2 - Limpar cache do APT
      3 - Limpeza Geral do Sistema
      4 - Atualizar Sistema
      0 - Sair"
echo " "
echo -n "Opção escolhida: "
read opcao
case $opcao in
        1)
        echo Visualizando cache do APT....
              # Este comando irá desativar e excluir o Swapfile.
                sleep $TIME
                sudo du -sh /var/cache/apt
                sudo du -sh /var/cache/apt/archives/ 
                ;;
        2)
        echo Limpando cache do APT....
              # Este comando irá excluir todo suporte a Snap.
                sleep $TIME
                sudo apt clean -y
                sudo apt autoclean -y
                sudo apt autoremove -y
                clear
                ;;
        3)
        echo Limpeza Geral do Sistema...
                sleep $TIME
                sudo rm -rf /var/tmp/*
                sudo rm -vfr ~/.thumbnails/normal/*
                sudo rm -f ~/.cache/thumbnails/normal/*
                sudo rm -rf ${HOME}/.local/share/Trash/* 
                clear
                ;;
        4)
        echo Instalando atualizações do Sistema...
              # Comandos para atualizar o Siatema Ubuntu.
                sudo apt update && sudo apt dist-upgrade -y
                clear
                ;;
                
        0)
        echo Saindo....
                sleep $TIME
                exit 0
                ;;
        *)
        echo Opção inválida, tente novamente!
                ;;
esac
done

