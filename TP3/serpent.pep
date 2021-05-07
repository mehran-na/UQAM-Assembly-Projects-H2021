; Issakha Wade   WADI82030002
; Mehran Nazemi  NAZM30088507

; Message de debut
debut:   STRO     mesdeb1,d 
         STRO     mescol,d
         STRO     mescol2,d
         STRO     mescol3,d 
         STRO     mescol4,d
         STRO     mescol5,d
         STRO     mesEnt,d
         



         STOP



mesdeb1: .ASCII "Bienvenue au serpentin!\n\n\x00" 
mescol:  .ASCII "  ABCDEFGHIJKLMNOPQR\n\x00"
mescol2: .ASCII "1|                  |\n2|                  |\n3|                  |\n\x00"
mescol3: .ASCII "4|                  |\n5|                  |\n6|                  |\n\x00"
mescol4: .ASCII "7|                  |\n8|                  |\n9|                  |\n\x00"
mescol5: .ASCII "  ------------------\x00"
mesEnt: .ASCII "\n\nEntrer un serpent qui part vers l'est :\n{position initiale et parcours}\navec [-] (tout droit), [g] (virage à gauche),[d (virage à droite)]\x00" 

 .END