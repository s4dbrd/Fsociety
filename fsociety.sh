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
|_| |___/\___/ \___|_|\___|\__|\__, |\t\t\t  ${grayColour}Created by: ${endColour}${yellowColour}Adrián Díaz${lightRed}
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
    echo -e "\n${yellowColour}[1]${endColour}${blueColour} Añadir Repositorios y Actualizar Sistema${endColour}\n\n${yellowColour}[2]${endColour}${blueColour} Herramientas${endColour}\n\n${yellowColour}[3]${endColour}${blueColour} Menú Ayuda${endColour}\n\n${yellowColour}[4]${endColour}${blueColour} Salir${endColour}\n"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
    read opcion
}

function MenuOpcion1(){
    echo -e "\n${purpleColour}[1]${endColour}${turquoiseColour} Actualizar Sistema${endColour}\n\n${purpleColour}[2]${endColour}${turquoiseColour} Ver contenido de sources.list${endColour}\n\n${purpleColour}[3]${endColour}${turquoiseColour} Añadir Repositorios de Kali Linux${endColour}\n\n${purpleColour}[4]${endColour}${turquoiseColour} Borrar repositorios de Kali Linux${endColour}\n\n${purpleColour}[5]${endColour}${turquoiseColour} Volver atrás${endColour}\n"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
    read opcion1
}

function MenuGlogal2(){
    echo -e "\n${purpleColour}[1]${endColour}${turquoiseColour} Instalar herramientas${endColour}\n\n${purpleColour}[2]${endColour}${turquoiseColour} Crackeo de contraseñas${endColour}\n\n${purpleColour}[3]${endColour}${turquoiseColour} Seguridad del Sistema${endColour}\n\n${purpleColour}[4]${endColour}${turquoiseColour} Volver atrás${endColour}\n"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
    read opciong2
}

function MenuOpcion21(){
    echo -e "
${purpleColour}[1]${endColour}${turquoiseColour} Recopilación de Información${endColour}                ${purpleColour}[8]${endColour}${turquoiseColour} Herramientas de Explotación${endColour}
${purpleColour}[2]${endColour}${turquoiseColour} Análisis de Vulnerabilidades${endColour}               ${purpleColour}[9]${endColour}${turquoiseColour} Sniffing & Spoofing${endColour}
${purpleColour}[3]${endColour}${turquoiseColour} Análisis de Aplicaciones Web${endColour}               ${purpleColour}[10]${endColour}${turquoiseColour} Post Explotación${endColour}
${purpleColour}[4]${endColour}${turquoiseColour} Evaluación de Base de Datos${endColour}                ${purpleColour}[11]${endColour}${turquoiseColour} Análisis Forense${endColour}
${purpleColour}[5]${endColour}${turquoiseColour} Ataques de contraseñas${endColour}                     ${purpleColour}[12]${endColour}${turquoiseColour} Herramientas de Reporte${endColour}
${purpleColour}[6]${endColour}${turquoiseColour} Ataques Wireless${endColour}                           ${purpleColour}[13]${endColour}${turquoiseColour} Herramientas de Ingeniería Social${endColour}
${purpleColour}[7]${endColour}${turquoiseColour} Ingeniería Inversa${endColour}${purpleColour}                         ${purpleColour}[14]${endColour}${turquoiseColour} Servicios del Sistema${endColour}
                                                                                                        ${purpleColour}[15]${endColour}${turquoiseColour} Volver atrás${endColour}
"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
    read opcion2
    if [[ $opcion2 = 1 ]]; then
        echo -e "
${grayColour} Recopilación de Información${endColour}${greenColour}

 [1] acccheck					[30] lbd
 [2] ace-voip					[31] Maltego Teeth
 [3] Amap					[32] masscan
 [4] Automater					[33] Metagoofil
 [5] bing-ip2hosts				[34] Miranda
 [6] braa					[35] Nmap
 [7] CaseFile					[36] ntop
 [8] CDPSnarf					[37] p0f
 [9] cisco-torch				[38] Parsero
[10] Cookie Cadger				[39] Recon-ng
[11] copy-router-config			        [40] SET
[12] DMitry					[41] smtp-user-enum
[13] dnmap					[42] snmpcheck
[14] dnsenum					[43] sslcaudit
[15] dnsmap					[44] SSLsplit
[16] DNSRecon					[45] sslstrip
[17] dnstracer					[46] SSLyze
[18] dnswalk					[47] THC-IPV6
[19] DotDotPwn					[48] theHarvester
[20] enum4linux					[49] TLSSLed
[21] enumIAX					[50] twofi
[22] exploitdb					[51] URLCrazy
[23] Fierce					[52] Wireshark
[24] Firewalk					[53] WOL-E
[25] fragroute					[54] Xplico
[26] fragrouter					[55] iSMTP
[27] Ghost Phisher				[56] InTrace
[28] GoLismero					[57] hping3
[29] goofile

[0] Instalar todas las herramientas de RI
				 
						"
        echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion21
        if [[ $opcion21 = 1 ]]; then
            sudo apt install acccheck
        elif [[ $opcion21 = 2 ]]; then
            sudo apt install ace-voip
        elif [[ $opcion21 = 3 ]]; then
            sudo apt install amap
        elif [[ $opcion21 = 4 ]]; then
            sudo apt install automater
        elif [[ $opcion21 = 5 ]]; then
            wget http://www.morningstarsecurity.com/downloads/bing-ip2hosts-0.4.tar.gz && tar -xzvf bing-ip2hosts-0.4.tar.gz && cp bing-ip2hosts-0.4/bing-ip2hosts /usr/local/bin/
        elif [[ $opcion21 = 6 ]]; then
            sudo apt install braa
        elif [[ $opcion21 = 7 ]]; then
            sudo apt install casefile
        elif [[ $opcion21 = 8 ]]; then
            sudo apt install cdpsnarf
        elif [[ $opcion21 = 9 ]]; then
            sudo apt install cisco-torch
        elif [[ $opcion21 = 10 ]]; then
            sudo apt install cookie-cadger
        elif [[ $opcion21 = 11 ]]; then
            sudo apt install copy-router-config
        elif [[ $opcion21 = 12 ]]; then
            sudo apt install dmitry
        elif [[ $opcion21 = 13 ]]; then
            sudo apt install dnmap
        elif [[ $opcion21 = 14 ]]; then
            sudo apt install dnsenum
        elif [[ $opcion21 = 15 ]]; then
            sudo apt install dnsmap
        elif [[ $opcion21 = 16 ]]; then
            sudo apt install dnsrecon
        elif [[ $opcion21 = 17 ]]; then
            sudo apt install dnstracer
        elif [[ $opcion21 = 18 ]]; then
            sudo apt install dnswalk
        elif [[ $opcion21 = 19 ]]; then
            sudo apt install dotdotpwn
        elif [[ $opcion21 = 20 ]]; then
            sudo apt install enum4linux
        elif [[ $opcion21 = 21 ]]; then
            sudo apt install enumiax
        elif [[ $opcion21 = 22 ]]; then
            sudo apt install exploitdb
        elif [[ $opcion21 = 23 ]]; then
            sudo apt install fierce
        elif [[ $opcion21 = 24 ]]; then
            sudo apt install firewalk
        elif [[ $opcion21 = 25 ]]; then
            sudo apt install fragroute
        elif [[ $opcion21 = 26 ]]; then
            sudo apt install fragrouter
        elif [[ $opcion21 = 27 ]]; then
            sudo apt install ghost-phisher
        elif [[ $opcion21 = 28 ]]; then
            sudo apt install golismero
        elif [[ $opcion21 = 29 ]]; then
            sudo apt install goofile
        elif [[ $opcion21 = 30 ]]; then
            sudo apt install lbd
        elif [[ $opcion21 = 31 ]]; then
            sudo apt install maltego-teeth
        elif [[ $opcion21 = 32 ]]; then
            sudo apt install masscan
        elif [[ $opcion21 = 33 ]]; then
            sudo apt install metagoofil
        elif [[ $opcion21 = 34 ]]; then
            sudo apt install miranda
        elif [[ $opcion21 = 35 ]]; then
            sudo apt install nmap
        elif [[ $opcion21 = 36 ]]; then
            echo -e "\n${redColour}[!]${endColour}${lightRed} Ntop no se puede descargar${endColour}${redColour} [!]${endColour}"
        elif [[ $opcion21 = 37 ]]; then
            sudo apt install p0f
        elif [[ $opcion21 = 38 ]]; then
            sudo apt install parsero
        elif [[ $opcion21 = 39 ]]; then
            sudo apt install recon-ng
        elif [[ $opcion21 = 40 ]]; then
            `sudo apt install set`
        elif [[ $opcion21 = 41 ]]; then
            sudo apt install smtp-user-enum
        elif [[ $opcion21 = 42 ]]; then
            sudo apt install snmpcheck
        elif [[ $opcion21 = 43 ]]; then
            sudo apt install sslcaudit
        elif [[ $opcion21 = 44 ]]; then
            sudo apt install sslsplit
        elif [[ $opcion21 = 45 ]]; then
            sudo apt install sslstrip
        elif [[ $opcion21 = 46 ]]; then
            sudo apt install sslyze
        elif [[ $opcion21 = 47 ]]; then
            sudo apt install thc-ipv6
        elif [[ $opcion21 = 48 ]]; then
            sudo apt install theharvester
        elif [[ $opcion21 = 49 ]]; then
            sudo apt install tlssled
        elif [[ $opcion21 = 50 ]]; then
            sudo apt install twofi
        elif [[ $opcion21 = 51 ]]; then
            sudo apt install urlcrazy
        elif [[ $opcion21 = 52 ]]; then
            sudo apt install wireshark
        elif [[ $opcion21 = 53 ]]; then
            sudo apt install wol-e
        elif [[ $opcion21 = 54 ]]; then
            sudo apt install xplico
        elif [[ $opcion21 = 55 ]]; then
            sudo apt install ismtp
        elif [[ $opcion21 = 56 ]]; then
            sudo apt install intrace
        elif [[ $opcion21 = 57 ]]; then
            sudo apt install hping3
        elif [[ $opcion21 = 0 ]]; then
            sudo apt install -y acccheck ace-voip amap automater braa casefile cdpsnarf cisco-torch cookie-cadger copy-router-config dmitry dnmap dnsenum dnsmap dnsrecon dnstracer dnswalk dotdotpwn enum4linux enumiax exploitdb fierce firewalk fragroute fragrouter ghost-phisher golismero goofile lbd maltego-teeth masscan metagoofil miranda nmap p0f parsero recon-ng set smtp-user-enum snmpcheck sslcaudit sslsplit sslstrip sslyze thc-ipv6 theharvester tlssled twofi urlcrazy wireshark wol-e xplico ismtp intrace hping3 && wget http://www.morningstarsecurity.com/downloads/bing-ip2hosts-0.4.tar.gz && tar -xzvf bing-ip2hosts-0.4.tar.gz && cp bing-ip2hosts-0.4/bing-ip2hosts /usr/local/bin/
        fi
    elif [[ $opcion2=2 ]]; then
        echo -e "
        ${grayColour}Análisis de Vulerabilidades${endColour}${greenColour}

[1] BBQSQL				[18] Nmap
[2] BED					[19] ohrwurm
[3] cisco-auditing-tool		        [20] openvas-administrator
[4] cisco-global-exploiter	        [21] openvas-cli
[5] cisco-ocs				[22] openvas-manager
[6] cisco-torch			        [23] openvas-scanner
[7] copy-router-config			[24] Oscanner
[8] commix				[25] Powerfuzzer
[9] DBPwAudit				[26] sfuzz
[10] DoonaDot				[27] SidGuesser
[11] DotPwn				[28] SIPArmyKnife
[12] Greenbone Security Assistant 	[29] sqlmap
[13] GSD				[30] Sqlninja
[14] HexorBase				[31] sqlsus
[15] Inguma				[32] THC-IPV6
[16] jSQL				[33] tnscmd10g
[17] Lynis				[34] unix-privesc-check
					[35] Yersinia

[0] Instalar todas las herramientas de AV
				 
						"
        echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion21
    elif [[ $opcion2=3 ]]; then
        echo -e "
        ${grayColour} Análisis de Aplicaciones Web${endColour}${greenColour}

[1] Aircrack-ng				[16] kalibrate-rtl
[2] Asleap				[17] KillerBee
[3] Bluelog				[18] Kismet
[4] BlueMaho				[19] mdk3
[5] Bluepot				[20] mfcuk
[6] BlueRanger				[21] mfoc
[7] Bluesnarfer				[22] mfterm
[8] Bully				[23] Multimon-NG
[9] coWPAtty				[24] PixieWPS
[10] crackle				[25] Reaver
[11] eapmd5pass				[26] redfang
[12] Fern Wifi Cracker			[27] RTLSDR Scanner
[13] Ghost Phisher			[28] Spooftooph
[14] GISKismet				[29] Wifi Honey
[15] gr-scan				[30] Wifite 

[0] Install todas las herramientas de WA"
    fi
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
    read opcion21
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
            sleep 0.5
            sudo apt update -y 2>/dev/null
            echo -ne "\n${yellowColour}[*]${endColour}${blueColour} ¿Tienes todos los paquetes actualizados?${endColour}${yellowColour} [S/N]: ${endColour}"
            read option
            if [[ $option = [Ss] ]]; then
                return 0;
            else
                echo -e "\n${yellowColour}[*]${endColour}${grayColour} Upgradeando sistema...${endColour}\n"
                sleep 0.5
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
        sleep 0.5
        if [ -z "$comando" ]; then
            echo -e "\n${yellowColour}[*]${endColour}${grayColour} No se detecto repositorios en sources.list, continuando...${endColour}\n"
            sleep 0.5
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
    sleep 0.5
    sed -i '/^$/d' /etc/apt/sources.list
    sed 's/  */&,/g' /etc/apt/sources.list| \
awk -v r=$awkGRAY -v g=$awkGREEN -v p=$awkPURPLE \
 '{printf p$1n r$2n g$3n"\n"}' FS=","
}

function BorrarRepositorios(){
    echo -e "\n${yellowColour}[*]${endColour}${blueColour} Borrando contenido del sources.list${endColour}"
    sleep 0.5
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
    elif [[ $opcion1 = 5 ]]; then
        sleep 0.5
        Principal
    else
        echo -e "\n${redColour}[!]${endColour}${lightRed} Introduce una opción correcta ${endColour}${redColour}[!]${endColour}\n"
        return 1
    fi
}

function Caso2(){
    MenuGlogal2
    if [[ $opciong2 = 1 ]]; then
        MenuOpcion21
    fi
}

# Main Program
Principal
while [[ $opcion != 4 ]]; do
    case $opcion in
        1) Caso1;;
        2) Caso2;;
        4) exit 0;;
    esac
done