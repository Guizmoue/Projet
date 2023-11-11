#!/usr/bin/env bash

#On attribut a la variable TXT l'argument 1.
TXT=$1
#On attribut a la variable LINES l'argument 2.
LINES=$2
#On attribut a la variable SCRIPT1 le chemin vers le code bash
SCRIPT1="analyse.sh"

#On verifie que le nombre d'argument est au moins egale a 1, sinon on arrete le programme.
if [ $# -ge 1 ];
then
	#On verifie que le fichier donne en argument existe, sinon on arrete le programme
    if [ -f $TXT ];
    then
	    #Si la variable NB est vide, on lui attribue la valeur 25 par defaut.
        if [ -z $LINES ];
        then
            LINES=25
        fi
    else
	    echo "On attend un fichier en argument !"
	    exit
    fi
else
	echo "On attend au moins 1 argument en entree !"
	exit
fi

echo "Pour le texte : ${TXT}, nous recherchons les /${LINES}/ mots les plus frequent du texte."

#On appelle notre code : analyse.sh
FREQ=$(bash ${SCRIPT1} ${TXT} | sort | uniq -c | sort -nr | head -n${LINES})
echo "${FREQ}"