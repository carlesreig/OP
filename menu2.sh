
#!/bin/sh

clear

#definicio de colors
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blau cel
    NUMBER=`echo "\033[33m"` #groc
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    COLOR='\033[01;31m' # Negretas en vermell
    RESET='\033[00;00m' # normal blanca

#demana el pwd de unix al usuari en cada execucio del script menu

echo -e "${COLOR}Introdueix el PWD de usuari UNIX"
read -s PASS
export PASS

clear

_menu() {
    echo -e "${MENU}****************************************************${NORMAL}"
    echo -e "${MENU}******************** Unix **************************${NORMAL}"
#    echo -e "${MENU}**"
    echo -e "${MENU}**${NUMBER} 11)${MENU} Too many instances X ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 12)${MENU} ONE least ITO ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 13)${MENU} NTP offset ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 14)${MENU} not running ntpd verificacio ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 15)${MENU} not running ntpd ${RED_TEXT} arranc (actualment no tenim permis) ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 16)${MENU} not running perfalarm ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 17)${MENU} not running standard ${NORMAL}"
#   echo -e "${MENU}**"
#   echo -e "${MENU}**${NUMBER} 999)${MENU} evweb eventviewer ${NORMAL}" en desenvolupament
#    echo -e "${MENU}****************************************************${NORMAL}"
    echo -e "${MENU}******************* Monitoritzacio *****************${NORMAL}"
#    echo -e "${MENU}**"
    echo -e "${MENU}**${NUMBER} 21)${MENU} SWAPINFO&FREE ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 22)${MENU} UPTIME ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 23)${MENU} CPU & PROCESS ${NORMAL}"
#    echo -e "${MENU}**"
#    echo -e "${MENU}****************************************************${NORMAL}"
    echo -e "${MENU}******************* FileSystems ********************${NORMAL}"
#    echo -e "${MENU}**"
    echo -e "${MENU}**${NUMBER} 31)${MENU} FS i archius major ocupacio ${NORMAL}"
#    echo -e "${MENU}**"
    echo -e "${MENU}****************************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} s)${MENU} Exit ${NORMAL}"
    echo -e "${MENU}****************************************************${NORMAL}"
    echo -e "${MENU}****************************************************${NORMAL}"
    echo -e "${ENTER_LINE}Selecciona la opcio i presiona enter o ${RED_TEXT}presiona s enter per sortir. ${NORMAL}"
}

function option_picked() {
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

# opcio per defecte

opc="0"

#pregunta per el host al que accedirem, ubicat a cada script
function func_servidor {
        echo "A quin servidor vols accedir?"
        read HOST
}

export -f func_servidor

#pregunta per la instancia a verificar, per exemple en not running standard
function func_instancia {
        echo "Quina instancia vols verificar?"
        read INSTANCIA
}

export -f func_instancia

#pregunta per el filesystem a verificar
function func_FS {
        echo "Escriu el FS a revisar"
        read FS
}
export -f func_FS

# bucle mentres la opcio indicada sigui diferent de s (sortir)
until [ "$opc" == "s" ]; do
    case $opc in

    11)
          option_picked "Opcio $opc seleccionada";
        ./too_many_instances.sh;
    _menu
    ;;

    12)
      option_picked "Opcio $opc seleccionada";
      ./ONE_least_ITO.sh;
    _menu
    ;;

    13)
          option_picked "Opcio $opc seleccionada";
        ./NTP_offset.sh;
    _menu
    ;;

    14)
          option_picked "Opcio $opc seleccionada";
            ./ntpd_not_running_verificacio_no_arranc.sh;
    _menu
    ;;

    15)
          option_picked "Opcio $opc seleccionada";
            ./ntpd_not_running_arranc.sh;
    _menu
    ;;

    16)
       option_picked "Opcio $opc seleccionada";
         ./perfalarm.sh;
    _menu
    ;;

    17)
       option_picked "Opcio $opc seleccionada";
         echo "tambe serveix per a les syslogd, xntp, coda, xinetd";
         ./not_running_standard.sh;
    _menu
    ;;

    21)
      option_picked "Opcio $opc seleccionada";
      ./free.sh;
    _menu
    ;;

    22)
      option_picked "Opcio $opc seleccionada";
        ./up.sh;
    _menu
    ;;

    23)
      option_picked "Opcio $opc seleccionada";
        ./top.sh;
    _menu
    ;;

    31)
       option_picked "Opcio $opc seleccionada";
       ./fs.sh;
    _menu
    ;;

    999)
       option_picked "Opcio $opc seleccionada";
         echo "torna el resultat que es demana per a UNIX";
         ./evwebX.sh;
    _menu
    ;;

    111)
       option_picked "Opcio $opc seleccionada";
        clear
        echo "Scripts creat per Ricard Rabert Brugue, colaborador Carles Reig";
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