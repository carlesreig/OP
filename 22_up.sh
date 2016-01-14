#!/bin/bash
# script per a comprovar si un servidor esta ON, uptime amb el temps que porta funcionant

# cridem a la funcio "func_servidor" per a connectar al servidor
func_servidor

# consulta amb les comandes que volem executar en el servidor $HOST
# ssh -o "StrictHostKeyChecking no" --> ens afegirà la key ssh del host automàticament sense demanar-ho
CONSULTA=$(spawn ssh -o "StrictHostKeyChecking no" $HOST; uptime && uname -a && date;)

clear
echo "Uptime a $HOST"
echo "========================================================================="
	RESULTAT=$(expect -c " 
	$CONSULTA
	expect \"yes/no\" { 
	    send -- \"yes\r\"
	    expect \"*?assword\" { send -- \"$PASS\r\" }
	    } \"*?assword\" { send -- \"$PASS\r\" }
	send -- \"\r\"
	expect eof
        ")
	echo $RESULTAT
