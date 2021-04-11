; Ce programme permet de participer a un jeu de bataille navale dont les deux etapes sont :
;        - Le placement des bateaux
;        - La destruction de ces derniers
;
; Issakha Wade               WADI82030002
; Mehran Nazemi              NAZM30085507




; Message de debut
debut:   STRO     mesdeb1,d 
         STRO     mescol,d
         STRO     mescol2,d
         STRO     mescol3,d 
         STRO     mescol4,d 


; On demande a l'utilisateur de rentrer des requetes
         STRO     mesEntr,d

; On initiliase la flotte avec des vagues
flotteD: LDBYTEA vague,d
         LDX     ptr,d
         STBYTEA flotte,x
         ADDX    1,i
         STX     ptr,d
         CPX     162,i
         BRLE    flotteD
         BR      Lecture
           
Lecture: CHARI    grandeur,d
         CHARI    orient,d
         CHARI    colonne,d
         CHARI     rangee,d
         CHARI    esp,d

; Verification de la taille
         LDBYTEA  grandeur,d
         CPA      'p',i
         BREQ     nbrApl 
         CPA      'm',i
         BREQ     nbrApl
         CPA      'g',i
         BREQ     nbrApl
         BR       erreur

; A partir de la grandeur, on determine le nombre de bateaux a placer
nbrApl:  LDA     0,i
         LDBYTEA grandeur,d
         CPA     'm',i
         BREQ    placer3 
         CPA     'g',i
         BREQ    placer5
         LDA     nbrBat,d
         ADDA    1,i
         STA     nbrBat,d
         BR      vOrient

placer3: LDA     3,i
         STA     nbrApla,d
         LDA     nbrBat,d
         ADDA    3,i
         STA     nbrBat,d
         BR      vOrient

placer5: LDA     5,i
         STA     nbrApla,d
         LDA     nbrBat,d
         ADDA    5,i
         STA     nbrBat,d
         BR      vOrient      

; Si la grandeur choisie est valide on continue avec la verification de l'orientation
vOrient: LDA     0,i
         LDBYTEA orient,d
         CPA     'h',i
         BREQ    vColonne 
         CPA     'v',i
         BREQ    vColonne
         BR      erreur

; Si l'orientation choisie est valide on continue avec la verification de la colonne
vColonne:LDA     0,i
         LDBYTEA colonne,d
         CPA     'A',i
         BRLT    erreur
         CPA     'R',i
         BRGT    erreur
         BR      vRangee

; Si l'orientation choisie est valide on continue avec la verification de la rangee
vRangee: LDA     0,i
         LDBYTEA     rangee,d
         CPA     '1',i
         BRLT    erreur
         CPA     '9',i
         BRGT    erreur
         BR      vEsp         
          
; On verifie ensuite que le caractere de separation est un espace
vEsp:    LDA     0,i
         LDBYTEA esp,d
         CPA     ' ',i
         BREQ    stocker
         CPA     '\n',i
         BREQ    stocker
         BR      erreur         

                      

; Si l'entree est invalide on affiche un message d'erreur et on recommence
erreur:  STRO    mErr,d
         LDA     0,i
         LDBYTEA esp,d
         CPA     '\n',i
         BREQ    Lecture
         BR      effacer      
       
; S'il reste des caracteres a lire cela est fait avant de rebrancher dans lecture
effacer: CHARI   temp,d
         LDBYTEA temp,d
         CPA     '\n',i
         BREQ    flotteD 
         BR      effacer           

; On stocke chaque bateau dans notre flotte 
stocker: LDA    0,i
         LDBYTEA colonne,d
         SUBA    'A',i
         STA     position,d
         LDBYTEX     rangee,d
         SUBX    '1',i
         CPX     1,i
         BRGE    positM
         BR      posit2 
         
; On obtient la position a laquelle placer le bateau avec une incrementation de 18        
positM:  ADDA    18,i
         SUBX    1,i
         CPX     1,i
         BRGE    positM
         BR      posit2
         
; On determine quel type de bateau placer
posit2:  STA     position,d
         LDBYTEA orient,d
         CPA     'h',i
         BREQ    placerH
         BR      placerV 

; placer autant de bateau horizontal que necessaire et recommencer le processus s'il reste des requetes. 
placerH: LDBYTEA '>',i
         LDX     position,d
         STBYTEA     flotte,x
         ADDX    1,i
         STX     position,d
         LDA     nbrApla,d
         SUBA    1,i
         STA     nbrApla,d
         CPA     1,i
         BRGE    placerH
         LDX     0,i
         STX     position,d
         LDA     0,i
         LDBYTEA esp,d
         CPA     '\n',i
         BREQ    affich 
         BR      Lecture             

; placer autant de bateau vertical que necessaire et recommencer le processus s'il reste des requetes. 
placerV: LDBYTEA 'V',i
         LDX     position,d
         STBYTEA     flotte,x
         ADDX    1,i
         STX     position,d
         LDA     nbrApla,d
         SUBA    1,i
         STA     nbrApla,d
         CPA     1,i
         BRGE    placerH
         LDX     0,i
         STX     position,d
         LDA     0,i
         LDBYTEA esp,d
         CPA     '\n',i
         BREQ    affich 
         BR      Lecture   


; On affiche une mise a jour de la flotte avec les bateaux
affich:  CHARO   '\n',i
         STRO    mescol,d
         LDX     0,i
         
ligne:   LDA     lignes,d
         CPA     9,i
         BRGT    partie2 
         DECO    lignes,d
         ADDA    1,i
         STA     lignes,d
         CHARO   '|',i
         
         
         LDA     0,i
bat:     CHARO   flotte,x
         ADDX    1,i
         ADDA    1,i
         CPA     18,i
         BRLT    bat
         CHARO   '|',i
         CHARO   '\n',i
         BR      ligne
                       
; On entame la partie 2 ou l'utilisateur rentre des requetes de coups de feu        
partie2: CHARO    '\n',i
         STRO    mesF,d
         CHARI   colonne2,d
         CHARI   rangee2,d
         CHARI   esp2,d
         
         LDA     0,i
         LDBYTEA colonne2,d
         CPA     'A',i
         BRLT    partie2
         CPA     'R',i
         BRGT    partie2
         LDA     0,i
         LDBYTEA rangee2,d
         CPA     '1',i
         BRLT    partie2
         CPA     '9',i
         BRGT    partie2
         LDA     0,i
         LDBYTEA esp2,d
         CPA     ' ',i
         BREQ    placerC
         CPA     '\n',i
         BREQ    placerC
         BR      partie2

; On verfie la validité de la requete. Si cette derniere est invalide on l'ignore et on passe a la prochaine
placerC: LDA    0,i
         LDBYTEA colonne2,d
         SUBA    'A',i
         STA     positio2,d 
         LDBYTEX rangee2,d
         SUBX    '1',i
         CPX     1,i
         BRGE    positM2
         BR      posit22                

; On determine la position du bateau a detruire                               
positM2: ADDA    18,i
         SUBX    1,i
         CPX     1,i
         BRGE    positM2
         BR      posit22

; Si la position visée est une vague elle est remplacée par 'o' sinon par '*'
posit22: STA     positio2,d 
         LDA     0,i
         LDX     positio2,d
         LDBYTEA flotte,x
         CPA     '~',i
         BRNE    detrB
         LDA     0,i
         LDBYTEA 'o',i
         STA     flotte,x
         LDX     0,i
         STX     positio2,d
         BR      affich2
         
; Detruire un bateau et remplacer par '*'
detrB:   LDA     nbrBat,d
         SUBA    nbrBat,d
         STA     nbrBat,d         
         LDA     0,i
         LDBYTEA '*',i
         STA     flotte,x
         LDX     0,i
         STX     positio2,d
         BR      affich2

; On affiche le resultat apres les tirs.
affich2: CHARO   '\n',i
         STRO    mescol,d
         LDX     0,i
     
         
ligne2:  LDA     lignes2,d
         CPA     9,i
         BRGT    verifier 
         DECO    lignes2,d
         ADDA    1,i
         STA     lignes2,d
         CHARO   '|',i
         LDA     0,i
         BR      bat2
         
bat2:    CHARO   flotte,x
         ADDX    1,i
         ADDA    1,i
         CPA     18,i
         BRLT    bat2
         CHARO   '|',i
         CHARO   '\n',i
         BR      ligne2        

; On verifie que tous les bateaux sont detruits, dans le cas contraie on recommence
verifier:LDA     nbrBat,d
         CPA     0,i
         BRGT    partie2
 
        BR      victoire        

; A la fin de partie, on demande a l'utilisateur s'il souhaite commencer une autre partie
victoire:STRO    vic,d
         CHARI   opt,d
         LDBYTEA opt,d
         CPA     '\n',i
         BREQ     debut
         BR      fin

; Message de fin dans le cas ou l'utilisateur souhaite arreter de jouer
fin:     STRO    fn,d                  

         STOP



mesdeb1: .ASCII "Bienvenue au jeu de bataille navale!\n\n\x00" 
mescol:  .ASCII "  ABCDEFGHIJKLMNOPQR\n\x00"
mescol2: .ASCII "1|~~~~~~~~~~~~~~~~~~|\n2|~~~~~~~~~~~~~~~~~~|\n3|~~~~~~~~~~~~~~~~~~|\n\x00"
mescol3: .ASCII "4|~~~~~~~~~~~~~~~~~~|\n5|~~~~~~~~~~~~~~~~~~|\n6|~~~~~~~~~~~~~~~~~~|\n\x00"
mescol4: .ASCII "7|~~~~~~~~~~~~~~~~~~|\n8|~~~~~~~~~~~~~~~~~~|\n9|~~~~~~~~~~~~~~~~~~|\n\x00"

mesEntr: .ASCII "\nEntrer la description et la position des bateaux selon le format suivant, separes par des espaces: taille[p/m/g] orientation[h/v] colonne[A-R] rangée[1-9]\n\n\x00"
mErr:    .ASCII  "\nFormat d'entrée invalide, veuillez recommencer\n\n\x00"
mesF:    .ASCII "Feu à volonté!\n(entrer les coups à tirer: colonne [A-R] rangée [1-9])\n\n\x00"
vic:      .ASCII "\nVous avez anéanti la flotte! Appuyer sur pour jouer à nouveau ou n'importe quelle autre saisie pour quitter.\n\x00"
fn:      .ASCII  "Au revoir!\x00"

flotte:  .BLOCK 162
vague:   .BYTE '~' 
grandeur:        .BLOCK 1        
orient:     .BLOCK 1 
colonne: .BLOCK 1
rangee:  .BLOCK 2

colonne2:.BLOCK  1
rangee2: .BLOCK  2
esp2:    .BLOCK  1

opt:       .BYTE 1
lignes:   .WORD 1
lignes2: .WORD 1 

nbrApla:     .WORD 1
nbrBat:  .WORD 0 

esp:    .BLOCK 1
temp:    .BLOCK 1
ptr:     .WORD 0
position:        .WORD 0
positio2:  .WORD 0        
 .END