#!/usr/bin/env bash

URLS="../Urls/fr.txt"

if [ ! -f $URLS ]
then
	echo "On attend un fichier, pas un dossier"
	exit
fi

line=1
while read -r URL
do
	response=$(curl -s -I -L -w "%{http_code}" -o /dev/null $URL)
	encoding=$(curl -s -I -L -w "%{content_type}" -o /dev/null $URL | grep -P -o "charset=\S+" | cut -d"=" -f2 | tail -n 1)
	echo -e "$lineno\t$URL\t$response\t$encoding"
	line=$(expr $line + 1)
done < "$URLS"
