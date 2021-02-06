import java.util.PropertyPermission;

public class Principale {
    public static void main(String[] args) {

        int scorej1 = 0;
        int scorej2 = 0;

        Pep8.stro("-----------------------------------------------"+
                        "\n"+"--- Bienvenue au jeu de roche-papier-ciseau ---"+"\n"+
                "-----------------------------------------------"
                );
        Pep8.stro("\n\n"+"Combien de manches voulez-vous jouer?");

        int nbrManches = Pep8.deci();

        if (nbrManches%2 == 0) {      // a revoir
            nbrManches++;
        }

        int aJouer = nbrManches;

        int victoire = ((nbrManches-1)/2) + 1;    // a revoir

        Pep8.stro("\n");
        for (int i = 1; i<=nbrManches; i++) {
            Pep8.stro("\n");
            Pep8.stro("Il reste " + aJouer + " manche(s) à jouer.\n");
            Pep8.stro("JOEUR 1, quel est votre choix? [r/p/c]\n");

            Pep8.chari();
            char j1 = Pep8.chari();

            if (j1 != 'r' && j1 != 'p' && j1 != 'c') {
                Pep8.stro("Erreur d'entrée! Programme terminé.\n");
                Pep8.stop();
            }

            Pep8.stro("JOEUR 2, quel est votre choix? [r/p/c]\n");

            Pep8.chari();
            char j2 = Pep8.chari();

            if (j2 != 'r' && j2 != 'p' && j2 != 'c') {
                Pep8.stro("Erreur d'entrée! Programme terminé.\n");
                Pep8.stop();
            }

            if ( (j1=='r'&&j2=='c') || (j1=='c'&&j2=='p') || (j1=='p'&&j2=='r')) {
                scorej1++;
                Pep8.stro("JOUEUR 1 a gagné cette manche! Score: " + scorej1 + "-" + scorej2 + "\n");
                if (scorej1 == victoire) {
                    Pep8.stro("\nJOUEUR 1 A GAGNÉ LE MATCH! FÉLICITATIONS!\n");
                    Pep8.stro("SCORE FINAL: " + scorej1 + "-" + scorej2);
                    break;
                }
            } else if ((j2=='r'&&j1=='c') || (j2=='c'&&j1=='p') || (j2=='p'&&j1=='r')) {
                scorej2++;
                Pep8.stro("JOUEUR 2 a gagné cette manche! Score: " + scorej1 + "-" + scorej2 + "\n");
                if (scorej2 == victoire){
                    Pep8.stro("\nJOUEUR 2 A GAGNÉ LE MATCH! FÉLICITATIONS!\n");
                    Pep8.stro("SCORE FINAL: " + scorej1 + "-" + scorej2);
                    break;
                }
            } else {
                i--;
                Pep8.stro("Manche nulle...");
                Pep8.stro("\n");
                continue;
            }

            aJouer--;
        }

    }
}
