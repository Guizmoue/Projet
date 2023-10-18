#!/user/bin/bash

#On recupere les arguments dans des variables
YEAR=$1
MONTH=$2
LINES=$3
FILE_PATH="../../Fichiers/ann/$YEAR/$MONTH/*.ann"

#Condition if pour l'annee
if [[ $YEAR =~  201(6|7|8) ]];
then
	#Condition if pour le mois
        if [[ $MONTH =~ 0[0-9]|1[0-2] ]];
        then
		#Condition if pour le nombre de ligne
                if [[ -n $LINES ]];
                then
			#On cherche le resulat de notre requete
			SEARCH=$(egrep -w  "Location" $FILE_PATH | cut -f3 | sort -n | uniq -c | sort -nr | head -n$LINES)
			#On affiche le resultat de notre requete
			echo $SEARCH
		else
                        echo "Erreur ligne"
                fi
        else
                echo "Erreur mois"

        fi
else
        echo "Erreur annee"
fi
