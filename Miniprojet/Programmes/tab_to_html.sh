#!/usr/bin/env bash

#A la variable TSV on attribut le chemin vers le tableur.
TSV="../Textes/tab.tsv"
#A la variable TAB on attribut le chemin vers le fichier html.
TAB="../Tableaux/tableau-fr.html"

echo -e "<!DOCTYPE html>\n<html>\n<head>\n\t<title>Tableau</title>\n\t<meta charset="UTF-8" />\n</head>" > $TAB
echo -e "<body><table>\n\t<tr>\n\t\t<th>indice</th><th>url</th><th>code http</th><th>charset</th>\n\t</tr>" >> $TAB
for L in {1..6}
do
    #echo "line : $L"
    RAW=$(egrep "^[$L]" $TSV)
    #echo "$RAW"
    INDEX=$(egrep "^[$L]" $TSV | cut -f1)
    URL=$(egrep "^[$L]" $TSV | cut -f2)
    CODE=$(egrep "^[$L]" $TSV | cut -f3)
    SET=$(egrep "^[$L]" $TSV | cut -f4)
    echo -e "\t<tr>\n\t\t<td>$INDEX</td><td>$URL</td><td>$CODE</td><td>$SET</td>\n\t</tr>" >> $TAB
done
echo -e "</table>\n</body>\n</html>" >> $TAB

