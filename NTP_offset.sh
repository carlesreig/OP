#!/bin/bash
# 2016/01/09 @ 11:37h
echo "A quin servidor vols accedir?"
read HOST
PASS=$(cat pwd.txt)

clear

	echo ""
	echo "  NTP offset a $HOST"
	echo ""
	echo "========================================================================="
	echo ""
	VAR=$(expect -c " 
	spawn ssh $HOST echo \; tail /var/opt/OV/log/OpC/ntp_mon.log && /usr/sbin/ntpq -p
	expect \"yes/no\" { 
	    send -- \"yes\r\"
	    expect \"*?assword\" { send -- \"$PASS\r\" }
	    } \"*?assword\" { send -- \"$PASS\r\" }
	send -- \"\r\"
	expect eof
        ")
	echo "$VAR"
	#echo "$VAR"|tail -4
#spawn ssh $HOST echo \; /usr/sbin/ntpq -p
