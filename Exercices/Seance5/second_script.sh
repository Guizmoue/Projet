#!/user/bin/bash

#On declare les variables
WORD=$1
COMPTEUR=6
MAX=8

#On indique le chemin vers le premier script
SCRIPT_PATH="./premier_script.sh"

#La boucle while itere sur les chiffres 6, 7 et 8 et lance le premier_script.sh a chaque tour de boucle
while [[ $COMPTEUR -le $MAX ]];
do
	bash $SCRIPT_PATH $COMPTEUR $WORD
	COMPTEUR=$((COMPTEUR+1))
done
