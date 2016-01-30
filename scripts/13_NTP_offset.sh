#!/bin/bash
# script per a comprovacions amb el servidor NTP
# cridem a la funcio "func_servidor" per a connectar al servidor
func_servidor
# fem la comanda per a tractar la incidencia
COMANDA=$(tail /var/opt/OV/log/OpC/ntp_mon.log && /usr/sbin/ntpq -p)
clear
	echo "  NTP offset a $HOST"
	echo "========================================================================="
	echo ""
	VAR=$(expect -c " 
	spawn ssh $HOST $COMANDA
	expect \"yes/no\" { 
	    send -- \"yes\r\"
	    expect \"*?assword\" { send -- \"$PASS\r\" }
	    } \"*?assword\" { send -- \"$PASS\r\" }
	send -- \"\r\"
	expect eof
        ")
	echo "$VAR"
