#!/user/bin/bash

#On recupere les arguments donne dans le premier_script.sh
YEAR=$1
KEYWORD="$2"

#On donne le chemin vers les fichiers
FILE_PATH="../../Fichiers/ann/201$YEAR/*/*.ann"

#On declare la variable
EXE=$(cat $FILE_PATH | egrep -w $KEYWORD | wc -l)

#On affiche le resultat des variables
echo "Pour l'annee 201$YEAR le mot '$KEYWORD' apparait : $EXE fois"
