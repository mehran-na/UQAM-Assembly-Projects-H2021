; Message de debut
STRO     mesdeb1,d 
STRO     mescol,d
STRO     mescol2,d
STRO     mescol3,d 
STRO     mescol4,d 


; Premiere entree (placer les bateaux)
STRO     mesEntr,d

CHARI    grandeur,d
CHARI    orient,d
CHARI    colonne,d
CHARI    rangee,d
CHARI    entree,d
CHARI    entree,d

; Verification de la taille
LDBYTEA  grandeur,d
CPA      'p',i
BREQ     vOrient 
CPA      'm',i
BREQ     vOrient
CPA      'g',i
BREQ     vOrient
BR       erreur

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

; Si l'orientation choisie est valide on continue avec la verification de la colonne
vRangee: LDA     rangee,d
         CPA     1,i
         BRLT    erreur
         CPA     9,i
         BRGT    erreur
         BR      placer         
         ;LDA rangee 
         

                      

; Si l'entree est invalide on affiche un message d'erreur et on recommence
erreur:  CHARO   'n',i

         STOP

placer:  CHARO   'o',i
       

    

         STOP



mesdeb1: .ASCII "Bienvenue au jeu de bataille navale!\n\n\x00" 
mescol:  .ASCII "  ABCDEFGHIJKLMNOPQR\n\x00"
mescol2: .ASCII "1|~~~~~~~~~~~~~~~~~~|\n2|~~~~~~~~~~~~~~~~~~|\n3|~~~~~~~~~~~~~~~~~~|\n\x00"
mescol3: .ASCII "4|~~~~~~~~~~~~~~~~~~|\n5|~~~~~~~~~~~~~~~~~~|\n6|~~~~~~~~~~~~~~~~~~|\n\x00"
mescol4: .ASCII "7|~~~~~~~~~~~~~~~~~~|\n8|~~~~~~~~~~~~~~~~~~|\n9|~~~~~~~~~~~~~~~~~~|\n\x00"

mesEntr: .ASCII "\nEntrer la description et la position des bateaux selon le format suivant, separes par des espaces: taille[p/m/g] orientation[h/v] colonne[A-R] rangée[1-9]\n\n\x00"

flotte:  .BLOCK 162
vague:   .BYTE '~' 
grandeur:        .BLOCK 1        
orient:     .BLOCK 1 
colonne: .BLOCK 1
rangee:  .BLOCK 1

tableau: .BLOCK 100
var:     .BLOCK 1

entree:    .BLOCK 1
 .END