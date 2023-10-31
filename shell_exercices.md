# Exercices en ligne de commande

### Partie 1 : voir repertoire "Fichier"

### Partie 2 : Pour tout les fichiers .ann   
*a) Compter le nombre d’annotations par annee*  
<pre><code>
wc -l 2016*.ann
> 9442
wc -l 2017*.ann
>7179
wc -l 2018*.ann
>7561
</code></pre>
  
*b) Limiter ce comptage aux lieux (Location)*  
<pre><code>
cat *.ann | grep -i "Location" | wc -l 
>8720
</pre></code>
  
*c) Sauvegarder ces résultats dans un seul fichier*  
Voir le fichier Save.txt
<pre><code>
wc -l 2016*.ann | tail -1 > Save.txt
wc -l 2017*.ann | tail -1 >> Save.txt
wc -l 2018*.ann | tail -1 >> Save.txt
cat Save.txt
</pre></code>
  
*d) Établir le classement des lieux les plus cités.*  
<pre><code>
egrep "Location" *.ann | cut -f3 | sort -n | uniq -c | sort -nr | head
</pre></code>
On obtient le top 10 des lieux les plus cités avec leur occurrence, soit :
- 703 France
- 297 Paris
- 189 États-Unis
- 139 Burundi
- 113 Russie
- 106 Rio
- 97 Syrie
- 83 Italie
- 78 Champs-Élysées
- 77 Allemagne
  
*e) Trouvez les annotyations les plus frequentes pour votre mois de naissance, toutes annees confondues*  
Je suis né au mois d'août donc :
<pre><code>
wc -l *_08_*.ann | sort -rn | head -n2
>1483 total
  89 2017_08_05-001.ann
</pre></code>
L'annotation du 5 aout 2017 est la plus frequente avec 89 occurences.

### Argument d'un script
*Exercice1*   
Pour lancer le script tapez : <code>bash second_script.sh [argument]</code>. La 
boucle while nous permet de generer les chiffres pour chacune des annees. Puis on appel le
premier_script.sh en lui donnant annee et le type en argument.
<pre><code>
#!/user/bin/bash

#On declare les variables
WORD=$1   
COMPTEUR=6
MAX=8

#On indique le chemin vers le premier script
SCRIPT_PATH="./premier_script.sh"

#La boucle while itere sur les chiffres 6, 7 et 8 et lance le premier_script.sh
while [[ $COMPTEUR -le $MAX ]];
do
        bash $SCRIPT_PATH $COMPTEUR $WORD
        COMPTEUR=$((COMPTEUR+1))
done
</pre></code>

Le second_script.sh est lance a chaque tour de boucle.
<pre><code>
#!/user/bin/bash

#On recupere les arguments donne dans le premier_script.sh
YEAR=$1
KEYWORD="$2"

#On donne le chemin vers les fichiers
FILE_PATH="./Fichiers/ann/201$YEAR/*/*.ann"

#On declare la variable
EXE=$(cat $FILE_PATH | egrep -w $KEYWORD | wc -l)

#On affiche le resultat des variables
echo "Pour l'annee 201$YEAR le mot '$KEYWORD' apparait : $EXE fois"
</pre></code>

*Exercice2*  
En reprenant la commande de l'exercice d) on obtient le script suivant :
<pre><code>
#!/user/bin/bash

#On recupere les arguments dans des variables
YEAR=$1
MONTH=$2
LINES=$3
FILE_PATH="./Fichiers/ann/$YEAR/$MONTH/*.ann"

#On cherche le resulat de notre requete
SEARCH=$(egrep -w  "Location" $FILE_PATH | cut -f3 | sort -n | uniq -c | sort -nr | head -n$LINES)

#On affiche le resultat de notre requete
echo $SEARCH
</pre></code> 
Cependant, je n'ai pas reussi a faire la derniere partie permetant au script2.sh de prendre 
l'etoile Kleene en argument, car il y a un probleme au niveau de la condition if. Seul les
variables de meme type peuvent faire l'objet de comparaison. Pour que le programme accepte l'argument *
il faut rajouter un antislash : \*.

*Exercice condition if*  
Nous avons repris et modifie les scripts precedents en leur ajoutant des conditions if.  
Pour script_1.sh:
<pre><code>
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
</pre></code>

Pour script_3.sh : nous avons utilise des expressions regulieres pour definir la fenetre des annees et 
mois acceptable en argument.

<pre><code>
#!/user/bin/bash

#On recupere les arguments dans des variables
YEAR=$1
MONTH=$2
LINES=$3
FILE_PATH="../../Fichiers/ann/$YEAR/$MONTH/*.ann"

#Condition if pour l'annee
if [[ $YEAR =~  201(6|7|8) ]];
then
        #Condition if pour le mois
        if [[ $MONTH =~ 0[0-9]|1[0-2] ]];
        then
                #Condition if pour le nombre de ligne
                if [[ -n $LINES ]];
                then
                        #On cherche le resulat de notre requete
                        SEARCH=$(egrep -w  "Location" $FILE_PATH | cut -f3 | sort -n | uniq -c | sort -nr | head -n$LINES)
                        #On affiche le resultat de notre requete
                        echo $SEARCH
                else
                        echo "Erreur ligne"
                fi
        else
                echo "Erreur mois"

        fi
else
        echo "Erreur annee"
fi
</pre></code>

### Miniprojet
*Exercice 1*  
<pre><code>
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
	echo "On attend un fichier en argument"
	exit
fi

#On verifie que le fichier donne en argument existe, sinon on arrete le programme
if [ -f $URLS ];
then
	echo "Ok !"
else
	echo "On attend un fichier en argument"
	exit
fi

#Boucle while, chaque ligne de la variable URL est stocker dans la variable line.
while read -r line;
do
	#Pour chaque line on utilise la commande curl et on cherche a recuperer le http de chaque url. 
	TEST=$(curl -Is ${line} | head -n1 | egrep -o "[0-9]{3}")
	echo -e "${I}\t${line}\t${TEST}";
	I=$(expr $I + 1)
done < $URLS
</pre></code>

*Exercice 2*  
Nous avons pu corriger le 3eme url grace a l'option -L de curl.
<pre><code>
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
	echo "On attend un fichier en argument"
	exit
fi

#On verifie que le fichier donne en argument existe, sinon on arrete le programme
if [ -f $URLS ];
then
	echo "Ok !"
else
	echo "On attend un fichier en argument"
	exit
fi

#Boucle while, chaque ligne de la variable URL est stocker dans la variable line.
while read -r line;
do
	#A la variable CODE_HTTP on associe la valeur du code http de la page. 
	CODE_HTTP=$(curl -Is ${line} | egrep -ow "HTTP.*?[0-9]{3}" | cut -d ' ' -f2)
	#A la variable SET on associe la valeur de l'encodage de la page.
	SET=$(curl -Is ${line} | egrep -o "\bcharset=.*?\b")
	
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
</pre></code>
