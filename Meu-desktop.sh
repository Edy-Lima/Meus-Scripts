#!/bin/bash
#
#
#
TIME=2
clear
while true;do
echo " "
echo "Bem Vindo ao $0 Para Ubuntu!"
echo " "
echo "Escolha uma opção abaixo para começar!

     1-Remover snap e instal flatpak
     2-Limpeza geral e atualizações
     3-Configurar meu Ubuntu
     0-Sair
echo " "
echo -n "Opçao escolhida: "
read opçao
case $opcao in
     1)
     echo 
     # 
     sleep $TIME
     2)
     echo
     #
     sleep $TIME
     3)
     echo
     #
     sleep $TIME
     0)
     echo Saindo....
     # Este comando encerra o programa!
         sleep $TIME
         exit 0
         ;;
     *)
     echo Opçao invalida, tente novamente!
         ;;
