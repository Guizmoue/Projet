#!/usr/bin/env bash

#On definit la variable URL qui a pour valeur l'argument 1
URLS=$1

#On initialise un compteur I a 1
I=1

#On verifie que le nombre d'argument est egale a 1, sinon on arrete le programme
if [ $# -eq 1 ];
then
	echo "Ok !"
else
	echo "On attend un argument en entree !"
	exit
fi

#On verifie que le fichier donne en argument existe, sinon on arrete le programme
if [ -f $URLS ];
then
	echo "Ok !"
else
	echo "On attend un fichier en argument !"
	exit
fi

#Boucle while, chaque ligne de la variable URL est stocker dans la variable line.
while read -r line;
do
	#A la variable CODE_HTTP on associe la valeur du code http de la page. 
	CODE_HTTP=$(curl -Is ${line} | egrep -ow "HTTP.*?[0-9]{3}" | cut -d ' ' -f2)
	#A la variable SET on associe la valeur de l'encodage de la page.
	SET=$(curl -Is ${line} | egrep -o "\bcharset=.*?\b" | tr -d "charset=")
	
	#Correction
	#Pour suivre les redirections : curl -s -I -L -w "%{http_code}" -o /dev/null adresse
	#Pour recuperer les encodages : curl -s -I -L -w "%{content_code}" -o /dev/null adresse | grep -P -o "charset=\S+" | cut -d "=" -f2

	#Si le code http de la page a pour valeur 301 alors : 
	if [ $CODE_HTTP -eq 301 ];
	then
		#A la variable TEST on associe la valeur du code http de la page de redirection.
		TEST=$(curl -ILs ${line} | egrep -ow "HTTP.*?[0-9]{3}" | cut -d ' ' -f2 | tail -n1 )
		#On affiche le resultat
		echo -e "${I}\t${line}\t${TEST}\t${SET}"
	else
		#On affiche le resultat
		echo -e "${I}\t${line}\t${CODE_HTTP}\t${SET}"
	fi
	#On incremente notre compteur de 1 a chaque tour de boucle
	I=$(expr $I + 1)
done < $URLS