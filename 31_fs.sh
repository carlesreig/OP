#!/bin/bash
# comprovar File System (FS)
# PENDENT comprovar els FS de sistemes HP-UX
# PENDENT mostrar carpetes de més ocupació du -sk * | sort -rn

# cridem a la funcio "func_servidor" per a connectar al servidor
func_servidor

# consulta amb les comandes que volem executar en el servidor $HOST
# ssh -o "StrictHostKeyChecking no" --> ens afegirà la key ssh del host automàticament sense demanar-ho
CONSULTA=$(spawn ssh $HOST /bin/df -k $FS;)
CONSULTA2=$(spawn ssh $HOST find $FS 2>/dev/null -xdev -type f -ls;)

# demanem la ruta absoluta
echo "escriu la ruta absoluta del FS a revisar"
read FS

clear
echo "  Filesystem de $HOST"
echo "========================================================================="
echo ""
VAR=$(expect -c " 
$CONSULTA
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
$CONSULTA2
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
