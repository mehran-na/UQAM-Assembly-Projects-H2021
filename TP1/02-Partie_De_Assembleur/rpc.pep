; Le programme ci-dessous permet a deux utilisateurs de jouer au jeu de Pierre-Papier-Ciseau.
; Membres :
;        
;        - Issakha Wade
;
;        - Mehran Nazemi


; Message d'acceuil

         STRO     msgDeb1,d
         STRO     msgDeb2,d
         STRO     msgDeb3,d     
         STRO     msgDeb4,d
         DECI     manches,d

; verifier la parité.

         LDA      manches,d
         ANDA     1,i
         CPA      0,i
         BREQ     pair
         BR       calculV 


; Incremente le nombre de manches a jouer de 1.

pair:    LDA     manches,d
         ADDA    1,i
         STA     manches,d
         BR      calculV

calculV: LDA     manches,d
         ASRA
         ADDA    1,i
         STA     victoire,d
         BR      joueur1

; Recevoir le choix du premier joueur et verifier la validité.
; Le programme s'arrete s'il ne l'est pas.       

joueur1: STRO    msgJeu1,d 
         DECO    manches,d
         STRO    msgJeu2,d
         STRO    msgJ1,d 
         CHARI   choix1,d
         CHARI   esc,d
         LDA     0,i
         LDBYTEA     choix1,d
         CPA     'r',i
         BREQ    joueur2
         CPA     'p',i
         BREQ    joueur2
         CPA     'c',i
         BREQ    joueur2

; Le programme s'arrete si l'entrée du premeir joueur est invalide
            
         BR      arret 

; Recevoir le choix du deuxieme joueur et verifier la validité.
; Le programme s'arrete s'il ne l'est pas.    

joueur2: STRO    msgJ2,d
         CHARI   choix2,d 
         CHARI   esc,d
         LDA     0,i
         LDBYTEA     choix2,d
         CPA     'r',i
         BREQ    jeu
         CPA     'p',i
         BREQ    jeu
         CPA     'c',i
         BREQ    jeu

; Le programme s'arrete si l'entrée du deuxieme joueur est invalide

         BR      arret 
   
; Verifie le caractére choisi par le premier joueur

jeu:     LDA     0,i
         LDBYTEA choix1,d  
         CPA     'r',i
         BREQ    RcC
         CPA     'c',i
         BREQ    CcP
         CPA     'p',i
         BREQ    PcR

; Si le premier joueur choisi Roche, on verifie que le deuxieme a choisi Ciseau si c'est le cas il gagne 
; sinon le deuxieme joueur l'emporte. 
; s'il y a egalité on recommence la manche.

RcC:     LDA     0,i
         LDBYTEA choix2,d
         CPA     'r',i
         BREQ    egalite
         CPA     'c',i
         BREQ    j1gagne
         BR      j2gagne

; Si le premier joueur choisi Ciseau, on verifie que le deuxieme a choisi Papier si c'est le cas il gagne 
; sinon le deuxieme joueur l'emporte. 
; s'il y a egalité on recommence la manche.

CcP:     LDA     0,i
         LDBYTEA choix2,d
         CPA     'c',i
         BREQ    egalite
         CPA     'p',i
         BREQ    j1gagne
         BR      j2gagne

; Si le premier joueur choisi Papier, on verifie que le deuxieme a choisi Roche si c'est le cas il gagne 
; sinon le deuxieme joueur l'emporte. 
; s'il y a egalité on recommence la manche.

PcR:     LDA     0,i
         LDBYTEA choix2,d
         CPA     'p',i
         BREQ    egalite
         CPA     'r',i
         BREQ    j1gagne
         BR      j2gagne
         
         
; En cas d'egalité un message est affiché et on recommence la manche

egalite: STRO    msgEgal,d
         BR      joueur1

; Si le premier gagne un message s'affiche et on verfie son score, s'il a gagner assez de manches pour
; remporter la partie on arrete le jeu sinon on continue

j1gagne: LDA     score1,d
         ADDA    1,i
         STA     score1,d
         STRO    j1,d
         DECO    score1,d
         CHARO   tiret,d
         DECO    score2,d
         STRO    esp,d 
         LDA     manches,d
         SUBA    1,i
         STA     manches,d
         LDA     victoire,d
         CPA     score1,d
         BREQ    finJ1
         BR      joueur1
         
; Si le deuxieme gagne un message s'affiche et on verfie son score, s'il a gagner assez de manches pour
; remporter la partie on arrete le jeu sinon on continue

j2gagne: LDA     score2,d
         ADDA    1,i
         STA     score2,d
         STRO    j2,d
         DECO    score1,d
         CHARO   tiret,d
         DECO    score2,d
         STRO    esp,d 
         LDA     manches,d
         SUBA    1,i
         STA     manches,d
         LDA     victoire,d
         CPA     score2,d
         BREQ    finJ2
         BR      joueur1

; Message a afficher si le premier joueur gagne

finJ1:   STRO    j1vict,d
         STRO    scoreF,d
         DECO    score1,d
         CHARO   tiret,d
         DECO    score2,d
         BR      arret

; Message a afficher si le premier joueur gagne

finJ2:   STRO    j2vict,d
         STRO    scoreF,d
         DECO    score1,d
         CHARO   tiret,d
         DECO    score2,d
         BR      arret
              

arret:   STRO    msgErr,d  
         STOP


msgDeb1: .ASCII "-----------------------------------------------\n\x00"
msgDeb2: .ASCII "--- Bienvenue au jeu de roche-papier-ciseau ---\n\x00"  
msgDeb3: .ASCII "-----------------------------------------------\n\n\x00"   
msgDeb4: .ASCII "Combien de manches voulez-vous jouer?\n\x00" 

msgJeu1:  .ASCII "\nIl reste \x00"
msgJeu2: .ASCII " manche(s) à jouer.\n\x00"

msgJ1:   .ASCII "JOUEUR 1, quel est votre choix? [r/p/c]\n\x00"
msgJ2:   .ASCII "JOUEUR 2, quel est votre choix? [r/p/c]\n\x00"
msgErr:  .ASCII "\n\nErreur d'entrée! Programme terminé\x00."

msgEgal: .ASCII  "Manche nulle\n\x00"
tiret:   .BYTE '-'
j1:      .ASCII "JOUEUR 1 a gagné cette manche! Score: \x00" 
j2:      .ASCII "JOUEUR 2 a gagné cette manche! Score: \x00"
j1vict:  .ASCII "\n\nJOUEUR 1 A GAGNÉ LE MATCH! FÉLICITATIONS!\n\x00"
j2vict:  .ASCII "\n\nJOUEUR 2 A GAGNÉ LE MATCH! FÉLICITATIONS!\n\x00"
scoreF:  .ASCII "SCORE FINAL: \x00"

manches: .BLOCK 2
choix1:  .BYTE 0 
choix2:  .BYTE 0
score1:  .WORD 0
score2:  .WORD 0
victoire:        .WORD 0
esc:     .BYTE 0
esp:     .ASCII "\n\x00"



         .END    
 