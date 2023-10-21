#!/user/bin/bash

#On declare les variables
WORD=$1
COMPTEUR=6
MAX=8

#On indique le chemin vers le script execute dans la boucle while
SCRIPT_PATH="./script_2.sh"

##On execute la boucle while a condition que l'argument donne en entree ne soit pas une chaine de caractere vide
if [[ -z $WORD ]];
then
	echo "Veuillez saisir un mot !"
else
#La boucle while itere sur les chiffres 6, 7 et 8 et lance le premier_script.sh a chaque tour de boucle
	while [[ $COMPTEUR -le $MAX ]];
	do
		bash $SCRIPT_PATH $COMPTEUR $WORD
		COMPTEUR=$((COMPTEUR+1))
	done
fi
