#!/user/bin/bash

#Liste des chemins vers les fichiers
PATH_2016="./Fichiers/ann/2016/*/*"
PATH_2017="./Fichiers/ann/2017/*/*"
PATH_2018="./Fichiers/ann/2018/*/*"

#On declare les variables
EXE_2016=$(cat $PATH_2016 | grep -w  "Location" | wc -l)
EXE_2017=$(cat $PATH_2017 | grep -w  "Location" | wc -l)
EXE_2018=$(cat $PATH_2018 | grep -w  "Location" | wc -l)

#On affiche le resultat des variables
echo -e "Pour l'annee 2016 le mot 'Location' apparait : $EXE_2016 fois\nPour l'anne 2017 le mot 'Location' apparait : $EXE_2017 fois\nPour l'annee 2018 le mot 'Location' apparait : $EXE_2018 fois"
