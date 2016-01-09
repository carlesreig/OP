#!/bin/bash
echo "A quin servidor vols accedir?"
read HOST
echo "Quina instancia vols comprobar?"
read INSTANCIA
PASS=$(cat pwd.txt)

clear
	echo ""
	echo "  Verificacio de $INSTANCIA a $HOST"
	echo ""
	echo "========================================================================="
	echo ""
	VAR=$(expect -c " 
	spawn ssh $HOST cat /var/opt/OV/log/OpC/ps_mon.log|grep $INSTANCIA|tail
	expect \"yes/no\" { 
	    send -- \"yes\r\"
	    expect \"*?assword\" { send -- \"$PASS\r\" }
	    } \"*?assword\" { send -- \"$PASS\r\" }
	send -- \"\r\"
	expect eof
        ")
	echo "$VAR"|tail -10
