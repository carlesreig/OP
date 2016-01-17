#!/bin/bash
echo "A quin servidor vols accedir?"
read HOST
PASS=$(cat pwd.txt)

clear
	echo ""
	echo "  ONE LEAST ITO a $HOST"
	echo ""
	echo "========================================================================="
	echo ""
	VAR=$(expect -c " 
	spawn ssh $HOST echo \; /opt/OV/bin/opcagt -status
	expect \"yes/no\" { 
	    send -- \"yes\r\"
	    expect \"*?assword\" { send -- \"$PASS\r\" }
	    } \"*?assword\" { send -- \"$PASS\r\" }
	send -- \"\r\"
	expect eof
        ")
	echo "$VAR"|tail -4
