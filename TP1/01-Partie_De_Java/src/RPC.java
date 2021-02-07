public class RPC {

    public static void main(String[] args) {
        int manches;
        char joueurs1Choix;
        char joueurs2Choix;
        int joueurs1Score = 0;
        int joueurs2Score = 0;
        int scoreDifference;

        // un message de bienvenue s'affiche
        Pep8.stro("-----------------------------------------------\n--- Bienvenue au jeu de roche-papier-ciseau ---\n-----------------------------------------------\n");

        // demande le nombre de manches qu'on souhaite jouer dans la partie
        Pep8.stro("Combien de manches voulez-vous jouer ? ");
        manches = Pep8.deci();
        if (manches % 2 == 0) {
            manches++;
        }
        int counter = manches;
        do {
            Pep8.stro("Il reste " + counter + " manche(s) à jouer.\n");

            //Verification l'entrer de Joueur 1 :
            Pep8.stro("JOUEUR 1, quel est votre choix? [r/p/c]\n");
            Pep8.chari();
            joueurs1Choix = Pep8.chari();
            if (joueurs1Choix != 'r' && joueurs1Choix != 'p' && joueurs1Choix != 'c') {
                Pep8.stro("Erreur d'entrée! Programme terminé.");
                Pep8.stop();
            }

            //Verification l'entrer de Joueur 2 :
            Pep8.stro("JOUEUR 2, quel est votre choix? [r/p/c]\n");
            Pep8.chari();
            joueurs2Choix = Pep8.chari();
            if (joueurs2Choix != 'r' && joueurs2Choix != 'p' && joueurs2Choix != 'c') {
                Pep8.stro("Erreur d'entrée! Programme terminé.");
                Pep8.stop();
            }

            // Le programme compare le choix des deux joueurs et annonce le gagnant de la manche
            switch (joueurs1Choix) {
                case 'r':
                    if (joueurs2Choix == 'r') {
                        Pep8.stro("Manche null \n\n");
                    }else if (joueurs2Choix == 'c') {
                        joueurs1Score++;
                        Pep8.stro("JOUEUR 1 a gagné cette manche! Score:" + joueurs1Score + "-" + joueurs2Score + "\n\n");
                        counter--;
                    }else{
                        joueurs2Score++;
                        Pep8.stro("JOUEUR 2 a gagné cette manche! Score:" + joueurs1Score + "-" + joueurs2Score + "\n\n");
                        counter--;
                    }
                    break;

                case 'c':
                    if (joueurs2Choix == 'r') {
                        joueurs2Score++;
                        Pep8.stro("JOUEUR 2 a gagné cette manche! Score:" + joueurs1Score + "-" + joueurs2Score + "\n\n");
                        counter--;
                    }else if (joueurs2Choix == 'c') {
                        Pep8.stro("Manche null + \n\n");
                    }else{
                        joueurs1Score++;
                        Pep8.stro("JOUEUR 1 a gagné cette manche! Score:" + joueurs1Score + "-" + joueurs2Score + "\n\n");
                        counter--;
                    }
                    break;

                case 'p':
                    if (joueurs2Choix == 'r') {
                        joueurs1Score++;
                        Pep8.stro("JOUEUR 1 a gagné cette manche! Score:" + joueurs1Score + "-" + joueurs2Score + "\n\n");
                        counter--;
                    }else if (joueurs2Choix == 'c') {
                        joueurs2Score++;
                        Pep8.stro("JOUEUR 1 a gagné cette manche! Score:" + joueurs1Score + "-" + joueurs2Score + "\n\n");
                        counter--;
                    }else{
                        Pep8.stro("Manche null \n\n");
                    }
                    break;
            }

            //Calculer la difference entre les scores pour verifier si le match a fini ou non ! :
            if (joueurs1Score >= joueurs2Score) {
                scoreDifference = joueurs1Score - joueurs2Score;
            }else{
                scoreDifference = joueurs2Score - joueurs1Score;
            }

        } while (counter > scoreDifference);

        //Message final : affiche le gagnant du match et le score
        if (joueurs1Score > joueurs2Score) {
            Pep8.stro("Joueur1 a gagné le match! félicitation !\n");
        }else{
            Pep8.stro("Joueur2 a gagné le match! félicitation !\n");
        }
        Pep8.stro("Score final " + joueurs1Score + " - " + joueurs2Score);
    }
}
