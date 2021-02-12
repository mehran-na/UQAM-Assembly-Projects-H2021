/*
Ce programme a été écrit dans le cadre du premier TP en assembleur (INF2171),
Par conséquent toutes les fonctionnalités de JAVA utilisées doivent pouvoir être traduites
en langage machine avec le processeur PEP8.

Le programme permet à deux utilisateurs de participier à jeu de Roche-Papier-Ciseau.
Le nombre de manches souhaité est demandé au début, puis les joueurs font un choix a chaque manche
pour que le score final soit affiché a la fin.

Groupe : AA
Membres :

    - Issakha Wade
       Code Permanant : WADI82030002

    - Mehran Nazemi
        Code Permanant : NAZM30088507

 */

public class rpc {
    public static void main(String[] args) {

        int scorej1 = 0;
        int scorej2 = 0;

        Pep8.stro("-----------------------------------------------\n");
        Pep8.stro("--- Bienvenue au jeu de roche-papier-ciseau ---\n");
        Pep8.stro("-----------------------------------------------");

        Pep8.stro("\n\nCombien de manches voulez-vous jouer?\n");

        // Le nombre de manches à jouer est saisi

        int nbrManches = Pep8.deci();

        // On vérifie que la parité du nombre

         int quotient = 0 ;
         int div = 0;
         for ( div = nbrManches; div>=2; div -= 2 ) {

             // On incremente la variable cpt apres chaque soustraction pour avoir le quotient
             // à la sortie de la boucle

             quotient++;
         }

         // Si le nombre de manches que l'utilisateur souhaite jouer est pair,
        // on l'incremente d'une manche

        if (div==0) {
            nbrManches++;
        }

        int aJouer = nbrManches;

        // On increment le quotient de 1 pour obtenir le nombre de manches q gagnger
        // pour remporter la partie

        int victoire = quotient + 1;

        Pep8.stro("\n");
        for (int i = 1; i<=nbrManches; i++) {
            Pep8.stro("\n");
            Pep8.stro("Il reste ");
            Pep8.deco(aJouer);
            Pep8.stro(" manche(s) à jouer.\n");
            Pep8.stro("JOEUR 1, quel est votre choix? [r/p/c]\n");

            Pep8.chari();
            // Le choix du premier joueur
            char j1 = Pep8.chari();
            // Verification de la validité du choix
            if (j1 != 'r' && j1 != 'p' && j1 != 'c') {
                Pep8.stro("Erreur d'entrée! Programme terminé.\n");
                Pep8.stop();
            }

            // Le choix du deuxiéme joueur
            Pep8.stro("JOEUR 2, quel est votre choix? [r/p/c]\n");
            Pep8.chari();
            char j2 = Pep8.chari();
            // Verification de la validité du choix
            if (j2 != 'r' && j2 != 'p' && j2 != 'c') {
                Pep8.stro("Erreur d'entrée! Programme terminé.\n");
                Pep8.stop();
            }

            // On vérifie si l'un des deux joueurs a gagné ou s'il y a égalité

            if ( (j1=='r'&&j2=='c') || (j1=='c'&&j2=='p') || (j1=='p'&&j2=='r')) {
                // Si le premier joueur gagne la manche on incremente son score
                scorej1++;
                Pep8.stro("JOUEUR 1 a gagné cette manche! Score: ");
                Pep8.deco(scorej1);
                Pep8.stro("-");
                Pep8.deco(scorej2);
                Pep8.stro("\n");
                // Si le premier joueur a assez de points pour gagner le match, la partie se termine
                if (scorej1 == victoire) {
                    Pep8.stro("\nJOUEUR 1 A GAGNÉ LE MATCH! FÉLICITATIONS!\n");
                    Pep8.stro("SCORE FINAL: ");
                    Pep8.deco(scorej1);
                    Pep8.stro("-");
                    Pep8.deco(scorej2);
                    break;
                }
            } else if ((j2=='r'&&j1=='c') || (j2=='c'&&j1=='p') || (j2=='p'&&j1=='r')) {
                // Si le deuxieme joueur gagne la manche on incremente son score
                scorej2++;
                Pep8.stro("JOUEUR 2 a gagné cette manche! Score: ");
                Pep8.deco(scorej1);
                Pep8.stro("-");
                Pep8.deco(scorej2);
                Pep8.stro("\n");
                // Si le deuxieme joueur a assez de points pour gagner le match, la partie se termine
                if (scorej2 == victoire){
                    Pep8.stro("\nJOUEUR 2 A GAGNÉ LE MATCH! FÉLICITATIONS!\n");
                    Pep8.stro("SCORE FINAL: ");
                    Pep8.deco(scorej1);
                    Pep8.stro("-");
                    Pep8.deco(scorej2);
                    break;
                }
            } else {

                // Si il y'a égalité on décrémente la variable i pour signaler au programme que cette manche
                // doit être rejouée

                i--;
                Pep8.stro("Manche nulle...");
                Pep8.stro("\n");
                continue;
            }

            // La variable suivante qui indique le nombre de manches restantes à jouer,
            // n'est décrémenter que lorsqu'il n'y a pas manche nulle

            aJouer--;
        }

    }
}
