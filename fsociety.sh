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
    echo -e "\n${purpleColour}[1]${endColour}${turquoiseColour} Instalar herramientas${endColour}\n\n${purpleColour}[2]${endColour}${turquoiseColour} Crackeo de contraseñas${endColour}\n\n${purpleColour}[3]${endColour}${turquoiseColour} Enumeración del Sistema${endColour}\n\n${purpleColour}[4]${endColour}${turquoiseColour} Volver atrás${endColour}\n"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
    read opciong2
}

function MenuOpcion21(){
    echo -e "
${purpleColour}[1]${endColour}${turquoiseColour} Recopilación de Información${endColour}                ${purpleColour}[8]${endColour}${turquoiseColour} Herramientas de Explotación${endColour}
${purpleColour}[2]${endColour}${turquoiseColour} Análisis de Vulnerabilidades${endColour}               ${purpleColour}[9]${endColour}${turquoiseColour} Sniffing & Spoofing${endColour}
${purpleColour}[3]${endColour}${turquoiseColour} Ataques a Redes Inalámbricas${endColour}               ${purpleColour}[10]${endColour}${turquoiseColour} Post Explotación${endColour}
${purpleColour}[4]${endColour}${turquoiseColour} Evaluación de Base de Datos${endColour}                ${purpleColour}[11]${endColour}${turquoiseColour} Análisis Forense${endColour}
${purpleColour}[5]${endColour}${turquoiseColour} Crackeo de contraseñas${endColour}                     ${purpleColour}[12]${endColour}${turquoiseColour} Herramientas de Reporte${endColour}
${purpleColour}[6]${endColour}${turquoiseColour} Ataques a Aplicaciones Web${endColour}                 ${purpleColour}[13]${endColour}${turquoiseColour} Hacking Hardware${endColour}
${purpleColour}[7]${endColour}${turquoiseColour} Ingeniería Inversa${endColour}${purpleColour}                         ${purpleColour}[14]${endColour}${turquoiseColour} Test de estrés${endColour}


${purpleColour}[0]${endColour}${turquoiseColour} Volver atrás${endColour}
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
[9] cisco-torch				        [38] Parsero
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
[99] Volver atrás				 
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
        elif [[ $opcion21 = 99 ]]; then
            MenuOpcion21
        elif [[ $opcion21 = 0 ]]; then
            sudo apt install -y acccheck ace-voip amap automater braa casefile cdpsnarf cisco-torch cookie-cadger copy-router-config dmitry dnmap dnsenum dnsmap dnsrecon dnstracer dnswalk dotdotpwn enum4linux enumiax exploitdb fierce firewalk fragroute fragrouter ghost-phisher golismero goofile lbd maltego-teeth masscan metagoofil miranda nmap p0f parsero recon-ng set smtp-user-enum snmpcheck sslcaudit sslsplit sslstrip sslyze thc-ipv6 theharvester tlssled twofi urlcrazy wireshark wol-e xplico ismtp intrace hping3 && wget http://www.morningstarsecurity.com/downloads/bing-ip2hosts-0.4.tar.gz && tar -xzvf bing-ip2hosts-0.4.tar.gz && cp bing-ip2hosts-0.4/bing-ip2hosts /usr/local/bin/
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi
    elif [[ $opcion2 = 2 ]]; then
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
[99] Volver atrás				 
						"
        echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion22
        if [[ $opcion22 = 1 ]]; then
            sudo apt install bbqsql
        elif [[ $opcion22 = 2 ]]; then
            sudo apt install bed
        elif [[ $opcion22 = 3 ]]; then
            sudo apt install cisco-auditing-tool
        elif [[ $opcion22 = 4 ]]; then
            sudo apt install cisco-global-exploiter
        elif [[ $opcion22 = 5 ]]; then
            sudo apt install cisco-ocs
        elif [[ $opcion22 = 6 ]]; then
            sudo apt install cisco-torch
        elif [[ $opcion22 = 7 ]]; then
            sudo apt install copy-router-config
        elif [[ $opcion22 = 8 ]]; then
            sudo apt install git && git clone https://github.com/stasinopoulos/commix.git commix && cd commix && python ./commix.py --install
        elif [[ $opcion22 = 9 ]]; then
            echo -e "${greenColour}Descarga inguma en : http://www.cqure.net/wp/tools/database/dbpwaudit/${endColour}"
        elif [[ $opcion22 = 10 ]]; then
            sudo apt install doona
        elif [[ $opcion22 = 11 ]]; then
            sudo apt install dotdotpwn
        elif [[ $opcion22 = 12 ]]; then
            sudo apt install greenbone-security-assistant
        elif [[ $opcion22 = 13 ]]; then
            sudo apt install git && git clone git://git.kali.org/packages/gsd.git
        elif [[ $opcion22 = 14 ]]; then
            sudo apt install hexorbase
        elif [[ $opcion22 = 15 ]]; then
            echo -e "${greenColour}Descarga inguma en : http://inguma.sourceforge.net${endColour}"
        elif [[ $opcion22 = 16 ]]; then
            sudo apt install jsql
        elif [[ $opcion22 = 17 ]]; then
            sudo apt install lynis
        elif [[ $opcion22 = 18 ]]; then
            sudo apt install nmap
        elif [[ $opcion22 = 19 ]]; then
            sudo apt install ohrwurm
        elif [[ $opcion22 = 20 ]]; then
            sudo apt install openvas-administrator
        elif [[ $opcion22 = 21 ]]; then
            sudo apt install openvas-cli
        elif [[ $opcion22 = 22 ]]; then
            sudo apt install openvas-manager
        elif [[ $opcion22 = 23 ]]; then
            sudo apt install openvas-scanner
        elif [[ $opcion22 = 24 ]]; then
            sudo apt install oscanner
        elif [[ $opcion22 = 25 ]]; then
            sudo apt install powerfuzzer
        elif [[ $opcion22 = 26 ]]; then
            sudo apt install sfuzz
        elif [[ $opcion22 = 27 ]]; then
            sudo apt install sidguesser
        elif [[ $opcion22 = 28 ]]; then
            sudo apt install siparmyknife
        elif [[ $opcion22 = 29 ]]; then
            sudo apt install sqlmap
        elif [[ $opcion22 = 30 ]]; then
            sudo apt install sqlninja
        elif [[ $opcion22 = 31 ]]; then
            sudo apt install sqlsus
        elif [[ $opcion22 = 32 ]]; then
            sudo apt install thc-ipv6
        elif [[ $opcion22 = 33 ]]; then
            sudo apt install tnscmd10g
        elif [[ $opcion22 = 34 ]]; then
            sudo apt install unix-privesc-check
        elif [[ $opcion22 = 35 ]]; then
            sudo apt install yersinia
        elif [[ $opcion22 = 0 ]]; then
            sudo apt install -y bbqsql bed cisco-auditing-tool cisco-global-exploiter cisco-ocs cisco-torch copy-router-config doona dotdotpwn greenbone-security-assistant hexorbase jsql lynis nmap ohrwurm openvas-cli openvas-manager openvas-scanner oscanner powerfuzzer sfuzz sidguesser siparmyknife sqlmap sqlninja sqlsus thc-ipv6 tnscmd10g unix-privesc-check yersinia
        elif [[ $opcion22 = 99 ]]; then
            MenuOpcion21
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi

    elif [[ $opcion2 = 3 ]]; then
        echo -e "
        ${grayColour} Ataque a Redes Inalámbricas${endColour}${greenColour}

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

[0] Instalar todas las herramientas de WA
[99] Volver atrás"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion23
        if [[ $opcion23 = 1 ]]; then
            sudo apt install aircrack-ng
        elif [[ $opcion23 = 2 ]]; then
            sudo apt install asleap
        elif [[ $opcion23 = 3 ]]; then
            sudo apt install bluelog
        elif [[ $opcion23 = 4 ]]; then
            sudo apt install git && git clone git://git.kali.org/packages/bluemaho.git
        elif [[ $opcion23 = 5 ]]; then
            sudo apt install git && git clone git://git.kali.org/packages/bluepot.git
        elif [[ $opcion23 = 6 ]]; then
            sudo apt install blueranger
        elif [[ $opcion23 = 7 ]]; then
            sudo apt install bluesnarfer
        elif [[ $opcion23 = 8 ]]; then
            sudo apt install bully
        elif [[ $opcion23 = 9 ]]; then
            sudo apt install cowpatty
        elif [[ $opcion23 = 10 ]]; then
            sudo apt install crackle
        elif [[ $opcion23 = 11 ]]; then
            sudo apt install eapmd5pass
        elif [[ $opcion23 = 12 ]]; then
            sudo apt install fern-wifi-cracker
        elif [[ $opcion23 = 13 ]]; then
            sudo apt install ghost-phisher
        elif [[ $opcion23 = 14 ]]; then
            sudo apt install giskismet
        elif [[ $opcion23 = 15 ]]; then
            sudo apt install git && git clone git://git.kali.org/packages/gr-scan.git
        elif [[ $opcion23 = 16 ]]; then
            sudo apt install kalibrate-rtl
        elif [[ $opcion23 = 17 ]]; then
            sudo apt install killerbee
        elif [[ $opcion23 = 18 ]]; then
            sudo apt install kismet
        elif [[ $opcion23 = 19 ]]; then
            sudo apt install mdk3
        elif [[ $opcion23 = 20 ]]; then
            sudo apt install mfcuk
        elif [[ $opcion23 = 21 ]]; then
            sudo apt install mfoc
        elif [[ $opcion23 = 22 ]]; then
            sudo apt install mfterm
        elif [[ $opcion23 = 23 ]]; then
            sudo apt install multimon-ng
        elif [[ $opcion23 = 24 ]]; then
            sudo apt install pixiewps
        elif [[ $opcion23 = 25 ]]; then
            sudo apt install reaver
        elif [[ $opcion23 = 26 ]]; then
            sudo apt install redfang
        elif [[ $opcion23 = 27 ]]; then
            sudo apt install rtlsdr-scanner
        elif [[ $opcion23 = 28 ]]; then
            sudo apt install spooftooph
        elif [[ $opcion23 = 29 ]]; then
            sudo apt install wifi-honey
        elif [[ $opcion23 = 30 ]]; then
            sudo apt install wifitap
        elif [[ $opcion23 = 31 ]]; then
            sudo apt install wifite
        elif [[ $opcion23 = 0 ]]; then
            sudo apt install -y aircrack-ng asleap bluelog blueranger bluesnarfer bully cowpatty crackle eapmd5pass fern-wifi-cracker ghost-phisher giskismet gqrx kalibrate-rtl killerbee kismet mdk3 mfcuk mfoc mfterm multimon-ng pixiewps reaver redfang spooftooph wifi-honey wifitap wifite
        elif [[ $opcion23 = 99 ]]; then
            sleep 0.5
            MenuOpcion21
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi
    
    elif [[ $opcion2 = 4 ]]; then
        echo -e "
        ${grayColour} Evaluación de Base de Datos${endColour}${greenColour}

[1] jSQL
[2] mdb-sql
[3] oscanner
[4] sidguesser
[5] sqldict	
[6] SQLite
[7] sqlmap
[8] sqlninja-ng
[9] sqlsus
[10] tnscmd10g

[0] Instalar todas las herramientas de Evaluación
[99] Volver atrás"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion22
        if [[ $opcion22 = 1 ]]; then
            sudo apt install jsql
        elif [[ $opcion22 = 2 ]]; then
            sudo apt install mdbtools
        elif [[ $opcion22 = 3 ]]; then
            sudo apt install oscanner
        elif [[ $opcion22 = 4 ]]; then
            sudo apt install sidguesser
        elif [[ $opcion22 = 5 ]]; then
            sudo apt install sqldict
        elif [[ $opcion22 = 6 ]]; then
            sudo apt install sqlite
        elif [[ $opcion22 = 7 ]]; then
            sudo apt install sqlmap
        elif [[ $opcion22 = 8 ]]; then
            sudo apt install sqlninja
        elif [[ $opcion22 = 9 ]]; then
            sudo apt install sqlsus
        elif [[ $opcion22 = 10 ]]; then
            sudo apt install tnscmd10g
        elif [[ $opcion22 = 0 ]]; then
            sudo apt install -y jsql mdbtools oscanner sidguesser sqldict sqlite sqlmap sqlninja sqlsus tnscmd10g
        elif [[ $opcion22 = 99 ]]; then
            sleep 0.5
            MenuOpcion21
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi
    elif [[ $opcion2 = 5 ]]; then
        echo -e "
        ${grayColour} Crackeo de contraseñas${endColour}${greenColour}

[1] acccheck				[19] Maskprocessor
[2] Burp Suite				[20] multiforcer
[3] CeWL				[21] Ncrack
[4] chntpw				[22] oclgausscrack
[5] cisco-auditing-tool			[23] PACK
[6] CmosPwd				[24] patator
[7] creddump				[25] phrasendrescher
[8] crunch				[26] polenum
[9] DBPwAudit				[27] RainbowCrack
[10] findmyhash				[28] rcracki-mt
[11] gpp-decrypt			[29] RSMangler
[12] hash-identifier			[30] SQLdict
[13] HexorBase				[31] Statsprocessor
[14] THC-Hydra				[32] THC-pptp-bruter
[15] John the Ripper			[33] TrueCrack
[16] Johnny				[34] WebScarab 
[17] keimpx				[35] wordlists 
[18] Maltego Teeth			[36] zaproxy 

[0] Instalar todas las herramientas de PA
[99] Volver atrás"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion25
        if [[ $opcion25 = 1 ]]; then
            sudo apt install acccheck
        elif [[ $opcion25 = 2 ]]; then
            sudo apt install burpsuite
        elif [[ $opcion25 = 3 ]]; then
            sudo apt install cewl
        elif [[ $opcion25 = 4 ]]; then
            sudo apt install chntpw
        elif [[ $opcion25 = 5 ]]; then
            sudo apt install cisco-auditing-tool
        elif [[ $opcion25 = 6 ]]; then
            sudo apt install cmospwd
        elif [[ $opcion25 = 7 ]]; then
            sudo apt install creddump
        elif [[ $opcion25 = 8 ]]; then
            sudo apt install crunch
        elif [[ $opcion25 = 9 ]]; then
            sudo apt install git && git clone git://git.kali.org/packages/dbpwaudit.git
        elif [[ $opcion25 = 10 ]]; then
            sudo apt install findmyhash
        elif [[ $opcion25 = 11 ]]; then
            sudo apt install gpp-decrypt
        elif [[ $opcion25 = 12 ]]; then
            sudo apt install hash-identifier
        elif [[ $opcion25 = 13 ]]; then
            sudo apt install hexorbase
        elif [[ $opcion25 = 14 ]]; then
            sudo apt install hydra
        elif [[ $opcion25 = 15 ]]; then
            sudo apt install john
        elif [[ $opcion25 = 16 ]]; then
            sudo apt install johnny
        elif [[ $opcion25 = 17 ]]; then
            sudo apt install keimpx
        elif [[ $opcion25 = 18 ]]; then
            sudo apt install maltego-teeth
        elif [[ $opcion25 = 19 ]]; then
            sudo apt install maskprocessor
        elif [[ $opcion25 = 20 ]]; then
            sudo apt install multiforcer
        elif [[ $opcion25 = 21 ]]; then
            sudo apt install ncrack
        elif [[ $opcion25 = 22 ]]; then
            sudo apt install oclgausscrack
        elif [[ $opcion25 = 23 ]]; then
            sudo apt install pack
        elif [[ $opcion25 = 24 ]]; then
            sudo apt install patator
        elif [[ $opcion25 = 25 ]]; then
            echo -e "${greenColour}Descarga phrasendrescher en : https://www.leidecker.info/projects/phrasendrescher/index.shtml${endColour}" 
        elif [[ $opcion25 = 26 ]]; then
            sudo apt install polenum
        elif [[ $opcion25 = 27 ]]; then
            sudo apt install rainbowcrack
        elif [[ $opcion25 = 28 ]]; then
            sudo apt install rcracki-mt
        elif [[ $opcion25 = 29 ]]; then
            sudo apt install rsmangler
        elif [[ $opcion25 = 30 ]]; then
            sudo apt install sqldict
        elif [[ $opcion25 = 31 ]]; then
            sudo apt install statsprocessor
        elif [[ $opcion25 = 32 ]]; then
            sudo apt install thc-pptp-bruter
        elif [[ $opcion25 = 33 ]]; then
            sudo apt install truecrack
        elif [[ $opcion25 = 34 ]]; then
            sudo apt install webscarab
        elif [[ $opcion25 = 35 ]]; then
            sudo apt install wordlists
        elif [[ $opcion25 = 36 ]]; then
            sudo apt install zaproxy
        elif [[ $opcion25 = 0 ]]; then
            sudo apt install -y acccheck burpsuite cewl chntpw cisco-auditing-tool cmospwd creddump crunch findmyhash gpp-decrypt hash-identifier hexorbase john johnny keimpx maltego-teeth maskprocessor multiforcer ncrack oclgausscrack pack patator polenum rainbowcrack rcracki-mt rsmangler statsprocessor thc-pptp-bruter truecrack webscarab wordlists zaproxy
        elif [[ $opcion25 = 99 ]]; then
            sleep 0.5
            MenuOpcion21
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi
    elif [[ $opcion2 = 6 ]]; then
        echo -e "
        ${grayColour} Ataques a Aplicaciones Web${endColour}${greenColour}

[1] apache-users			[21] Parsero
[2] Arachni				[22] plecost
[3] BBQSQL				[23] Powerfuzzer
[4] BlindElephant			[24] ProxyStrike
[5] Burp Suite				[25] Recon-ng
[6] commix				[26] Skipfish
[7] CutyCapt				[27] sqlmap
[8] DAVTest				[28] Sqlninja
[9] deblaze				[29] sqlsus
[10] DIRB				[30] ua-tester
[11] DirBuster				[31] Uniscan
[12] fimap				[32] Vega
[13] FunkLoad				[33] w3af
[14] Grabber				[34] WebScarab
[15] jboss-autopwn			[35] Webshag
[16] joomscan				[36] WebSlayer
[17] jSQL				[37] WebSploit
[18] Maltego Teeth			[38] Wfuzz
[19] PadBuster				[39] WPScan
[20] Paros				[40] XSSer
					[41] zaproxy

[0] Instalar todas las herramientas de PA
[99] Volver atrás"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion26
        if [[ $opcion26 = 1 ]]; then
            sudo apt install apache-users
        elif [[ $opcion26 = 2 ]]; then
            sudo apt install arachni
        elif [[ $opcion26 = 3 ]]; then
            sudo apt install bbqsql
        elif [[ $opcion26 = 4 ]]; then
            sudo apt install blindelephant
        elif [[ $opcion26 = 5 ]]; then
            sudo apt install burpsuite
        elif [[ $opcion26 = 6 ]]; then
            sudo apt install cutycapt
        elif [[ $opcion26 = 7 ]]; then
            sudo apt install git && git clone https://github.com/stasinopoulos/commix.git commix && cd commix && python ./commix.py --install
        elif [[ $opcion26 = 8 ]]; then
            sudo apt install davtest
        elif [[ $opcion26 = 9 ]]; then
            sudo apt install deblaze
        elif [[ $opcion26 = 10 ]]; then
            sudo apt install dirb
        elif [[ $opcion26 = 11 ]]; then
            sudo apt install dirbuster
        elif [[ $opcion26 = 12 ]]; then
            sudo apt install fimap
        elif [[ $opcion26 = 13 ]]; then
            sudo apt install funkload
        elif [[ $opcion26 = 14 ]]; then
            sudo apt install grabber
        elif [[ $opcion26 = 15 ]]; then
            sudo apt install jboss-autopwn
        elif [[ $opcion26 = 16 ]]; then
            sudo apt install joomscan
        elif [[ $opcion26 = 17 ]]; then
            sudo apt install jsql
        elif [[ $opcion26 = 18 ]]; then
            sudo apt install maltego-teeth
        elif [[ $opcion26 = 19 ]]; then
            sudo apt install padbuster
        elif [[ $opcion26 = 20 ]]; then
            sudo apt install paros
        elif [[ $opcion26 = 21 ]]; then
            sudo apt install parsero
        elif [[ $opcion26 = 22 ]]; then
            sudo apt install plecost
        elif [[ $opcion26 = 23 ]]; then
            sudo apt install powerfuzzer
        elif [[ $opcion26 = 24 ]]; then
            sudo apt install proxystrike
        elif [[ $opcion26 = 25 ]]; then
            sudo apt install recon-ng
        elif [[ $opcion26 = 26 ]]; then
            sudo apt install skipfish
        elif [[ $opcion26 = 27 ]]; then
            sudo apt install sqlmap
        elif [[ $opcion26 = 28 ]]; then
            sudo apt install sqlninja
        elif [[ $opcion26 = 29 ]]; then
            sudo apt install sqlsus
        elif [[ $opcion26 = 30 ]]; then
            sudo apt install ua-tester
        elif [[ $opcion26 = 31 ]]; then
            sudo apt install uniscan
        elif [[ $opcion26 = 32 ]]; then
            sudo apt install vega
        elif [[ $opcion26 = 33 ]]; then
            sudo apt install w3af
        elif [[ $opcion26 = 34 ]]; then
            sudo apt install webscarab
        elif [[ $opcion26 = 35 ]]; then
            echo -e "\n${redColour}[!]${endColour}${lightRed} Webshang no se puede descargar${endColour}${redColour} [!]${endColour}"
        elif [[ $opcion26 = 36 ]]; then
            sudo apt install git && git clone git://git.kali.org/packages/webslayer.git
        elif [[ $opcion26 = 37 ]]; then
            sudo apt install websploit
        elif [[ $opcion26 = 38 ]]; then
            sudo apt install wfuzz
        elif [[ $opcion26 = 39 ]]; then
            sudo apt install wpscan
        elif [[ $opcion26 = 40 ]]; then
            sudo apt install xsser
        elif [[ $opcion26 = 41 ]]; then
            sudo apt install zaproxy
        elif [[ $opcion26 = 0 ]]; then
            sudo apt install -y apache-users arachni bbqsql blindelephant burpsuite cutycapt davtest deblaze dirb dirbuster fimap funkload grabber jboss-autopwn joomscan jsql maltego-teeth padbuster paros parsero plecost powerfuzzer proxystrike recon-ng skipfish sqlmap sqlninja sqlsus ua-tester uniscan vega w3af webscarab websploit wfuzz wpscan xsser zaproxy
        elif [[ $opcion26 = 99 ]]; then
            sleep 0.5
            MenuOpcion21
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi
    elif [[ $opcion2 = 7 ]]; then
        echo -e "
        ${grayColour} Ingeniería Inversa${endColour}${greenColour}

[1] apktool
[2] dex2jar
[3] diStorm3
[4] edb-debugger
[5] jad	
[6] javasnoop
[7] JD-GUI
[8] OllyDbg
[9] smali
[10] Valgrind
[11] YARA

[0] Instalar todas las herramientas de II
[99] Volver atrás"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion27
        if [[ $opcion27 = 1 ]]; then
            sudo apt install apktool
        elif [[ $opcion27 = 2 ]]; then
            sudo apt install dex2jar
        elif [[ $opcion27 = 3 ]]; then
            sudo apt install python-diStorm3
        elif [[ $opcion27 = 4 ]]; then
            sudo apt install edb-debugger
        elif [[ $opcion27 = 5 ]]; then
            sudo apt install jad
        elif [[ $opcion27 = 6 ]]; then
            sudo apt install javasnoop
        elif [[ $opcion27 = 7 ]]; then
            sudo apt install JD
        elif [[ $opcion27 = 8 ]]; then
            sudo apt install OllyDbg
        elif [[ $opcion27 = 9 ]]; then
            sudo apt install smali
        elif [[ $opcion27 = 10 ]]; then
            sudo apt install Valgrind
        elif [[ $opcion27 = 11 ]]; then
            sudo apt install YARA
        elif [[ $opcion27 = 0 ]]; then
            sudo apt install -y apktool dex2jar python-diStorm3 edb-debugger jad javasnoop JD OllyDbg smali Valgrind YARA
        elif [[ $opcion27 = 99 ]]; then
            sleep 0.5
            MenuOpcion21
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi
    elif [[ $opcion2 = 8 ]]; then
        echo -e "
        ${grayColour} Herramientas de Explotación${endColour}${greenColour}

[1] Armitage				        [10] jboss-autopwn
[2] Backdoor Factory				[11] Linux Exploit Suggester
[3] BeEF				        [12] Maltego Teeth
[4] cisco-auditing-tool				[13] SET
[5] cisco-global-exploiter			[14] ShellNoob
[6] cisco-ocs				        [15] sqlmap
[7] cisco-torch				        [16] THC-IPV6
[8] commix				        [17] Yersinia
[9] crackle

[0] Instalar todas las herramientas de Explotación
[99] Volver atrás"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion28
        if [[ $opcion28 = 1 ]]; then
            sudo apt install armitage
        elif [[ $opcion28 = 2 ]]; then
            sudo apt install backdoor-factory
        elif [[ $opcion28 = 3 ]]; then
            sudo apt install beef-xss
        elif [[ $opcion28 = 4 ]]; then
            sudo apt install cisco-auditing-tool
        elif [[ $opcion28 = 5 ]]; then
            sudo apt install cisco-global-exploiter
        elif [[ $opcion28 = 6 ]]; then
            sudo apt install cisco-ocs
        elif [[ $opcion28 = 7 ]]; then
            sudo apt install cisco-torch
        elif [[ $opcion28 = 8 ]]; then
            sudo apt install git && git clone https://github.com/stasinopoulos/commix.git commix && cd commix && python ./commix.py --install
        elif [[ $opcion28 = 9 ]]; then
            sudo apt install crackle
        elif [[ $opcion28 = 10 ]]; then
            sudo apt install jboss-autopwn
        elif [[ $opcion28 = 11 ]]; then
            sudo apt install linux-exploit-suggester
        elif [[ $opcion28 = 12 ]]; then
            sudo apt install maltego-teeth
        elif [[ $opcion28 = 13 ]]; then
            `sudo apt install set`
        elif [[ $opcion28 = 14 ]]; then
            sudo apt install shellnoob
        elif [[ $opcion28 = 15 ]]; then
            sudo apt install sqlmap
        elif [[ $opcion28 = 16 ]]; then
            sudo apt install thc-ipv6
        elif [[ $opcion28 = 17 ]]; then
            sudo apt install yersinia
        elif [[ $opcion28 = 0 ]]; then
            sudo apt install -y armitage backdoor-factory cisco-auditing-tool cisco-global-exploiter cisco-ocs cisco-torch crackle jboss-autopwn linux-exploit-suggester maltego-teeth set shellnoob sqlmap thc-ipv6 yersinia beef-xss
        elif [[ $opcion28 = 99 ]]; then
            sleep 0.5
            MenuOpcion21
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi
    elif [[ $opcion2 = 9 ]]; then
        echo -e "
        ${grayColour} Sniffing & Spoofing${endColour}${greenColour}

[1] Burp Suite				[17] rtpmixsound
[2] DNSChef				[18] sctpscan
[3] fiked				[19] SIPArmyKnife
[4] hamster-sidejack			[20] SIPp
[5] HexInject				[21] SIPVicious
[6] iaxflood				[22] SniffJoke
[7] inviteflood				[23] SSLsplit
[8] iSMTP				[24] sslstrip
[9] isr-evilgrade			[25] THC-IPV6
[10] mitmproxy				[26] VoIPHopper
[11] ohrwurm				[27] WebScarab
[12] protos-sip				[28] Wifi Honey
[13] rebind				[29] Wireshark
[14] responder				[30] xspy
[15] rtpbreak				[31] Yersinia
[16] rtpinsertsound			[32] zaproxy 

[0] Instalar todas las herramientas de Sniffing
[99] Volver atrás"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion29
        if [[ $opcion29 = 1 ]]; then
            sudo apt install burpsuite
        elif [[ $opcion29 = 2 ]]; then
            sudo apt install dnschef
        elif [[ $opcion29 = 3 ]]; then
	        sudo apt install fiked
        elif [[ $opcion29 = 4 ]]; then
            sudo apt install hamster-sidejack
        elif [[ $opcion29 = 5 ]]; then
            sudo apt install hexinject
        elif [[ $opcion29 = 6 ]]; then
            sudo apt install iaxflood
        elif [[ $opcion29 = 7 ]]; then
            sudo apt install inviteflood
        elif [[ $opcion29 = 8 ]]; then
            sudo apt install ismtp
        elif [[ $opcion29 = 9 ]]; then
            sudo apt install git && git clone git://git.kali.org/packages/isr-evilgrade.git
        elif [[ $opcion29 = 10 ]]; then
            sudo apt install mitmproxy
        elif [[ $opcion29 = 11 ]]; then
            sudo apt install ohrwurm
        elif [[ $opcion29 = 12 ]]; then
            sudo apt install protos-sip
        elif [[ $opcion29 = 13 ]]; then
            sudo apt install rebind
        elif [[ $opcion29 = 14 ]]; then
            sudo apt install responder
        elif [[ $opcion29 = 15 ]]; then
            sudo apt install rtpbreak
        elif [[ $opcion29 = 16 ]]; then
            sudo apt install rtpinsertsound
        elif [[ $opcion29 = 17 ]]; then
            sudo apt install rtpmixsound
        elif [[ $opcion29 = 18 ]]; then
            sudo apt install sctpscan
        elif [[ $opcion29 = 19 ]]; then
            sudo apt install siparmyknife
        elif [[ $opcion29 = 20 ]]; then
            sudo apt install sipp
        elif [[ $opcion29 = 21 ]]; then
            sudo apt install sipvicious
        elif [[ $opcion29 = 22 ]]; then
            sudo apt install sniffjoke
        elif [[ $opcion29 = 23 ]]; then
            sudo apt install sslsplit
        elif [[ $opcion29 = 24 ]]; then
            sudo apt install sslstrip
        elif [[ $opcion29 = 25 ]]; then
            sudo apt install thc-ipv6
        elif [[ $opcion29 = 26 ]]; then
            sudo apt install voiphopper
        elif [[ $opcion29 = 27 ]]; then
            sudo apt install webscarab
        elif [[ $opcion29 = 28 ]]; then
            sudo apt install wifi-honey
        elif [[ $opcion29 = 29 ]]; then
            sudo apt install wireshark
        elif [[ $opcion29 = 30 ]]; then
            sudo apt install xspy
        elif [[ $opcion29 = 31 ]]; then
            sudo apt install yersinia
        elif [[ $opcion29 = 32 ]]; then
            sudo apt install zaproxy
        elif [[ $opcion29 = 0 ]]; then
            sudo apt install -y burpsuite dnschef fiked hamster-sidejack hexinject iaxflood inviteflood ismtp mitmproxy ohrwurm protos-sip rebind responder rtpbreak rtpinsertsound rtpmixsound sctpscan siparmyknife sipp sipvicious sniffjoke sslsplit sslstrip thc-ipv6 voiphopper webscarab wifi-honey wireshark xspy yersinia zaproxy
        elif [[ $opcion29 = 99 ]]; then
            sleep 0.5
            MenuOpcion21
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi
    elif [[ $opcion2 = 10 ]]; then
        echo -e "
        ${grayColour} Post Explotación${endColour}${greenColour}

[1] CryptCat				[9] polenum
[2] Cymothoa				[10] PowerSploit
[3] dbd				        [11] pwnat
[4] dns2tcp			        [12] RidEnum
[5] http-tunnel				[13] sbd
[6] HTTPTunnel				[14] U3-Pwn
[7] Intersect				[15] Webshells
[8] Nishang				[16] Weevely

[0] Instalar todas las herramientas de PE
[99] Volver atrás"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion210
        if [[ $opcion210 = 1 ]]; then
            sudo apt install cryptcat
        elif [[ $opcion210 = 2 ]]; then
            sudo apt install cymothoa
        elif [[ $opcion210 = 3 ]]; then
            sudo apt install dbd
        elif [[ $opcion210 = 4 ]]; then
            sudo apt install dns2tcp
        elif [[ $opcion210 = 5 ]]; then
            sudo apt install http-tunnel
        elif [[ $opcion210 = 6 ]]; then
            sudo apt install httptunnel
        elif [[ $opcion210 = 7 ]]; then
            sudo apt install intersect
        elif [[ $opcion210 = 8 ]]; then
            sudo apt install nishang
        elif [[ $opcion210 = 9 ]]; then
            sudo apt install polenum
        elif [[ $opcion210 = 10 ]]; then
            sudo apt install powersploit
        elif [[ $opcion210 = 11 ]]; then
            sudo apt install pwnat
        elif [[ $opcion210 = 12 ]]; then
            sudo apt install ridenum
        elif [[ $opcion210 = 13 ]]; then
            sudo apt install sbd
        elif [[ $opcion210 = 14 ]]; then
            sudo apt install u3-pwn
        elif [[ $opcion210 = 15 ]]; then
            sudo apt install webshells
        elif [[ $opcion210 = 16 ]]; then
            sudo apt install weevely
        elif [[ $opcion210 = 0 ]]; then
            sudo apt install -y cryptcat cymothoa dbd dns2tcp http-tunnel httptunnel intersect nishang polenum powersploit pwnat ridenum sbd u3-pwn webshells weevely
        elif [[ $opcion210 = 99 ]]; then
            sleep 0.5
            MenuOpcion21
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi
    elif [[ $opcion2 = 11 ]]; then
        echo -e "
        ${grayColour} Análisis Forense${endColour}${greenColour}

[1] Binwalk                             [13] Galleta
[2] bulk-extractor                      [14] Guymager
[3] Capstone                            [15] iPhone Backup Analyzer
[4] chntpw                              [16] p0f
[5] Cuckoo                              [17] pdf-parser
[6] dc3dd                               [18] pdfid
[7] ddrescue                            [19] pdgmail
[8] DFF                                 [20] peepdf
[9] diStorm3                            [21] RegRipper
[10] Dumpzilla                          [22] Volatility
[11] extundelete                        [23] Xplico
[12] Foremost

[0] Instalar todas las herramientas de AF
[99] Volver atrás"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion211
        if [[ $opcion211 = 1 ]]; then
            sudo apt install binwalk
        elif [[ $opcion211 = 2 ]]; then
            sudo apt install bulk-extractor
        elif [[ $opcion211 = 3 ]]; then
	        sudo apt install git && git clone git://git.kali.org/packages/capstone.git
        elif [[ $opcion211 = 4 ]]; then
            sudo apt install chntpw
        elif [[ $opcion211 = 5 ]]; then
            sudo apt install cuckoo
        elif [[ $opcion211 = 6 ]]; then
            sudo apt install dc3dd
        elif [[ $opcion211 = 7 ]]; then
            sudo apt install ddrescue
        elif [[ $opcion211 = 8 ]]; then
            echo -e "\n${redColour}[!]${endColour}${lightRed} Dff no se puede descargar${endColour}${redColour} [!]${endColour}"
        elif [[ $opcion211 = 9 ]]; then
            sudo apt install git && git clone git://git.kali.org/packages/distorm3.git
        elif [[ $opcion211 = 10 ]]; then
            sudo apt install dumpzilla
        elif [[ $opcion211 = 11 ]]; then
            sudo apt install extundelete
        elif [[ $opcion211 = 12 ]]; then
            sudo apt install foremost
        elif [[ $opcion211 = 13 ]]; then
            sudo apt install galleta
        elif [[ $opcion211 = 14 ]]; then
            sudo apt install guymager
        elif [[ $opcion211 = 15 ]]; then
            sudo apt install iphone-backup-analyzer
        elif [[ $opcion211 = 16 ]]; then
            sudo apt install p0f
        elif [[ $opcion211 = 17 ]]; then
            sudo apt install pdf-parser
        elif [[ $opcion211 = 18 ]]; then
            sudo apt install pdfid
        elif [[ $opcion211 = 19 ]]; then
            sudo apt install pdgmail
        elif [[ $opcion211 = 20 ]]; then
            sudo apt install peepdf
        elif [[ $opcion211 = 21 ]]; then
            echo -e "\n${redColour}[!]${endColour}${lightRed} Regripper no se puede descargar${endColour}${redColour} [!]${endColour}" 
        elif [[ $opcion211 = 22 ]]; then
            sudo apt install volatility
        elif [[ $opcion211 = 23 ]]; then
            sudo apt install xplico
        elif [[ $opcion211 = 0 ]]; then
            sudo apt install -y binwalk bulk-extractor chntpw cuckoo dc3dd ddrescue dumpzilla extundelete foremost galleta guymager iphone-backup-analyzer p0f pdf-parser pdfid pdgmail peepdf volatility xplico
        elif [[ $opcion211 = 99 ]]; then
            sleep 0.5
            MenuOpcion21
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi
    elif [[ $opcion2 = 12 ]]; then
        echo -e "
        ${grayColour} Herramientas de Reporte${endColour}${greenColour}

[1] CaseFile
[2] CutyCapt
[3] dos2unix
[4] Dradis
[5] KeepNote	
[6] MagicTree
[7] Metagoofil
[8] Nipper-ng
[9] pipal

[0] Instalar todas las herramientas de Reporte
[99] Volver atrás"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion212
        if [[ $opcion212 = 1 ]]; then
            sudo apt install casefile
        elif [[ $opcion212 = 2 ]]; then
            sudo apt install cutycapt
        elif [[ $opcion212 = 3 ]]; then
            sudo apt install dos2unix
        elif [[ $opcion212 = 4 ]]; then
            sudo apt install dradis
        elif [[ $opcion212 = 5 ]]; then
            sudo apt install keepnote
        elif [[ $opcion212 = 6 ]]; then
            sudo apt install magictree
        elif [[ $opcion212 = 7 ]]; then
            sudo apt install metagoofil
        elif [[ $opcion212 = 8 ]]; then
            sudo apt install nipper-ng
        elif [[ $opcion212 = 9 ]]; then
            sudo apt install pipal
        elif [[ $opcion212 = 0 ]]; then
            sudo apt install -y casefile cutycapt dos2unix dradis keepnote magictree metagoofil nipper-ng pipal
        elif [[ $opcion212 = 99 ]]; then
            sleep 0.5
            MenuOpcion21
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi
    elif [[ $opcion2 = 13 ]]; then
        echo -e "
        ${grayColour} Hacking Hardware${endColour}${greenColour}

[1] android-sdk
[2] apktool
[3] Arduino
[4] dex2jar
[5] Sakis3G	
[6] smali

[0] Instalar todas las herramientas de Hacking Hardware
[99] Volver atrás"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion213
        if [[ $opcion213 = 1 ]]; then
            sudo apt install android-sdk
        elif [[ $opcion213 = 2 ]]; then
            sudo apt install apktool
        elif [[ $opcion213 = 3 ]]; then
            sudo apt install arduino
        elif [[ $opcion213 = 4 ]]; then
            sudo apt install dex2jar
        elif [[ $opcion213 = 5 ]]; then
            sudo apt install sakis3g
        elif [[ $opcion213 = 6 ]]; then
            sudo apt install smali
        elif [[ $opcion213 = 0 ]]; then
            sudo apt install -y android-sdk apktool arduino dex2jar sakis3g smali
        elif [[ $opcion213 = 99 ]]; then
            sleep 0.5
            MenuOpcion21
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi
    elif [[ $opcion2 = 14 ]]; then
        echo -e "
        ${grayColour} Test de estrés${endColour}${greenColour}

[1] DHCPig                              [8] Reaver
[2] FunkLoad                            [9] rtpflood
[3] iaxflood                            [10] SlowHTTPTest
[4] Inundator                           [11] t50
[5] inviteflood                         [12] Termineter
[6] ipv6-toolkit                        [13] THC-IPV6
[7] mdk3                                [14] THC-SSL-DOS

[0] Instalar todas las herramientas de Estrés
[99] Volver atrás"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read opcion214
        if [[ $opcion214 = 1 ]]; then
            sudo apt install dhcpig
        elif [[ $opcion214 = 2 ]]; then
            sudo apt install funkload
        elif [[ $opcion214 = 3 ]]; then
	        sudo apt install iaxflood
        elif [[ $opcion214 = 4 ]]; then
            sudo apt install git && git clone git://git.kali.org/packages/inundator.git
        elif [[ $opcion214 = 5 ]]; then
            sudo apt install inviteflood
        elif [[ $opcion214 = 6 ]]; then
            sudo apt install ipv6-toolkit
        elif [[ $opcion214 = 7 ]]; then
            sudo apt install mdk3
        elif [[ $opcion214 = 8 ]]; then
            sudo apt install reaver
        elif [[ $opcion214 = 9 ]]; then
            sudo apt install rtpflood
        elif [[ $opcion214 = 10 ]]; then
            sudo apt install slowhttptest
        elif [[ $opcion214 = 11 ]]; then
            sudo apt install t50
        elif [[ $opcion214 = 12 ]]; then
            sudo apt install termineter
        elif [[ $opcion214 = 13 ]]; then
            sudo apt install thc-ipv6
        elif [[ $opcion214 = 14 ]]; then
            sudo apt install thc-ssl-dos
        elif [[ $opcion214 = 0 ]]; then
            sudo apt install -y dhcpig funkload iaxflood inviteflood ipv6-toolkit mdk3 reaver rtpflood slowhttptest t50 termineter thc-ipv6 thc-ssl-dos
        elif [[ $opcion214 = 99 ]]; then
            sleep 0.5
            MenuOpcion21
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi

    elif [[ $opcion2 = 0 ]]; then
        Principal
    fi
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
    read opcionact
    if [[ $opcionact = [Ss] ]]; then
        echo -e "\n${yellowColour}[*]${endColour}${grayColour} Actualizando sistema...${endColour}\n"
        while true; do
            sleep 0.5
            sudo apt update -y 2>/dev/null
            echo -ne "\n${yellowColour}[*]${endColour}${blueColour} ¿Tienes todos los paquetes actualizados?${endColour}${yellowColour} [S/N]: ${endColour}"
            read option
            if [[ $option = [Ss] ]]; then
                echo -e "\n${yellowColour}[*]${endColour}${grayColour} Siguiendo con la actualización...${endColour}\n"
            else
                echo -e "\n${yellowColour}[*]${endColour}${grayColour} Upgradeando sistema...${endColour}\n"
                sleep 0.5
                sudo apt upgrade -y 2>/dev/null
            fi
            echo -ne "\n${yellowColour}[*]${endColour}${blueColour} ¿Ha ocurrido algún error con la clave pública?${endColour}${yellowColour} [S/N]: ${endColour}"
            read keyoption
            if [[ $keyoption = [Ss] ]]; then
                echo -e "\n${yellowColour}[*]${endColour}${grayColour} Añadiendo clave pública...${endColour}\n"
                sleep 0.5
                echo -e "\n${yellowColour}[*]${endColour}${grayColour} Instalando programas necesarios${endColour}\n"
                sleep 0.5
                sudo apt install -y gnupg2
                wget -q -O - https://archive.kali.org/archive-key.asc  | apt-key add
                return 0
            else
                sleep 0.5
                return 0
            fi
        done
    else
        echo -e "\n${yellowColour}[*]${endColour}${grayColour} Saliendo...${endColour}"
        exit 1
    fi
}

function AñadirRepositorios(){
    repositorio="deb http://http.kali.org/kali kali-rolling main contrib non-free"
    comando=`grep "$repositorio" /etc/apt/sources.list`
    echo -ne "\n${yellowColour}[*]${endColour}${blueColour} Se va a añadir repositorios de Kali Linux, ¿continuar?${endColour}${yellowColour} [S/N]: ${endColour}"
    read opcionrep
    if [[ $opcionrep = [Ss] ]]; then
        sleep 0.5
        if [ -z "$comando" ]; then
            echo -e "\n${yellowColour}[*]${endColour}${grayColour} No se detecto repositorios en sources.list, continuando...${endColour}\n"
            sudo echo "$repositorio" >> /etc/apt/sources.list
            sleep 0.5
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Se ha detectado los repositorios en el sources.list ${endColour}${redColour}[!]${endColour}\n"
            sleep 0.5
        fi
    else
        echo -e "\n${yellowColour}[*]${endColour}${grayColour} Saliendo...${endColour}"
        sleep 1
        return 1
    fi
}

function VerRepositorios(){
    echo -e "\n${yellowColour}[*]${endColour}${blueColour} Mostrando contenido del sources.list${endColour}\n"
    sleep 0.5
    sed -i '/^$/d' /etc/apt/sources.list
    sed 's/  */&,/g' /etc/apt/sources.list| \
awk -v r=$awkGRAY -v g=$awkGREEN -v p=$awkPURPLE \
 '{printf p$1n r$2n g$3n g$4n g$5n g$6n"\n"}' FS=","
}

function BorrarRepositorios(){
    echo -e "\n${yellowColour}[*]${endColour}${blueColour} Borrando contenido del sources.list${endColour}"
    sleep 0.5
    comando=`sed -e 's/deb http:\/\/http.kali.org\/kali kali-rolling main contrib non-free//g' -i /etc/apt/sources.list`
    if [ $? -eq 0 ]; then
        echo -e "\n${yellowColour}[*]${endColour}${greenColour} El comando se ejecutó correctamente${endColour}\n"
    else
        echo -e "\n${redColour}[!]${endColour}${lightRed} No se pudo completar la ejecución del comando ${endColour}${redColour}[!]${endColour}\n"
    fi
}

function Crackeo(){
    echo -e "\n${yellowColour}[*]${endColour}${blueColour} Crackeo de Contraseñas${endColour}

[1] MD5
[2] MD4
[3] krb4	
[4] krb5
[5] mysql
[6] raw-sha512

[0] Indicar otro sistema de encriptado
[99] Volver atrás"
    echo -ne "${yellowColour}Indica el tipo de encriptación: ${endColour}"
        read crackopt
    echo -ne "${yellowColour}Indica el archivo con los hashes: ${endColour}"
        read file
        echo -e "\n${yellowColour}[*]${endColour}${grayColour} Instalando binarios necesarios...${endColour}\n"
        sleep 0.5
        sudo apt install john -y
        comando=`sudo find / -name "*rockyou.txt" 2>/dev/null| head -n 1`
        if [ -z "$comando" ]; then
            wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
            sleep 1
            $comando
        fi
        if [[ $crackopt = 1 ]]; then
            sudo john --format=raw-md5 --wordlist=$comando $file
        elif [[ $crackopt = 2 ]]; then
            sudo john --format=raw-md4 --wordlist=$comando $file
        elif [[ $crackopt = 3 ]]; then
            sudo john --format=krb4 --wordlist=$comando $file
        elif [[ $crackopt = 4 ]]; then
            sudo john --format=krb5 --wordlist=$comando $file
        elif [[ $crackopt = 5 ]]; then
            sudo john --format=mysql --wordlist=$comando $file
        elif [[ $crackopt = 6 ]]; then
            sudo john --format=raw-sha512 --wordlist=$comando $file
        elif [[ $crackopt = 0 ]]; then
            echo -ne "${yellowColour}Indica el tipo de encriptación: ${endColour}"
                read crackopt0
                sudo john --format=$crackopt0 --wordlist=$comando $file
        elif [[ $crackopt = 99 ]]; then
            sleep 0.5
            Principal
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Opción Incorrecta${endColour}${redColour} [!]${endColour}"
        fi
}

function EnumerarSistema(){
    echo -e "\n${yellowColour}[*]${endColour}${blueColour} Enumeración del Sistema${endColour}

[1] Características del Sistema
[2] Información sobre usuarios
[3] Buscar permisos	
[4] Buscar archivos con contraseñas
[5] Enumerar paquetería

[99] Volver atrás"
    echo -ne "${yellowColour}Elige una opción: ${endColour}"
        read sysopt
        if [[ $sysopt = 1 ]]; then
            echo -e "\n${yellowColour}[*]${endColour}${blueColour} Características del Sistema${endColour}

[1] Información sobre el sistema
[2] Información sobre la red
[3] Información sobre sistema de archivos
[4] Información sobre cronjobs

[99] Volver atrás"
            echo -ne "${yellowColour}Elige una opción: ${endColour}"
                    read sysopt1
                    if [[ $sysopt1 = 1 ]]; then
                        os=`sudo cat /etc/issue | awk '{print $1" " $2" " $3}'`
                        kernel=`sudo cat /proc/version`
                        hostname=`sudo hostname`
                        echo -e "\n${yellowColour}[*]${endColour}${purpleColour} Sistema Operativo: ${endColour}${os}
                        \n${yellowColour}[*]${endColour}${purpleColour} Kernel: ${endColour}${kernel}
                        \n${yellowColour}[*]${endColour}${purpleColour} Hostname: ${endColour}${hostname}\n"
                    elif [[ $sysopt1 = 2 ]]; then
                        netinfo=`/sbin/ifconfig -a`
                        route=`route`
                        netstat=`netstat -antup | grep -v 'TIME_WAIT'`
                        echo -e "\n${yellowColour}[*]${endColour}${purpleColour} Netinfo: ${endColour}${netinfo}
                        \n${yellowColour}[*]${endColour}${purpleColour} Route: ${endColour}${route}
                        \n${yellowColour}[*]${endColour}${purpleColour} Netstat: ${endColour}${netstat}\n"
                    elif [[ $sysopt1 = 3 ]]; then
                        mount=`mount`
                        fstab=`cat /etc/fstab 2>/dev/null| tail -n +2`
                        echo -ne "\n${yellowColour}¿Quieres filtrar la información de los dispositivos montados?: ${endColour}"
                        read mountopt
                        if [[ $mountopt = [Ss] ]]; then
                            echo -ne "${greenColour}Introduce el dispositivo de bloques que deseas verificar: ${endColour}"
                            read montaje
                            mountfiltered=`mount | grep ${montaje}`
                            if [ -z "$mountfiltered" ]; then
                                echo -e "\n${redColour}[!]${endColour}${lightRed} El dispositivo no existe${endColour}${redColour} [!]${endColour}" 
                            else
                                echo -e "\n${yellowColour}[*]${endColour}${purpleColour} Punto de Montaje: ${endColour}${mountfiltered}\n"
                            fi
                        else
                            echo -e "\n${yellowColour}[*]${endColour}${purpleColour} Puntos de Montaje: ${endColour}\n${mount}\n"
                        fi
                        echo -e "\n${yellowColour}[*]${endColour}${purpleColour} Fstab: ${endColour}${fstab}\n"
                    elif [[ $sysopt1 = 4 ]]; then
                        cron=`sudo ls -la /etc/cron* 2>/dev/null`
                        cronw=`sudo ls -aRl /etc/cron* 2>/dev/null | awk '$1 ~ /w.$/' 2>/dev/null`
                        cronu=`crontab -l 2>/dev/null`
                        echo -e "\n${yellowColour}[*]${endColour}${purpleColour} Tareas Cron: ${endColour}${cron}"
                        if [ -z "$crown" ]; then
                            echo -e "\n${redColour}[!]${endColour}${lightRed} No hay tareas cron con permisos de escritura${endColour}${redColour} [!]${endColour}" 
                        else
                                echo -e "\n${yellowColour}[*]${endColour}${purpleColour} Tareas Cron con Permisos de Escritura: ${endColour}${cronw}\n"
                        fi
                        if [ -z "$cronu" ]; then
                            echo -e "\n${redColour}[!]${endColour}${lightRed} No hay tareas crontab corriendo${endColour}${redColour} [!]${endColour}" 
                        else
                                echo -e "\n${yellowColour}[*]${endColour}${purpleColour} Tareas Crontab: ${endColour}${cronu}\n"
                        fi
                    elif [[ $sysopt1 = 99 ]]; then
                        sleep 0.5
                        EnumerarSistema
                    fi
        elif [[ $sysopt = 2 ]]; then
            echo -e "\n${yellowColour}[*]${endColour}${blueColour} Información sobre usuarios${endColour}

[1] Información sobre usuarios
[2] Enumerar ficheros de historial
[3] Enumerar RCFiles

[99] Volver atrás"
        echo -ne "${yellowColour}Elige una opción: ${endColour}"
                    read sysopt2
                    if [[ $sysopt2 = 1 ]]; then
                        whoami=`whoami`
                        id=`id`
                        passwd=`cat /etc/passwd`
                        superusers=`grep -v -E '^#' /etc/passwd | awk -F: '$3 == 0{print $1}'`
                        env=`env 2>/dev/null | grep -v 'LS_COLORS'`
                        sudoers=`cat /etc/sudoers 2>/dev/null | grep -v '#' 2>/dev/null`
                        screens=`screen -ls 2>/dev/null`
                        conectados=`who -a 2>/dev/null`
                        echo -e "\n${yellowColour}[*]${endColour}${purpleColour} Usuario Actual: ${endColour}${whoami}
                        \n${yellowColour}[*]${endColour}${purpleColour} ID Usuario: ${endColour}${id}
                        \n${yellowColour}[*]${endColour}${purpleColour} Usuarios del Sistema: ${endColour}\n${passwd}\n
                        \n${yellowColour}[*]${endColour}${purpleColour} Superusuarios encontrados: ${endColour}\n${superusers}\n
                        \n${yellowColour}[*]${endColour}${purpleColour} Entornos encontrados: ${endColour}\n${env}\n
                        \n${yellowColour}[*]${endColour}${purpleColour} Privilegios de Sudoers: ${endColour}\n${sudoers}\n
                        \n${yellowColour}[*]${endColour}${purpleColour} Sesiones de Screen: ${endColour}\n${screens}\n
                        \n${yellowColour}[*]${endColour}${purpleColour} Usuarios Conectados: ${endColour}\n${conectados}\n"
                    elif [[ $sysopt2 = 2 ]]; then
                        rhistory=`ls -la /root/.*_history 2>/dev/null`
                        bhistory=`cat ~/.bash_history 2>/dev/null`
                        nanohistory=`cat ~/.nano_history 2>/dev/null`
                        mysqlhistory=`cat ~/.mysql_history 2>/dev/null`
                        phphistory=`cat ~/.php_history 2>/dev/null`
                        pythonhistory=`cat ~/.python_history 2>/dev/null`
                        echo -e "\n${yellowColour}[*]${endColour}${purpleColour} Historial Root: ${endColour}\n${rhistory}
                        \n${yellowColour}[*]${endColour}${purpleColour} Historial Bash: ${endColour}\n${bhistory}
                        \n${yellowColour}[*]${endColour}${purpleColour} Historial Nano: ${endColour}\n${nanohistory}\n
                        \n${yellowColour}[*]${endColour}${purpleColour} Historial MYSQL: ${endColour}\n${mysqlhistory}\n
                        \n${yellowColour}[*]${endColour}${purpleColour} Historial PHP: ${endColour}\n${phphistory}\n
                        \n${yellowColour}[*]${endColour}${purpleColour} Historial Python: ${endColour}\n${pythonhistory}\n"
                    elif [[ $sysopt2 = 3 ]]; then
                        shellhrc=`cat ~/.*rc 2>/dev/null`
                        screenrc=`cat ~/.screenrc 2>/dev/null`
                        echo -e "\n${yellowColour}[*]${endColour}${purpleColour} Configuración de shell: ${endColour}\n${shellrc}
                        \n${yellowColour}[*]${endColour}${purpleColour} Configuración de Screen: ${endColour}\n${screenrc}"
                    fi
        elif [[ $sysopt = 3 ]]; then
            eroot=`find / \( -wholename '/home/homedir*' -prune \) -o \( -type d -perm -0002 \) -exec ls -ld '{}' ';' 2>/dev/null | grep root`
            eotro=`find / \( -wholename '/home/homedir*' -prune \) -o \( -type d -perm -0002 \) -exec ls -ld '{}' ';' 2>/dev/null | grep -v root`
            earchivo=`find / \( -wholename '/home/homedir/*' -prune -o -wholename '/proc/*' -prune \) -o \( -type f -perm -0002 \) -exec ls -l '{}' ';' 2>/dev/null`
            suid=`find / \( -perm -2000 -o -perm -4000 \) -exec ls -ld {} \; 2>/dev/null`
            echo -e "\n${yellowColour}[*]${endColour}${purpleColour} Archivos con escritura de root: ${endColour}\n${eroot}
                    \n${yellowColour}[*]${endColour}${purpleColour} Archivos con escritura de otro usuario: ${endColour}\n${bhistory}
                    \n${yellowColour}[*]${endColour}${purpleColour} Permisos de escritura sobre: ${endColour}\n${earchivo}\n
                    \n${yellowColour}[*]${endColour}${purpleColour} Archivos con SUID: ${endColour}\n${suid}\n"
        elif [[ $sysopt = 4 ]]; then
            
        elif [[ $sysopt = 99 ]]; then
            sleep 0.5
            Principal
        fi

}

# Main Program
while true; do
    Principal
    while [[ $opcion = 1 ]]; do
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
            sleep 0.5
        fi
    done
    while [[ $opcion = 2 ]]; do
        MenuGlogal2   
        if [[ $opciong2 = 1 ]]; then
            MenuOpcion21
        elif [[ $opciong2 = 2 ]]; then
            Crackeo
        elif [[ $opciong2 = 3 ]]; then
            if [ -z "$(which bat)" ]; then
                echo -e "\n${yellowColour}[*]${endColour}${grayColour} ¿Quieres instalar una herramienta para mejorar la visibilidad? [Ss]: ${endColour}"
                read opcionbat
                if [[ $opcionbat = [Ss] ]]; then
                    wget https://github.com/sharkdp/bat/releases/download/v0.18.0/bat_0.18.0_amd64.deb
                    sudo dpkg -i bat_0.18.0_amd64.deb
                    sleep 0.5
                    `alias cat='/usr/bin/bat'`
                fi
            fi
            EnumerarSistema
        elif [[ $opciong2 = 4 ]]; then
            sleep 0.5
            Principal
        else
            echo -e "\n${redColour}[!]${endColour}${lightRed} Introduce una opción correcta ${endColour}${redColour}[!]${endColour}\n"
            sleep 0.5
        fi
    done
    if [[ $opcion = 4 ]]; then
        echo -e "\n${yellowColour}[*]${endColour}${grayColour} Saliendo...${endColour}\n"
        sleep 0.2
        break
    fi
done