public class RPC {

    public static void main(String[] args) {
        int manches;
        char joueurs1Choix;
        char joueurs2Choix;
        int joueurs1Score = 0;
        int joueurs2Score = 0;
        int scoreDifference;

        // un message de bienvenue s'affiche
        System.out.println("-----------------------------------------------\n--- Bienvenue au jeu de roche-papier-ciseau ---\n-----------------------------------------------");

        // demande le nombre de manches qu'on souhaite jouer dans la partie
        System.out.println("Combien de manches voulez-vous jouer ? ");
        manches = Pep8.deci();
        if (manches % 2 == 0) {
            manches++;
        }
        int counter = manches;
        do {
            //for(counter = manches; counter >= 1; counter--) {
                System.out.println("Il reste " + counter + " manche(s) à jouer.");

                System.out.println("JOUEUR 1, quel est votre choix? [r/p/c]");
                Pep8.chari();
                joueurs1Choix = Pep8.chari();
                if (joueurs1Choix != 'r' && joueurs1Choix != 'p' && joueurs1Choix != 'c') {
                    System.out.println("Erreur d'entrée! Programme terminé.");
                    Pep8.stop();
                }

                System.out.println("JOUEUR 2, quel est votre choix? [r/p/c]");
                Pep8.chari();
                joueurs2Choix = Pep8.chari();
                if (joueurs2Choix != 'r' && joueurs2Choix != 'p' && joueurs2Choix != 'c') {
                    System.out.println("Erreur d'entrée! Programme terminé.");
                    Pep8.stop();
                }

                switch (joueurs1Choix) {
                    case 'r':
                        if (joueurs2Choix == 'r') {
                            System.out.println("Manche null \n");
                        }else if (joueurs2Choix == 'c') {
                            joueurs1Score++;
                            System.out.println("JOUEUR 1 a gagné cette manche! Score:" + joueurs1Score + "-" + joueurs2Score + "\n");
                            counter--;
                        }else{
                            joueurs2Score++;
                            System.out.println("JOUEUR 2 a gagné cette manche! Score:" + joueurs1Score + "-" + joueurs2Score + "\n");
                            counter--;
                        }
                        break;

                    case 'c':
                        if (joueurs2Choix == 'r') {
                            joueurs2Score++;
                            System.out.println("JOUEUR 2 a gagné cette manche! Score:" + joueurs1Score + "-" + joueurs2Score + "\n");
                            counter--;
                        }else if (joueurs2Choix == 'c') {
                            System.out.println("Manche null + \n");
                        }else{
                            joueurs1Score++;
                            System.out.println("JOUEUR 1 a gagné cette manche! Score:" + joueurs1Score + "-" + joueurs2Score + "\n");
                            counter--;
                        }
                        break;

                    case 'p':
                        if (joueurs2Choix == 'r') {
                            joueurs1Score++;
                            System.out.println("JOUEUR 1 a gagné cette manche! Score:" + joueurs1Score + "-" + joueurs2Score + "\n");
                            counter--;
                        }else if (joueurs2Choix == 'c') {
                            joueurs2Score++;
                            System.out.println("JOUEUR 1 a gagné cette manche! Score:" + joueurs1Score + "-" + joueurs2Score + "\n");
                            counter--;
                        }else{
                            System.out.println("Manche null \n");
                        }
                        break;
                }
            //}
            if(joueurs1Score >= joueurs2Score){
                scoreDifference = joueurs1Score - joueurs2Score;
            }else{
                scoreDifference = joueurs2Score - joueurs1Score;
            }

        } while (counter > scoreDifference);

        if (joueurs1Score > joueurs2Score) {
            System.out.println("Joueur1 a gagné le match! félicitation !");
        }else{
            System.out.println("Joueur2 a gagné le match! félicitation !");
        }
        System.out.println("Score final " + joueurs1Score + " - " + joueurs2Score);
    }
}
