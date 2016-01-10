#!/bin/bash
# 2016/01/10
# script per a comprovar si un servidor esta ON, uptime amb el temps que porta funcionant

# cridem a la funcio "func_servidor" per a connectar al servidor
func_servidor

# spawn ssh -o "StrictHostKeyChecking no" "$user\@ip"
# consulta amb les comandes que volem executar en el servidor $HOST
$CONSULTA="spawn ssh -o "StrictHostKeyChecking no" $HOST echo \; uptime && uname -a && date;"

clear
echo "Uptime a $HOST"
echo "========================================================================="
	VAR=$(expect -c " 
	$CONSULTA
	expect \"yes/no\" { 
	    send -- \"yes\r\"
	    expect \"*?assword\" { send -- \"$PASS\r\" }
	    } \"*?assword\" { send -- \"$PASS\r\" }
	send -- \"\r\"
	expect eof
        ")
	echo "$VAR"
