         LDX     0,i         
in_loop: CPX     24,i        
         BRGE    afficher    ; for(X=0;X<24;X+=2) {
         DECI    vecteur,x   ;   vecteur[X] = getInt();
         ADDX    2,i         
         BR      in_loop     ; } // fin for




rec:     LDX     0,i
         STRO    msg2,d
         DECI    lign,d
         STRO    msg3,d
         DECI    colonne,d
         LDX     lign,d
         ADDX    colonne,d
         LDA     0,i
         STA     vecteur,x   
         BR      afficher     

afficher:LDX     0,i         
         STX     ix,d        
loop_ix: CPX     24,i        
         BRGE    fin         ; for(ix=0;ix<24;ix+=8) {
         LDX     0,i         
         STX     jx,d        
loop_jx: CPX     8,i         
         BRGE    next_ix     ;   for(jx=0;jx<8;jx+=2) {
         ADDX    ix,d        
         DECO    vecteur,x   
         CHARO   ' ',i       ;     print(vecteur[ix+jx], " ");
         LDX     jx,d        
         ADDX    2,i         
         STX     jx,d        
         BR      loop_jx     ;   } // fin for jx
next_ix: CHARO   '\n',i      ;
         LDX     ix,d        
         ADDX    8,i         
         STX     ix,d        
         BR      loop_ix     ; } // fin for ix


fin:     STRO    msg,d
         DECI    decide,d
         LDX     decide,d
         CPX     1,i
         BREQ    rec
         STRO    msgBye,d
         STOP          



STOP                ; exit();
; Variables globales
vecteur: .BLOCK  24          ; #2d12a vecteur de 10 entiers
ix:      .BLOCK  2           ; #2d itérateur ix pour tri
jx:      .BLOCK  2           ; #2d itérateur jx pour tri
lign:    .BLOCK  2
colonne:    .BLOCK  2
droit:   .BLOCK  2
gauche:  .BLOCK  2
haut:    .BLOCK  2
bas:     .BLOCK  2
result:  .BLOCK  2
msg:     .ASCII  "Est-ce que vous voulez changer matrix ? (oui = 1, non = 0) \n \x00"
msg2:     .ASCII  "Entre ligne \n \x00"
msg3:     .ASCII  "Entre clone \n \x00"
msgBye:     .ASCII  "BYE \n \x00"
decide:  .BLOCk  2
         .END                  