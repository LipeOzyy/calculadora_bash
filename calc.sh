#!/bin/bash

menu() {
    echo "===== CALCULADORA BASH ====="
    echo "1 - Soma"
    echo "2 - Subtração"
    echo "3 - Multiplicação"
    echo "4 - Divisão"
    echo "5 - Fatorial dos dois números"
    echo "6 - PA (5 termos)"
    echo "7 - PG (5 termos)"
    echo "8 - Resto da divisão"
    echo "9 - Ao quadrado dos dois números"
    echo "0 - Sair"
    echo "============================"
}

fatorial() {
    local n=$1
    local fat=1
    for ((i=1; i<=n; i++)); do
        fat=$((fat * i))
    done
    echo "$fat"
}

while true; do
    menu
    read -p "Escolha uma opção: " op

    if [ "$op" == "0" ]; then
        echo "Encerrando..."
        break
    fi

    read -p "Digite o primeiro número: " num1
    read -p "Digite o segundo número: " num2

    case $op in
        1)
            resultado=$(echo "$num1 + $num2" | bc)
            echo "Resultado: $resultado"
            ;;
        2)
            resultado=$(echo "$num1 - $num2" | bc)
            echo "Resultado: $resultado"
            ;;
        3)
            resultado=$(echo "$num1 * $num2" | bc)
            echo "Resultado: $resultado"
            ;;
        4)
            if [ "$num2" == "0" ]; then
                echo "Erro: divisão por zero!"
            else
                resultado=$(echo "scale=2; $num1 / $num2" | bc)
                echo "Resultado: $resultado"
            fi
            ;;
        5)
            fat1=$(fatorial $num1)
            fat2=$(fatorial $num2)
            echo "Fatorial de $num1: $fat1"
            echo "Fatorial de $num2: $fat2"
            ;;
        6)
            echo "PA de $num1 com razão $num2:"
            for ((i=0; i<5; i++)); do
                termo=$(echo "$num1 + $i * $num2" | bc)
                echo -n "$termo "
            done
            echo
            ;;
        7)
            echo "PG de $num1 com razão $num2:"
            termo=$num1
            for ((i=0; i<5; i++)); do
                echo -n "$termo "
                termo=$(echo "$termo * $num2" | bc)
            done
            echo
            ;;
        8)
            resto=$((num1 % num2))
            echo "Resto da divisão de $num1 por $num2: $resto"
            ;;
        9)
            quad1=$(echo "$num1 * $num1" | bc)
            quad2=$(echo "$num2 * $num2" | bc)
            echo "$num1² = $quad1"
            echo "$num2² = $quad2"
            ;;
        *)
            echo "Opção inválida!"
            ;;
    esac

    echo ""
    read -p "Pressione Enter para continuar..."
    clear
done
