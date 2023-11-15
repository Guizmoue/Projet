#!/usr/bin/env bash

#On attribut a la variable DATA l'argument 1.
DATA=$1

#On verifie que le nombre d'argument est au moins egale a 1, sinon on arrete le programme.
if [ $# -eq 1 ];
then
	#On verifie que le fichier donne en argument existe, sinon on arrete le programme
    if [ -f $DATA ];
    then
    #Commande null en bash
        :
    else
	    echo "On attend un fichier en argument !"
	    exit
    fi
else
	echo "On attend 1 argument en entree !"
	exit
fi

#On affiche sur la sortie standart la variable DATA.
#echo "${DATA}"

#On cherche uniquement les mots, tout en minuscule
MOT=$(grep -P -o "\p{Latin}+" $DATA | tr '[:upper:]' '[:lower:]' | tr 'ÉÀÈ' 'éàè')
echo "${MOT}"

#Pour saisir tous les caracteres la latin grep -P - o "p{Latin}"
#Pour saisir tous les caracteres chinois grep -P - o "p{Han}"