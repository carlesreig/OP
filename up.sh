#!/bin/bash
# 2016/01/09
# cridem a la func per a connectar al servidor
servidor()

clear
	echo ""
	echo "  Uptime a $HOST"
	echo ""
	echo "========================================================================="
	echo ""
	VAR=$(expect -c " 
		spawn ssh $HOST echo \; uptime && uname -a && date;
	" pswd_expect() ")"
	echo "$VAR"
