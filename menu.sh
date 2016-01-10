#!/bin/sh
# 2016/01/10
# Scripts creat per Ricard Rabert Brugue i modificat per Carles Reig @ 2016
_menu() {
	# declarem els colors
	NORMAL=`echo "\033[m"`
	MENU=`echo "\033[36m"` # Blau cel
	NUMBER=`echo "\033[33m"` # groc
	FGRED=`echo "\033[41m"`
	RED_TEXT=`echo "\033[31m"`
	ENTER_LINE=`echo "\033[33m"`
	# mostrem el menu principal
	# PENDENT crear un submenú per a cada secció 1x (UNIX), 2x (FS), 3x (BBDD)...
	echo -e "${MENU}*********************************************${NORMAL}"
	echo -e "${MENU}****************1x-UNIX*************************${NORMAL}"
	echo -e "${MENU}**${NUMBER} 10)${MENU} not running perfalarm ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 11)${MENU} not running standard ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 1)${MENU} Too many instances X ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 3)${MENU} ONE least ITO ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 5)${MENU} NTP offset ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 6)${MENU} not running ntpd verificacio ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 7)${MENU} not running ntpd arranc ${NORMAL}"
	echo -e "${MENU}*****************2x-FS**************************${NORMAL}"
	echo -e "${MENU}**${NUMBER} 2)${MENU} FS i arxius major ocupacio ${NORMAL}"
	echo -e "${MENU}****************3x-BBDD*************************${NORMAL}"
	echo -e "${MENU}**${NUMBER} XX)${MENU} comprovar si BBDD està aixecada ${NORMAL}"
	echo -e "${MENU}**${NUMBER} XX)${MENU} comprovar si instància BBDD està OPEN ${NORMAL}"
	echo -e "${MENU}**************4x - RENDIMENT**********************${NORMAL}"
	echo -e "${MENU}**${NUMBER} 8)${MENU} CPU & Process ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 9)${MENU} Uptime ${NORMAL}"
	echo -e "${MENU}**${NUMBER} 4)${MENU} Mem Swap & FreeE ${NORMAL}"
	echo -e "${MENU}*********************************************${NORMAL}"
	echo -e "${MENU}**${NUMBER} s)${MENU} Exit ${NORMAL}"
	echo -e "${MENU}*********************************************${NORMAL}"
	echo -e "${ENTER_LINE}Selecciona la opcio i presiona enter o ${RED_TEXT}presiona S per sortir. ${NORMAL}"
}

# func que detecta opció escollida en el menu anterior
function option_picked() {
	# Negretes en vermell
	COLOR='\033[01;31m'
	# normal blanca
	RESET='\033[00;00m' 
	MESSAGE=${@:-"${RESET}Error: No message passed"}
	echo -e "${COLOR}${MESSAGE}${RESET}"
}

# funció per demanar nom del servidor i variable on desar la contrasenya
function func_servidor {
	echo "A quin servidor vols accedir?"
	read HOST
	# declarem variable on desar la contrasenya d'usuari per accedir al servidor
	PASS=$(cat pwd.txt)
}
# exportar funcio com a shell (i no només com a variable), ara ja es pot utilitzar en altres scripts cridant la func_*
export -f func_servidor

# PENDENT funció expect password usuari unix
# PENDENT COMPROVAR si funciona en script up.sh
function func_pswd_expect {
	expect {
		$CONSULTA
		expect "yes/no" { 
			send -- "yes\r"
			expect "*?assword" { send -- "$PASS\r" }
		} "*?assword" { send -- "$PASS\r" }
		send -- "\r"
		expect eof	
	}
	# retornar un resultat
	echo "$VAR"
}
export -f func_pswd_expect

# opcio per defecte -> cap
opc="0"

# PENDENT modificar numeració opcions, segons tipus, per ex; unix 10, 11... bbdd 30, 31...
# bucle mentres la opcio indicada sigui diferent de s (sortir)
until [ "$opc" == "s" ]; do
    case $opc in
    1)
	  option_picked "Opcio $opc seleccionada";
        ./too_many_instances.sh;
    _menu
    ;;
		
    2)
	  option_picked "Opcio $opc seleccionada";
	    ./fs.sh;
    _menu
    ;;
	
	3)
	  option_picked "Opcio $opc seleccionada";
        ./ONE_least_ITO.sh;
    _menu
    ;;
	
	4)
	  option_picked "Opcio $opc seleccionada";
	    ./free.sh;
	_menu
	;;
	
    5)
	  option_picked "Opcio $opc seleccionada";
        ./NTP_offset.sh;
    _menu
    ;;
	
    6)
	  option_picked "Opcio $opc seleccionada";
	    ./ntpd_not_running_verificacio_no_arranc.sh;
    _menu
    ;;
	
    7)
	  option_picked "Opcio $opc seleccionada";
	    ./ntpd_not_running_arranc.sh;
    _menu ;;

    8)
      option_picked "Opcio $opc seleccionada";
        ./top.sh;
    _menu
    ;;
    9)
      option_picked "Opcio $opc seleccionada";
        ./up.sh;
    _menu
    ;;
    10)
       option_picked "Opcio $opc seleccionada";
         ./perfalarm.sh;
    _menu
    ;;
	
    11)
       option_picked "Opcio $opc seleccionada";
         echo "tambe serveix per a les syslogd, xntp, coda, xinetd";
         ./not_running_standard.sh;
    _menu
    ;;
	
    s)
	exit
	;;
	
    *)
# Si no es cap de les anteriors.
    clear
    _menu
    ;;
	esac
	read opc
done
