# OP

Scripts monitorització i gestió d'alertes per a servidors linux/hp-ux.

Creat originalment per Ricard Rabet Brugue, modificat per Carles Reig.

## Instal·lació

- Copia tots els scripts `*.sh` i el fitxer `pwd.txt` en una carpeta on tinguis permisos mitjançant SFTP (FileZilla).
- Canvia els permisos dels fitxers per a que només tu puguis modificar i executar els scripts:
`chmod 700 *.sh;`
`chmod 600 pwd.txt`

## Ús

El fitxer principal és el menu.sh, una vegada cridat aquest s'accedeix als altres des del menú en consola.

- A la línia de comandes, crida `./menu.sh`.

**opcional** En el fitxer `pwd.txt` introdueix la contrasenya d'usuari unix si vols que no te la demani en iniciar l'script del menú. No és recomanable per termes de seguretat.
Per habilitar-ho, comenta les línies #18 i #19 del fitxer `menu.sh` i habilita la #21

## Pendent

Modificar els scripts per a que demani la contrasenya d'usuari en iniciar el menú, i no cada vegada que volem executar una opció del menú.

## Llicència

Released under [GNU General Public License, version 2 (GPL-2.0)](http://opensource.org/licenses/GPL-2.0).
