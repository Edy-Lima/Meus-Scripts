#!/bin/bash
echo "Limpeza"
read -s -n1 -p "O que deseja fazer?

  Leia o menu com atenção!   
  (M)=Manual Deborphan 
  (1)=Instalar o (Deborphan)
  (2)=limpeza completa com (Deborphan)
  (3)=Limpeza normal  
  (S)=Sair 
Digite => " resposta

case "${resposta}" in
  1|1|"")
    echo "(Instalando deborphan:)"
    echo "Digite a senha de usuário pra continuar"
    sudo apt install deborphan -y

  ;;
  2|2)
    echo "Limpando o Sistema com (Deborphan)"
    echo "Digite a senha de usuário para continuar"
    sudo du -h /var/cache/apt/archives/ 
    sudo rm -rf /var/tmp/*
    sudo apt clean -y
    sudo apt autoclean -y
echo "Executando ( Deborphan )"
    sudo deborphan -s
echo "(Verificando aguarde...)"
    sudo apt remove $(deborphan) -y
echo "(Aguarde...)"
    sudo apt remove $(deborphan) -y
echo "(Limpando)"
    sudo apt autoremove --purge -y
    sudo rm -rf ${HOME}/.local/share/Trash/* 
    sudo du -h /var/cache/apt/archives/ 
echo "Tudo Limpo!"
        
   ;;
   3|3)
    echo "(Limpeza normal do Sistema)"
    echo "Digite a senha de usuário para continuar"
    sudo du -h /var/cache/apt/archives/ 
    sudo rm -rf /var/tmp/*
    sudo apt clean -y
    sudo apt autoclean -y
    sudo apt autoremove --purge -y
    sudo rm -rf ${HOME}/.local/share/Trash/* 
    sudo du -h /var/cache/apt/archives/ 
echo "Tudo Limpo!"

   ;;
   m|M)
echo "Manual (doberphan)"
echo "O deborphan pesquisa pacotes órfãos em seu sistema. 
Ele determina quais pacotes não são dependência de nenhum outro pacote 
na sua instalação e mostra a lista desses pacotes. 
Isso é bastante útil para encontrar bibliotecas, 
mas pode ser utilizado em pacotes de todas as seções."
    
  ;;
  s|S)
    echo "Sair"
  ;;
  *)
    echo -e "Erro: Opção inválida\n\n"
    ${0}
  ;;
esac
