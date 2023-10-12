#!/user/bin/bash

#On recupere les arguments dans des variables
YEAR=$1
MONTH=$2
LINES=$3
FILE_PATH="./Fichiers/ann/$YEAR/$MONTH/*.ann"

#On cherche le resulat de notre requete
SEARCH=$(egrep -w  "Location" $FILE_PATH | cut -f3 | sort -n | uniq -c | sort -nr | head -n$LINES)

#On affiche le resultat de notre requete
echo $SEARCH
