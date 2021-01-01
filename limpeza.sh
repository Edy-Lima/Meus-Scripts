#!/bin/bash
echo "Limpeza e atualização"

read -s -n1 -p "O que deseja fazer?
  (L)=limpar
  (A)=Atualizar e Reparar
  (S)=Sair
Digite => " resposta

case "${resposta}" in
  l|L|"")
    echo "Limpando o Sistema =)"
    echo "Digite a senha de usuário para continuar"
    sudo rm -rf /var/tmp/*
    sudo apt clean -y
    sudo apt autoremove && sudo apt autoclean -y
    sudo rm -rf ${HOME}/.local/share/Trash/*    
  ;;

  a|A)
    echo "Atualizando e reparando o Sistema."
    echo "Digite a senha de usuário para continuar"
    sudo apt update && sudo apt full-upgrade -y
    sudo dpkg --configure -a
  ;;
  s|S)
    echo "Sair"
  ;;
  *)
    echo -e "Erro: Opção inválida\n\n"
    ${0}
  ;;
esac
