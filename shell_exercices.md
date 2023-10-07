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
wc -l *_08_*.ann | sort -rn | head
</pre></code>

