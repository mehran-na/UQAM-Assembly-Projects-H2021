;
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
         BR       joueur1 


; Incremente le nombre de manches a jouer de 1.

pair:    LDA     manches,d
         ADDA    1,i
         STA     manches,d

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
            
         BR      fin 

; Recevoir le choix du deuxieme joueur et verifier la validité.
; Le programme s'arrete s'il ne l'est pas.    

joueur2: STRO    msgJ2,d
         CHARI   choix2,d 
         CHARI   esc,d
         LDA     0,i
         LDBYTEA     choix2,d
         CPA     'r',i
         ;BREQ    

         STOP

fin:     STOP


msgDeb1: .ASCII "-----------------------------------------------\n\x00"
msgDeb2: .ASCII "--- Bienvenue au jeu de roche-papier-ciseau ---\n\x00"  
msgDeb3: .ASCII "-----------------------------------------------\n\n\x00"   
msgDeb4: .ASCII "Combien de manches voulez-vous jouer?\n\x00" 

msgJeu1:  .ASCII "\nIl reste \x00"
msgJeu2: .ASCII " manche(s) à jouer.\n\x00"

msgJ1:   .ASCII "JOUEUR 1, quel est votre choix? [r/p/c]\n\x00"
msgJ2:   .ASCII "JOUEUR 2, quel est votre choix? [r/p/c]\n\x00"

manches: .BLOCK 2
choix1:  .BYTE 0 
choix2:  .BYTE 0
esc:     .BYTE 0



         .END    
 