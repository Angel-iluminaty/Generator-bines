#!/bin/bash
echo -e "\e[1;34m
╭━━━┳━━━┳━╮╱╭╮
┃╭━╮┃╭━━┫┃╰╮┃┃
┃┃╱╰┫╰━━┫╭╮╰╯┃
┃┃╭━┫╭━━┫┃╰╮┃┃
┃╰┻━┃╰━━┫┃╱┃┃┃
╰━━━┻━━━┻╯╱╰━╯
╭━━╮╭━━┳━╮╱╭┳━━━┳━━━╮
┃╭╮┃╰┫┣┫┃╰╮┃┃╭━━┫╭━╮┃
┃╰╯╰╮┃┃┃╭╮╰╯┃╰━━┫╰━━╮
┃╭━╮┃┃┃┃┃╰╮┃┃╭━━┻━━╮┃
┃╰━╯┣┫┣┫┃╱┃┃┃╰━━┫╰━╯┃
╰━━━┻━━┻╯╱╰━┻━━━┻━━━╯\e[0m"

echo -e "\e[33mGenerador de Bines Creado Por: Angel Del Villar\e[0m"

echo -e "\e[31mGITHUB: https://github.com/Angel-iluminaty\e[0m"

# Función para generar una fecha aleatoria entre 2023 y 2031
generate_random_date() {
    local year=$((2023 + RANDOM % 9))
    local month=$((1 + RANDOM % 12))
    local day=$((1 + RANDOM % 28))
    echo "$month/$day/$year"
}

# Función para generar un número de tarjeta de crédito
generate_card_number() {
    local prefix="4"
    local mid=$((1000 + RANDOM % 9000))
    local last=$((1000 + RANDOM % 9000))
    echo "$prefix$mid$last"
}

# Función principal
main() {
    echo -e "\e[37m¿Quieres generar tarjetas con fechas aleatorias o manuales?\e[0m"
    echo -e "\e[1;32m1. Aleatorio\e[0m"
    echo -e "\e[37m2. Manual\e[0m"
    read -p "Elige una opción (1/2): " option

    read -p echo -e "\e[1;34m¿Cuántas tarjetas quieres generar?\e[0m" num_cards

    for ((i=1; i<=num_cards; i++)); do
        if [ "$option" == "1" ]; then
            date=$(generate_random_date)
        elif [ "$option" == "2" ]; then
            read -p "Introduce la fecha (MM/DD/YYYY): " date
        else
            echo "Opción inválida"
            return
        fi

        card_number=$(generate_card_number)
        echo -e "\e[1;34mTarjeta $i:\e[0m"
        echo -e "\e[1;31mNúmero de tarjeta: $card_number\e[0m"
        echo -e "\e[1;33mFecha de expiración: $date\e[0m"
        echo
    done
}

main