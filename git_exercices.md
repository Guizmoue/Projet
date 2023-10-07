# Git - Github

## Git I

### Exercice 2.b
1. Pour verifier si l'on est en retard par rapport a la version en 
ligne il faut executer la commande : <code>git status</code>. 
2. Pour recuperer les changement du depot, il faut executer la commande 
: <code>git pull</code>.

### Exercice 2.c
* Pour ajouter les modifications faites en ligne de commande a notre 
depot, il faut suivre la procedure suivante :  
<pre><code>
git add git_exercices.md
git commit -m "exercice fini" git_exercices.md
git push origin
</pre></code>

## Git II

### Exercice 1.b
* Pour recuperer l'identifiant SHA il faut executer la commande : <code>git 
log</code>. * Pour defaire le commit on execute la commande : <code>git 
commit id_SHA</code>.

### Exercice 2.a
* Pour retourner a la version du tag on effectue la commande : <code>git 
reset git-seance3-init</code>.

### Exercice 2.b
* Pour copier les chamgement effectue dans le fichier "oups.md" dans 
mon journal de bord il faut utiliser la commande : <code>cat oups.md 
>> journal.md</code>. Cela permet de copier le contenu le "oups.md" 
dans "journal.md" sans ecraser le contenu de "journal.md". * Enfin, 
supprimer le fichier "oups.md" en executant la commande : <code>rm -f  oups.md</>.

