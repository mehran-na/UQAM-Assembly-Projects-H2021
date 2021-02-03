# Travail pratique 1: Jeu de roche-papier-ciseau

**En équipe de 2 ou 3 (les noms des membres doivent apparaître dans l'entête du code!!!)**

## Spécifications

Vous devez réaliser un programme qui représente un jeu de roche-papier-ciseau entre deux joueurs humains. Si vous ne connaissez pas le jeu, chaque joueur choisit un des trois objets, et on détermine qui a gagné la manche selon les simples règles suivantes:

- roche gagne contre ciseau
- ciseau gagne contre papier
- papier gagne contre roche

Au lancement du programme, un message de bienvenue s'affiche, et on demande le nombre de manches qu'on souhaite jouer dans la partie, comme suit:

```shell
-----------------------------
--- Bienvenue au jeu de roche-papier-ciseau
-----------------------------
Combien de manches voulez-vous jouer?
```

Le programme lit le nombre entier décimal entré dans le terminal.

**Important**: si le nombre entré est pair, il faut augmenter sa valeur de 1 puisqu'il serait sinon impossible de déterminer un gagnant à la fin du match s'il y avait égalité.

Ensuite, pour chaque manche du match, on affiche le nombre de manches restantes et on demande au joueur 1 son choix :

```shell
Il reste 3 manche(s) à jouer.
JOUEUR 1, quel est votre choix? [r/p/c]
```

La seule entrée valide est l'un des 3 caractères **r**, **p**, ou **c**. Si l'utilisateur entre n'importe quel autre caractère, ou bien une chaîne de caractères, cela cause une erreur et la fin du programme avec le message suivant:

```shell
Erreur dentrée! Programme terminé.
```

Si l'entrée était valide, on demande ensuite au joueur 2 son choix (et vérifie sa validité):

```shell
JOUEUR 2, quel est votre choix? [r/p/c]
```

Le programme compare ensuite le choix des deux joueurs et annonce le gagnant de la manche, puis affiche le score actuel sous la forme "Score: *Score1-Score2*":

```shell
JOUEUR 1 a gagné cette manche! Score: 1-0
```

Si le choix des deux joueurs est identique, on indique plutôt qu'il s'agît d'une manche nulle:

```shell
Manche nulle...
```

Le programme répète cette procédure pour chaque manche, jusqu'à ce que **le nombre choisi de manches ait été joué** OU **qu'un des deux joueurs ait déjà gagné**.

**Note:** il est possible qu'un des joueurs gagne avant que toutes les manches soient jouées.

Quand le match est terminé, on affiche le gagnant du match et le score :

```shell
JOUEUR 2 A GAGNÉ LE MATCH!
FÉLICITATIONS! SCORE FINAL: 1-3
```

Puis le programme termine.

## Attention:

L'objectif de la partie Java est de vous aider à concevoir un algorithme qui fonctionne mais qui soit transposable en Pep/8. C'est pourquoi les contraintes particulières suivantes doivent êtres respectés :

- N'utilisez pas de fonctionnalités avancées de Java (fonctions de bibliothèques, programmation par objets, etc).
- N'utilisez pas de multiplication, de division ou toute opération arithmétique inconnue de Pep/8.
- N'utilisez pas de chaînes de caractères (`String`, `StringBuffer`, etc.) pour autre chose que de l'affichage.
- N'utilisez pas l'opérateur `new` d’instanciation.
- N'utilisez pas de tableaux, genre `char[]` ou `int[]`.
- Pour les entrées-sorties, **vous devez utiliser la classe fournie, `Pep8.java`** qui simule certaines instructions du processeur Pep/8 (deci, deco, chari, charo, stro, stop), pas la classe `Scanner` (ou autre) de Java.
- Votre programme doit tenir dans une seule classe, et ne pas faire appel à des sous- programmes (méthodes, fonctions, etc).
- Ne créez pas de structure de packages.

## FIN