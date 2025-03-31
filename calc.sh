#!/bin/bash

factorial() {
    num=$1
    result=1
    for ((i = 1; i <= num; i++)); do
        result=$((result * i))
    done
    echo "O fatorial de $num é: $result"
}

is_prime() {
    num=$1
    if [ "$num" -le 1 ]; then
        echo "$num não é primo"
        return
    fi
    for ((i = 2; i * i <= num; i++)); do
        if [ $((num % i)) -eq 0 ]; then
            echo "$num não é primo"
            return
        fi
    done
    echo "$num é primo"
}

while true; do
    echo "Digite o primeiro número: "
    read num1
    
    echo "Digite o segundo número (ou pressione Enter para fatorial ou teste de primo): "
    read num2
    
    echo "Escolha a operação:"
    echo "1) Soma"
    echo "2) Subtração"
    echo "3) Multiplicação"
    echo "4) Divisão"
    echo "5) Fatorial"
    echo "6) Verificar se é primo"
    echo "7) Sair"
    read opcao
    
    case $opcao in
        1) echo "Resultado: $((num1 + num2))" ;;
        2) echo "Resultado: $((num1 - num2))" ;;
        3) echo "Resultado: $((num1 * num2))" ;;
        4) 
            if [ "$num2" -ne 0 ]; then
                echo "Resultado: $(echo "scale=2; $num1 / $num2" | bc)"
            else
                echo "Erro: divisão por zero não permitida."
            fi
            ;;
        5) factorial $num1 ;;
        6) is_prime $num1 ;;
        7) echo "Saindo..."; exit ;;
        *) echo "Opção inválida!" ;;
    esac

done
