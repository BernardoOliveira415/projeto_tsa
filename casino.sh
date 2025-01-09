#!/bin/bash

#Função para exibir o menu inicial
function menu() {
  echo "========================"
  echo "🎰 Bem-vindo ao Cassino 🎲"
  echo "========================"
  echo "1. Roleta"
  echo "2. slot machine"
  echo "3. guess the number"
  echo "4. Sair"
  echo "Escolha um jogo: "
}


#Jogo 1: Roleta
function roleta() {
  echo "Bem-vindo à Roleta!"
  echo "Escolha 0 e 36: "
  read aposta
  numero=$(shuf -i 0-36 -n 1)
   echo "girou e parou no número $numero."
      if [[ $aposta $numero ]]; then
          echo "voce ganhou"
      else
        echo "voce perdeu"
      fi
}