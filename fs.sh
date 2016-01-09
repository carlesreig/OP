#!/bin/bash
# comprovar File System (FS)
# 2016/01/09 @ 13:57h
# PENDENT comprovar els FS de sistemes HP-UX
# PENDENT mostrar carpetes de més ocupació du -sk * | sort -rn
echo "A quin servidor vols accedir?"
read HOST
echo "escriu la ruta absoluta del FS a revisar"
read FS
PASS=$(cat pwd.txt)

clear
	echo ""
	echo "  Filesystem de $HOST"
	echo ""
	echo "========================================================================="
	echo ""
	VAR=$(expect -c " 
	spawn ssh $HOST /bin/df -k $FS;
	expect \"yes/no\" { 
	    send -- \"yes\r\"
	    expect \"*?assword\" { send -- \"$PASS\r\" }
	    } \"*?assword\" { send -- \"$PASS\r\" }
	send -- \"\r\"
	expect eof
        ")
	echo "$VAR"|tail -4

        echo ""
        echo "===================================Arxiu de major ocupacio ======================================"
        echo ""

        VAR1=$(expect -c "
        spawn ssh $HOST find $FS 2>/dev/null -xdev -type f -ls;
        expect \"yes/no\" {
            send -- \"yes\r\"
            expect \"*?assword\" { send -- \"$PASS\r\" }
            } \"*?assword\" { send -- \"$PASS\r\" }
        send -- \"\r\"
        expect eof
        ")
        echo "$VAR1"|awk '{print $7"\t"$5"\t"$11}'|sort -rn|head -5|more
        
	echo ""
        echo "=================================================================================================="
        echo ""
