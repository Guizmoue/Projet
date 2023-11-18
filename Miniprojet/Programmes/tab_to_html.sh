#!/usr/bin/env bash

#A la variable TSV on attribut le chemin vers le tableur.
TSV="../Textes/tab.tsv"
#A la variable TAB on attribut le chemin vers le fichier html.
TAB="../Tableaux/tableau-fr.html"

echo -e "<!DOCTYPE html>\n<html>\n\t<head>\n\t\t<title>Tableau</title>\n\t\t<meta charset=\"UTF-8\">\n\t</head>" > $TAB
echo -e "\t<body>\n\t\t<table>\n\t\t\t<tr>\n\t\t\t\t<th>indice</th><th>url</th><th>code http</th><th>charset</th>\n\t\t\t</tr>" >> $TAB
for L in {1..6}
do
    #echo "line : $L"
    RAW=$(egrep "^[$L]" $TSV)
    #echo "$RAW"
    INDEX=$(egrep "^[$L]" $TSV | cut -f1)
    URL=$(egrep "^[$L]" $TSV | cut -f2)
    CODE=$(egrep "^[$L]" $TSV | cut -f3)
    SET=$(egrep "^[$L]" $TSV | cut -f4)
    echo -e "\t\t\t<tr>\n\t\t\t\t<td>$INDEX</td><td>$URL</td><td>$CODE</td><td>$SET</td>\n\t\t\t</tr>" >> $TAB
done
echo -e "\t\t</table>\n\t</body>\n</html>" >> $TAB

