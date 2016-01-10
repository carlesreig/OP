#!/bin/bash
# 2016/01/10
# script per a comprovar si un servidor esta ON, uptime amb el temps que porta funcionant
func_debug
# cridem a la funcio "func_servidor" per a connectar al servidor
#func_servidor

clear
	echo "  Uptime a $HOST"
	echo ""
	echo "========================================================================="
	echo ""
	# després de expect posem les comandes que volem executar en el servidor
	VAR=$(expect -c " 
		spawn ssh $HOST echo \; uptime && uname -a && date;
	" func_pswd_expect ")"
	echo "$VAR"
