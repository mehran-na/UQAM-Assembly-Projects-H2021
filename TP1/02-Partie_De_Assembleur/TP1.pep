msgDeb:          STRO        msgLine,d
                 STRO        msgB,d
                 STRO        msgLine,d
                 BR          prenNum



prenNum:         STRO        msgNum,d 
                 DECI        manches,d
                 BR          verifNum


verifNum:        LDA         manches,d
                 ANDA        1,i  ;masque
                 CPA         0,i  ;comparer avec zero
                 BREQ        pair
                 BR          manRest

pair:            LDA         manches,d
                 ADDA        1,i
                 STA         manches,d
                 BR          manRest

manRest:         STRO        msgRest1,d 
                 DECO        manches,d
                 STRO        msgRest2,d
                 BR          j1PrCar

j1PrCar:         STRO        msgJ1,d
                 CHARI       j1Choix,d
                 CHARI       garbage,d
                 LDA         0,i
                 LDBYTEA     j1Choix,d
                 CPA         'r',i
                 BREQ        j2PrCar  ;ok
                 CPA         'c',i
                 BREQ        j2PrCar  ;ok
                 CPA         'p',i
                 BREQ        j2PrCar  ;ok
                 STRO        errorCar,d 
                 STOP        


j2PrCar:         STRO        msgJ2,d
                 CHARI       j2Choix,d
                 CHARI       garbage,d
                 LDA         0,i
                 LDBYTEA     j2Choix,d
                 CPA         'r',i
                 BREQ        comparer  ;ok 
                 CPA         'c',i
                 BREQ        comparer  ;ok
                 CPA         'p',i
                 BREQ        comparer  ;ok
                 STRO        errorCar,d 
                 STOP


comparer:        LDA         0,i
                 LDBYTEA     j1Choix,d
                 CPA         'r',i
                 BREQ        j2R
                 CPA         'c',i
                 BREQ        j2C
                 CPA         'p',i
                 BREQ        j2P

j2R:             LDA         0,i
                 LDBYTEA     j2Choix,d
                 CPA         'c',i
                 BREQ        j1Gagne
                 CPA         'p',i
                 BREQ        j2Gagne
                 CPA         'r',i
                 BREQ        nullRes

j2C:             LDA         0,i
                 LDBYTEA     j2Choix,d
                 CPA         'c',i
                 BREQ        nullRes
                 CPA         'p',i
                 BREQ        j1Gagne
                 CPA         'r',i
                 BREQ        j2Gagne


j2P:             LDA         0,i
                 LDBYTEA     j2Choix,d
                 CPA         'c',i
                 BREQ        j2Gagne
                 CPA         'p',i
                 BREQ        nullRes
                 CPA         'r',i
                 BREQ        j1Gagne

  
j1Gagne:         LDA         j1Score,d 
                 ADDA        1,i
                 STA         j1Score,d
                 STRO        msgJ1Ga,d
                 DECO        j1Score,d
                 CHARO       '-',i
                 DECO        j2Score,d
                 BR          manMoins

j2Gagne:         LDA         j2Score,d
                 ADDA        1,i
                 STA         j2Score,d
                 STRO        msgJ2Ga,d
                 DECO        j1Score,d
                 CHARO       '-',i
                 DECO        j2Score,d
                 BR          manMoins           

nullRes:         STRO        msgNull,d 
                 BR          manRest


manMoins:        LDA         manches,d
                 SUBA        1,i
                 STA         manches,d
                 BR          CheckFin

CheckFin:        LDA         j1Score,d
                 CPA         j2Score,d
                 BRGT        gScoreJ1 
                 BRLT        gScoreJ2

gScoreJ1:        LDA         j1Score,d
                 CPA         manches,d
                 BRGT        finJ1
                 BR          manRest

finJ1:           STRO        msgJ1Gag,d
                 DECO        j1Score,d
                 CHARO       '-',i
                 DECO        j2Score,d
                 STOP 
  
gScoreJ2:        LDA         j2Score,d
                 CPA         manches,d
                 BRGT        finJ2
                 BR          manRest

finJ2:           STRO        msgJ2Gag,d
                 DECO        j1Score,d
                 CHARO       '-',i
                 DECO        j2Score,d
                 STOP             


STOP


msgLine:         .ASCII      "---------------------------------------------\n\x00"
msgB:            .ASCII      "---Bienvenue au jeu de roche-papier-ciseau---\n\x00"
msgNum:          .ASCII      "Combien de manches voulez-vous jouer?\n\x00"
msgRest1:        .ASCII      "\n\nIl reste \x00"
msgRest2:        .ASCII      " manches(s) a jouer.\n\x00"
msgJ1:           .ASCII      "JOUEUR 1, quel est votre choix? [r/p/c]\n\x00"
msgJ2:           .ASCII      "JOUEUR 2, quel est votre choix? [r/p/c]\n\x00"
errorCar:        .ASCII      "Erreur d entree, programme termine\x00"
msgJ1Ga:         .ASCII      "JOUEUR 1 a gangne cette manche, Score: \x00"
msgJ2Ga:         .ASCII      "JOUEUR 2 a gangne cette manche, Score: \x00"
msgNull:         .ASCII      "Manche nulle...\n\x00"
msgJ1Gag:        .ASCII      "\n\nJOUEUR 1 A GANGNE LE MATCH, FELICITATION\nSCORE FINAL: \x00"
msgJ2Gag:        .ASCII      "\n\nJOUEUR 2 A GANGNE LE MATCH, FELICITATION\nSCORE FINAL: \x00" 

manches:         .BLOCK 2
j1Choix:         .BYTE 0
j2Choix:         .BYTE 0
j1Score:         .BLOCK 2
j2Score:         .BLOCK 2
garbage:         .BLOCK 2

.END