# OP
Versió 2016/01/09

Scripts de bash/shell per a monitorització de sistemes linux/unix/hp-ux

Creat originalment per Ricard Rabet Brugue.

## Instal·lació

- Copia tots els scripts *.sh en una carpeta on tinguis permisos.
- Canvia els permisos dels fitxers per a que només tu puguis modificar i executar els scripts:
`chmod 700 *.sh;`
`chmod 600 pwd.txt`

## Ús

El fitxer principal és el menu.sh, una vegada cridat aquest s'accedeix als altres des del menú en consola.

- A la línia de comandes, crida `./menu.sh`.

En el fitxer `pwd.txt` introdueix la contrasenya d'usuari unix. **És una mesura temporal**, serà substituït per algun altre sistema per a evitar deixar dades sensibles en el servidor.

## Pendent

Modificar els scripts per a que demani la contrasenya d'usuari en iniciar el menú, i no cada vegada que volem executar una opció del menú.

## Llicència

Released under [GNU General Public License, version 2 (GPL-2.0)](http://opensource.org/licenses/GPL-2.0).
