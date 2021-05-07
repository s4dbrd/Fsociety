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

#Awk Colours
awkGREEN='\033[01;32m'
awkPURPLE='\033[01;95m'
awkGRAY='\033[01;37m'

echo "Col1 Col2 Col3 Col4" | \
awk -v r=$RED -v y=$YELLOW -v g=$GREEN -v b=$BLUE -v n=$NONE \
 '{printf r$1n y$2n g$3n b$4n "\n"}'


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
    echo -e "\n${yellowColour}[1]${endColour}${blueColour} Añadir Repositorios y Actualizar Sistema${endColour}\n\n${yellowColour}[2]${endColour}${blueColour} Instalar Herramientas${endColour}\n\n${yellowColour}[3]${endColour}${blueColour} Uso Herramientas${endColour}\n\n${yellowColour}[4]${endColour}${blueColour} Menú Ayuda${endColour}\n\n${yellowColour}[5]${endColour}${blueColour} Salir${endColour}\n"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
    read opcion
}

function MenuOpcion1(){
    echo -e "\n${purpleColour}[1]${endColour}${turquoiseColour} Actualizar Sistema${endColour}\n\n${purpleColour}[2]${endColour}${turquoiseColour} Ver contenido de sources.list${endColour}\n\n${purpleColour}[3]${endColour}${turquoiseColour} Añadir Repositorios de Kali Linux${endColour}\n\n${purpleColour}[4]${endColour}${turquoiseColour} Borrar repositorios de Kali Linux${endColour}\n\n${purpleColour}[5]${endColour}${turquoiseColour} Salir${endColour}\n"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
    read opcion1
}

function Principal(){
    clear
    Banner
    Menu
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
            sleep 1
            sudo apt update -y 2>/dev/null
            echo -ne "\n${yellowColour}[*]${endColour}${blueColour} ¿Tienes todos los paquetes actualizados?${endColour}${yellowColour} [S/N]: ${endColour}"
            read option
            if [[ $option = [Ss] ]]; then
                return 0;
            else
                echo -e "\n${yellowColour}[*]${endColour}${grayColour} Upgradeando sistema...${endColour}\n"
                sleep 1
                sudo apt upgrade -y 2>/dev/null
            fi
        done
    else
        echo -e "\n${yellowColour}[*]${endColour}${grayColour} Saliendo...${endColour}"
        exit 1
        return 1
    fi
}

function AñadirRepositorios(){
    repositorio="deb http://http.kali.org/kali kali-rolling main contrib non-free"
    comando=`grep "$repositorio" /etc/apt/sources.list`
    echo -ne "\n${yellowColour}[*]${endColour}${blueColour} Se va a añadir repositorios de Kali Linux, ¿continuar?${endColour}${yellowColour} [S/N]: ${endColour}"
    read opcion
    if [[ $opcion = [Ss] ]]; then
        sleep 1
        if [ -z "$comando" ]; then
            echo -e "\n${yellowColour}[*]${endColour}${grayColour} No se detecto repositorios en sources.list, continuando...${endColour}\n"
            sleep 1
            sudo echo "$repositorio" >> /etc/apt/sources.list
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Se ha detectado los repositorios en el sources.list ${endColour}${redColour}[!]${endColour}\n"
            return 1
        fi
    else
        echo -e "\n${yellowColour}[*]${endColour}${grayColour} Saliendo...${endColour}"
        exit 1
        return 1
    fi
}

function VerRepositorios(){
    echo -e "\n${yellowColour}[*]${endColour}${blueColour} Mostrando contenido del sources.list${endColour}\n"
    sleep 1
    sed -i '/^$/d' /etc/apt/sources.list
    sed 's/  */&,/g' /etc/apt/sources.list| \
awk -v r=$awkGRAY -v g=$awkGREEN -v p=$awkPURPLE \
 '{printf p$1n r$2n g$3n"\n"}' FS=","
}

function BorrarRepositorios(){
    echo -e "\n${yellowColour}[*]${endColour}${blueColour} Borrando contenido del sources.list${endColour}"
    sleep 1
    comando=`sed -e 's/deb http:\/\/http.kali.org\/kali kali-rolling main contrib non-free//g' -i /etc/apt/sources.list`
    if [ $? -eq 0 ]; then
        echo -e "\n${yellowColour}[*]${endColour}${greenColour} El comando se ejecutó correctamente${endColour}\n"
    else
        echo -e "\n${redColour}[!]${endColour}${lightRed} No se pudo completar la ejecución del comando ${endColour}${redColour}[!]${endColour}\n"
        return 1
    fi
}

function Caso1(){
    MenuOpcion1
    if [[ $opcion1 = 1 ]]; then
        Actualizar
    elif [[ $opcion1 = 2 ]]; then
        VerRepositorios
    elif [[ $opcion1 = 3 ]]; then
        AñadirRepositorios
    elif [[ $opcion1 = 4 ]]; then
        BorrarRepositorios
    fi
    sleep 1
    Menu
}

# Main Program
Principal
while [[ $opcion != 5 ]]; do
    case $opcion in
        1) Caso1;;
        5) exit 1;;
    esac
done