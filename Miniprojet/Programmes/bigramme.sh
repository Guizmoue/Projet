#!/usr/bin/env bash

#On attribut a la variable TEXT le chemin vers le texte.
TEXT="../Textes/candide.txt"
#On attribut a la variable SCRIPT1 le chemin vers le code bash
SCRIPT1="analyse.sh"
#On attribut a FILE1 le chemin vers le fichier file1.txt
FILE1="../Textes/file1.txt"
#On attribut a FILE2 le chemin vers le fichier file2.txt
FILE2="../Textes/file2.txt"

#On attribut a la variable RESULT le chemin vers notre fichier final avec les bigrammes.
RESULT="../Textes/resultat_bigramme.txt"

#On contitue 2 listes de mots: 
#LIST1 duquel on a retire le dernier mot puis stocke selon le chemin FILE1.
LIST1=$(egrep -o "\w+" ${TEXT} | head -n -1 > ${FILE1})
#LIST2 duquel on a retire le premier mot puis stocke selon le chemin FILE2.
LIST2=$(egrep -o "\w+" ${TEXT} | tail -n +2 > ${FILE2})

#On recupere le resultat de la variable bigramme dans le fichier qui a pour chemain RESULTAT
BIGRAMME=$(paste -d ' ' ${FILE1} ${FILE2} | sort | uniq -c | sort -nr > ${RESULT})
