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
  echo "🎡 Bem-vindo à Roleta!"
  echo "Escolha um número entre 0 e 36: "
  read aposta
  numero=$(shuf -i 0-36 -n 1)
   echo "A roleta girou e parou no número $numero."
      if [[ $aposta -eq $numero ]]; then
          echo "🎉 Parabéns! Você ganhou!"
      else
        echo "💔 Você perdeu. Tente novamente!"
      fi
}

#Jogo 2: slot machine
function slotmachine() {
  echo "🎰 Bem-vindo á slot machine!"
  simbolos=("🍒" "🍋" "🍊" "⭐" "💎")
    slot1=$(shuf -e "${simbolos[@]}" -n 1)
    slot2=$(shuf -e "${simbolos[@]}" -n 1)
    slot3=$(shuf -e "${simbolos[@]}" -n 1)
  echo "| $slot1 | $slot2 | $slot3 |"
    if [[ $slot1 == $slot2 && $slot2 == $slot3 ]]; then
          echo "🎉 Jackpot! Você ganhou!"
    else
        echo "💔 Sem premio. Tente novamente!"
   fi
}

#Jogo 3: guess the number
function adivinha() {
  echo "🔢 Bem-vindo ao Jogo de guess the number!"
   numero=$(shuf -i 1-10 -n 1)
  tentativas=3
    while [[ $tentativas -gt 0 ]]; do
       echo "Adivinhe um número entre 1 e 10 (tentativas restantes: $tentativas):"
        read aposta
     if [[ $aposta -eq $numero ]]; then
       echo "🎉 Parabéns! Você acertou!"
       return
      elif [[ $aposta -lt $numero ]]; then
       echo "📉 Muito baixo!"
     else
      echo "📈 Muito alto!"
    fi
    ((tentativas--))
  done
  echo "💔 Você perdeu. O número era $numero."
}

#Loop principal
while true; do
  menu
  read opcao
  case $opcao in
    1) roleta ;;
    2) slotmachine ;;
    3) adivinha ;;
    4) echo "Obrigado por jogar! Até a próxima!"; exit ;;
    *) echo "Opção inválida. Tente novamente." ;;
  esac
  echo "========================"
done