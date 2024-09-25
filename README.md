### <a name="_uplhhy1edzhy"></a>**H.E.P.L. : Catégorie Technique**
**========================** 

**Bachelier en Informatique et Systèmes : finalité Informatique Industrielle** 

**LABORATOIRE DE DÉVELOPPEMENT MOBILE**

**=================================================================**

3ème année  
###### <a name="_nchrhgwie68n"></a>**Projets par groupe - Royaldle**
**=============================================**

![](images/Aspose.Words.bce095da-84b3-4ac7-a7e4-9838dd6b66b9.001.png)














`   `BERTRAND THEO

`	`PONCIN GUILLAUME

` 	`Année Académique   2023-2024				   Groupe :  B35

<br>
<br>

<h2>Présentation :</h2>

Notre application mobile sera un jeu “dle”(ce terme vous est expliqué ci-dessous …) portant sur le thème du jeu mobile Clash Royal. Dans notre application il y a trois modes différents : 

1) Le premier sera le mode “Classique”, dans ce mode  il faudra deviner une carte du jeu Clash Royale. L’utilisateur aura la possibilité d’entrer le nom d’une carte dans une textbox, si le nom de la carte entrée est celui de la carte du jour alors il aura gagné. Si ce n’est pas le cas, il pourra prendre connaissance des points communs que la carte du jour a avec la carte qu’il a précédemment entrée. L’utilisateur pourra tenter sa chance autant qu’il le souhaite pour trouver la carte du jour mais aura pour objectif personnel de la trouver avec le moins d’essais possible à son compteur.

Illustration avec le jeux “loldle”(Cf : étude de l’existant pour plus d’informations) : 



![](images/Aspose.Words.bce095da-84b3-4ac7-a7e4-9838dd6b66b9.002.png)

2) Le deuxième mode s'appelle “Description”, son but est simple : l’utilisateur obtient une description d’une carte qui s'affiche face à lui et ce-dernier doit deviner à quelle carte appartient cette description. Il possède, une fois de plus, autant de tests qu'il souhaite pour trouver la carte correspondante. La description change tous les jours.


*Qui ;*

Il n’y aura qu’un seul type d’utilisateur, tout utilisateur peut jouer librement et n’a pas besoin de créer un compte pour accéder à toutes les fonctionnalités de notre application.

*Quoi :* 

Les utilisateurs pourront jouer aux différents modes de jeu dans l'ordre qu’ils souhaitent. Ils pourront revenir en arrière pour jouer aux autres modes de jeu.

Lorsque le joueur trouvera une réponse, un message de félicitation apparaîtra. Le joueur aura aussi l’occasion de passer au mode de jeu suivant.

*Pourquoi :* 

Le seul but de notre application sera d’offrir une opportunité de passer le temps dans les transports en communs ou entre 2 rendez-vous.

<br>
<br>

<h2>User stories</h2>

1. En temps que joueur confirmé de l'application "Clash Royale", je veux pouvoir mettre à l'épreuve mes connaissances du jeu,<br>
pour ce faire, je peux comparer les cartes au travers de leurs attributs tels que leur cout en élixir, leur rareté, leur arène<br>
ainsi que leur type pour retrouvé n'importe quelle carte du jeu sélectionnée préalablement au hasards.

2. En temps que joueur confirmé de l'application "Clash Royale", je veux pouvoir mettre à l'épreuve mes connaissances du jeu,<br>
pour ce faire, je peux retrouver la carte associée à une description choisie au préalable parmi toutes les descriptions de cartes<br>
disponibles dans le jeu.

<br>
<br>

<h2>Arborescence des fichiers :</h2>


code<br>
|<br>
|---Royaldle<br>
    &nbsp;&nbsp;&nbsp;|<br>
    &nbsp;&nbsp;&nbsp;|---lib<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|---PACKAGE buttons<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|---PACKAGE firebase<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|---PACKAGE navigation_bars<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|---PACKAGE screens<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|---PACKAGE screensControllers<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|---PACKAGE style<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|---PACKAGE textFields<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|---main.dart<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|---routes.dart<br>
DTO<br>
|<br>
|---lib<br>

<br>
<br>

le package screensControllers contient la partie algorithmique/logique pour chaque écran.
<br>
le package lib de DTO contient les conversions d'objets en json et de json en objets. 








<br>
<br>

<h2>Maquette de l’app:</h2>

![](images/Aspose.Words.bce095da-84b3-4ac7-a7e4-9838dd6b66b9.003.png)

![](images/Aspose.Words.bce095da-84b3-4ac7-a7e4-9838dd6b66b9.004.png)

![](images/Aspose.Words.bce095da-84b3-4ac7-a7e4-9838dd6b66b9.005.png)

<br>
<br>

<h2>Etude de l’existant :</h2>

L’application que nous souhaitons faire est fortement inspirée des autres app de type “dle”. La première app “dle” qui a existé s’appelle Wordle : 

![](images/Aspose.Words.bce095da-84b3-4ac7-a7e4-9838dd6b66b9.007.png)

Wordle est un jeu qui reprend le concept du jeu télévisé américain Lingo (qui est un équivalent de l'émission Motus en francophonie). Le but de cette application est de deviner un mot qui sera différent tous les jours, à l'aide de différents indices que le jeu nous donne au fur et à mesure lorsqu’on essaye de deviner le mot du jour. D’ailleurs la terminaison “dle” vient du développeur de Wordle qui s'appelle Josh Wardle.

Après Wordle  les applications de type “dle” se sont multipliées, et ce sur de nombreux thèmes. Voici quelques exemples : 

- Nerdle (thème des maths)
- Moviedle (thème des films)
- Loldle (thème de League of legend)
- ...

Ces différents jeux reprennent le concept de Wordle càd faire deviner quelque chose de différent chaque jour, tout en donnant des indices à chaque essai en s'adaptant à leur thème. Par exemple, “Moviedle” va montrer un film en entier en seulement 2 sec. De là, les utilisateurs doivent deviner de quel film il s’agit. Tandis que “Loldle”, quant à lui, va proposer à ses joueurs de deviner un personnage de league of legend, mais propose aussi différents types de jeux comme deviner  quelle citation donnée appartient à quel personnage. 

Il est bon de noter que c'est de “Loldle” que nous nous inspirons majoritairement pour créer notre projet.

De plus, un site internet "Clashdle" existe d'ors et déjà et met à disposition le jeu que nous souhaitons adapter en application mobile.


<br>
<br>

<h2>Publique cible :</h2>

Notre public cible serait les joueurs de jeux “dle” et surtout les joueurs de Clash Royal.


<br>
<br>

<h2>Api exemple d’utilisation :</h2>

Récupération des infos d’une carte en python : 

import requests

import json

#This is the json web token generated from your developer.clashroyale.com account

file = open("token.txt", "r")

token = file.read().strip('\n')

file.close()

base\_url = "https://api.clashroyale.com/v1"

\# This is an example of enpoint of the reqest, for more check the documentation

endpoint = "/cards"

\# Correct Authorization header looks like this: "Authorization: Bearer API\_TOKEN".

query = {"Authorization": f"Bearer {token}"}

\# Send the GET request

response = requests.get(base\_url+endpoint, params=query)

\# Save the jsonresponse in json file

with open("example\_response.json", "w") as response\_file:

`	`r : dict = response.json()



`	`# For pretty output

`	`p : str= json.dumps(r, indent=4)

`	`response\_file.write(p) 

<br>
<br>

<h2>Mode d'extraction de données utilisé :</h2>

L'Api de Clash Royal étant trop rigide et peu fournie (10 requêtes maximum autorisées par jour si l'utilisateur n'est pas Clash Royal partenaire) nous avons donc décidé de reprendre un fichier json contenant l'ensemble des données dont nous avons besoin pour réaliser cette application. Ce fichier est fourni par un site Internet tierce : "Royal Api". Ce site a pour but de fournir un maximum de statistiques sur le jeu Clash Royal à leurs différents utilisateurs. Pour ce faire, les propriétaires de ce site sont parvenus a devenir Clash Royal partenaire et ont même complété les informations fournies par l'API (comme afficher la description des différentes cartes, éléments que l'API ne fourni pas). Ces informations sur les cartes du jeu entre-autre ont donc été rendues disponibles sur leur github dans un fichier json que quiconque peut reprendre, ce que nous avons fait pour réaliser ce projet.

<br>

Nous avons ensuite inséré ce fichier json dans firestore pour pouvoir le récupérer sous forme de liste exploitable dans notre application.

<h2>Installation pour le dévlopper :</h2>

-Le premier prérequis est d'avoir installé Flutter, ainsi que de disposer d'un émulateur Android ou iOS pour exécuter le projet.

-Pour utiliser la base de données, vous devrez formuler une demande pour être ajouté au projet Firebase. Ensuite, connectez-vous à votre compte Google depuis la console avec la commande firebase login. Pour finir, exécutez la commande "firebase configure" pour configurer Firestore.

-Exécutez la commande "flutter pub get" dans le répertoire du projet pour télécharger les différentes dépendances nécessaires.

-Finalement, pour éxucuter le projet, utilisez la commande "fluttter run".

