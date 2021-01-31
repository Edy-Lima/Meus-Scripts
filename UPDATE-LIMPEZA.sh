#!/usr/bin/env bash
#MEU NOVO SCRIPT.
TIME=2
clear
while true;do
echo " "
echo "SEJA BEM VINDO AO $0 DO UBUNTU!"
echo " "
echo "Escolha uma opção abaixo para começar!
      
      1 - Verificar repositório do sistema
      2 - Mostrar atualizações do sistema
      3 - Instalar atualizações do sistema
      4 - Limpar o sistema
      5 - Remover pacotes não necessários
      0 - Sair do sistema"
echo " "
echo -n "Opção escolhida: "
read opcao
case $opcao in
        1)
                echo Verificando o sistema por atualizações...
                sleep $TIME
                sudo apt update
                ;;
        2)
                echo Mostrando as atualizações do sistema...
                sleep $TIME
                sudo apt list --upgradable
                ;;
        3)
                echo Instalando atualizações do sistema...
                sleep $TIME
                sudo apt upgrade -y
                ;;
        4)
                echo Limpando o sistema...
                sudo du -sh /var/cache/apt/archives/ 
                sudo rm -rf /var/tmp/*
                sudo apt clean
                sudo apt autoclean
                sudo rm -rf ${HOME}/.local/share/Trash/* 
                sudo du -sh /var/cache/apt/archives/
                ;;
        5)
                echo Removendo pacotes desnecessários do sistema...
                sleep $TIME
                sudo apt autoremove -y
                sudo apt autoremove --purge -y
                ;;
        0)
                echo Saindo do sistema...
                sleep $TIME
                exit 0
                ;;
        *)
                echo Opção inválida, tente novamente!
                ;;
esac
done

