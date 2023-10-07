# Journal de Bord

**Cours 1 : 20/09**
* Dans un terminal en ligne de commande, regarder ce que l’on trouve dans la racine du système.

**Cours 2 : 27/09** 
* Je n'arrive pas a renomer le dossier "PPE1-2324" de mon Github, j'ai donc cree 
un deuxieme dossier "Projet". Etant donne que le depot professeur (cours, etc) ce nomme deja 
"PPE1-2324" lorsque que j'ai voulu enregistrer mon depot sur ma machine (en local, avec la 
commande git clone URL) cela n'etait pas possible car les dossiers portaient le meme nom. 
* Difficultes liees a l'utilisation de Github en ligne de commande. Je n'arrive pas pour l'instant 
a modifier les fichiers (commande : git add ?) , puis les enregistrer (commande : git commit ?) 
pour enfin les uploader sur le server Github (commande : git push ?) a partir de mon terminal. 
* J'ai fini par supprimer le dossier "PPE1-2324" de mon Github ainsi que le dossier .ssh de mon 
ordinateur pour recommencer manipulation avec la double cle Ed25519 mais je n"arrive plus a gener 
cette paire de cle dans le but de pourvoir lier la cle public avec mon nouveau dossier "Projet" 
sur Github.

**30/09** 
* L'exerice de trie des fichiers en ligne de commande etait un peu long et rebarbatif 
meme en utilisant "*".

**01/10** 
* J'ai recommancer la procedure depuis le debut, cette fois j'ai pu generer avec succes une 
nouvelle paire de cle Ed25119 que j'ai lie a mon compte Github. J'ai cloner mon dossier sur mon 
pc avec la commande git clone <URL SSH>, recuperant ainsi tout le contenu de mon dossier. Depuis 
le terminal, j'ai modifie mon journal de bord en l'editant (cmd : nano journal.md => "01/10 : 
Teste en ligne de commande") puis j'ai rentre les commandes add, commit et push pour envoyer les 
nouvelles modifications sur le serveur Github. Enfin je suis alle sur mon Github pour determiner 
si mes modifications ont bien ete prises en compte, cependant la procedure a echoue puisque 
aucunes des modifications faites en ligne de commande n'est apparu dans mon journal de bord. 
* De plus, apres avoir actualise (cmd : git pull) en ligne de commande les lignes fraichement ecrites 
juste ci-dessus n'apparaissent pas lorsque je suis dans mon terminal, a la date du 01/10 il est 
uniquement afficher "01/10 : Teste en ligne de commande". Il semble qu'il y ait un conflit entre 
Github et ma machine mais a ce jour je ne comprends pas pourquoi.

**Cours 3 : 04/10** 
* Grace aux conseils du professeur, j'ai compris que les deux versions du journal 
etaient en conflit. Pour resoudre ce conflit il nous faut d'abord annuler les changements en 
local, pour cela on utilise la commande "reset --hard HEAD" puis recuperer la version en ligne 
avec la commande "git pull", enfin on execute la procedure habituelle soit git add -> commit -> push.

**07/10**


