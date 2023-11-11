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

#On affiche sut la sortie standart les variables DATA et NB.
#echo "${DATA}"

#On cherche uniquement les mots, tout en minuscule
MOT=$(egrep -o "\w+" $DATA | tr [:upper:] [:lower:])
echo "${MOT}"