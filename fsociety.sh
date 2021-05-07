#!/bin/bash

# Autor: Adrian Diaz

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
lightRed="\e[0;91m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function Banner(){
    echo -e "${lightRed}  __                _      _         
 / _|___  ___   ___(_) ___| |_ _   _ 
| |_/ __|/ _ \ / __| |/ _ \ __| | | |
|  _\__ \ (_) | (__| |  __/ |_| |_| |
|_| |___/\___/ \___|_|\___|\__|\__, |\t\t\t  ${grayColour}Created by: ${endColour}${yellowColour}Adrián Díaz (s4dbrd)${lightRed}
                               |___/ 
 "
}

trap ctrl_c INT

function ctrl_c(){
    echo -e "\n${yellowColour}[*]${endColour}${grayColour} Saliendo...${endColour}\n"
    exit 1
}

if [[ $EUID -ne 0 ]]; then
    echo -e "\n${redColour}[!]${endColour}${redColour} Tienes que ser root para ejecutar el script ${endColour}${redColour}[!]"
    exit 1
fi

function Menu(){
    echo -e "${yellowColour}[1]${endColour}${blueColour} Añadir Repositorios${endColour}\n\n${yellowColour}[2]${endColour}${blueColour} Instalar Herramientas${endColour}\n\n${yellowColour}[3]${endColour}${blueColour} Uso Herramientas${endColour}\n\n${yellowColour}[4]${endColour}${blueColour} Menú Ayuda${endColour}\n"
}

function PanelAyuda(){
    echo -e "\n${yellowColour}[*]${endColour}${grayColour} Uso: ./fsociety.sh${endColour}"
}

function Actualizar(){
    echo -ne "\n${yellowColour}[*]${endColour}${blueColour} Se tiene que actualizar el sistema, ¿seguir?${endColour}${yellowColour} [S/N]: ${endColour}"
    read opcion
    if [[ $opcion = [Ss] ]]; then
        echo -e "\n${yellowColour}[*]${endColour}${grayColour} Actualizando sistema...${endColour}\n"
        while true; do
            sudo apt update -y
            echo -ne "\n${yellowColour}[*]${endColour}${blueColour} ¿Tienes todos los paquetes actualizados?${endColour}${yellowColour} [S/N]: ${endColour}"
            read option
            if [[ $option = [Ss] ]]; then
                exit 0;
            else
                echo -e "\n${yellowColour}[*]${endColour}${grayColour} Upgradeando sistema...${endColour}\n"
                sudo apt upgrade -y
            fi
        done
    else
        echo -e "\n${yellowColour}[*]${endColour}${grayColour} Saliendo...${endColour}"
        exit 1
    fi
}

function Repositorios(){
    repositorio="deb http://http.kali.org/kali kali-rolling main contrib non-free"
    comando=`grep $repositorio /etc/apt/sources.list 2>/dev/null`
    echo -ne "\n${yellowColour}[*]${endColour}${blueColour} Se va a añadir repositorios de Kali Linux, ¿seguir?${endColour}${yellowColour} [S/N]: ${endColour}"
    read opcion
    if [[ $opcion = [Ss] ]]; then
        if [ -z "$comando" ]; then
            echo -e "\n${yellowColour}[*]${endColour}${grayColour} No se detecto repositorios en sources.list, continuando...${endColour}\n"
            sudo echo "$repositorio" >> /etc/apt/sources.list
        else
            echo -e "\n${redColour}[!]${endColour}${redColour} Se ha detectado los repositorios en el sources.list ${endColour}${redColour}[!]${endColour}\n"
            exit 1
        fi
    else
        echo -e "\n${yellowColour}[*]${endColour}${grayColour} Saliendo...${endColour}"
        exit 1
    fi
}

# Main Program
clear
Banner
Menu
echo -ne "${yellowColour}Elige una opción: ${endColour}"
read opcion
case $opcion in
    1) Actualizar ; Repositorios ; Menu;;
esac