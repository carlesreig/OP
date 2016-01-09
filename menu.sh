#!/bin/sh
_menu() {
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blau cel
    NUMBER=`echo "\033[33m"` #groc
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Too many instances X ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} FS i archius major ocupacio ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} ONE least ITO ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU} SWAPINFO&FREE ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5)${MENU} NTP offset ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 6)${MENU} not running ntpd verificacio ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 7)${MENU} not running ntpd arranc ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 8)${MENU} CPU & PROCESS ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 9)${MENU} UPTIME ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 10)${MENU} not running perfalarm ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 11)${MENU} not running standard ${NORMAL}"
    echo -e "${MENU}**${NUMBER} s)${MENU} Exit ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Selecciona la opcio i presiona enter o ${RED_TEXT}presiona enter per sortir. ${NORMAL}"
}
 
function option_picked() {
    COLOR='\033[01;31m' # Negretas en vermell
    RESET='\033[00;00m' # normal blanca
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}
 
# opcio per defecte
opc="0"
 
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

    111)
       option_picked "Opcio $opc seleccionada";
	clear
        echo "Scripts creat per Ricard Rabert Brugue ;D";
    _menu
    ;;
	
    s)
	exit
	;;
	
    *)
# Si no es ninguna de les anteriors.
    clear
    _menu
    ;;
	esac
	read opc
done
