#!/bin/bash
echo "A quin servidor vols accedir?"
read HOST
PASS=$(cat pwd.txt)

clear
	echo ""
	echo "  ntpd not running verificacio no arranca a $HOST"
	echo ""
	echo "========================================================================="
	echo ""
	VAR=$(expect -c " 
	spawn ssh $HOST echo \; date;
	expect \"yes/no\" { 
	    send -- \"yes\r\"
	    expect \"*?assword\" { send -- \"$PASS\r\" }
	    } \"*?assword\" { send -- \"$PASS\r\" }
	send -- \"\r\"
	expect eof
        ")
	echo "$VAR"|tail -1

        VAR=$(expect -c "
        spawn ssh $HOST echo \; /usr/sbin/ntpq -p;
        expect \"yes/no\" {
            send -- \"yes\r\"
            expect \"*?assword\" { send -- \"$PASS\r\" }
            } \"*?assword\" { send -- \"$PASS\r\" }
        send -- \"\r\"
        expect eof
        ")
        echo "$VAR"|tail -5
