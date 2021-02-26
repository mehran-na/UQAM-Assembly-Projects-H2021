BR msgDeb





msgDeb:          STRO        msgLine,d
                 STRO        msgB,d
                 STRO        msgLine,d
                 BR          prenNum



prenNum:         DECI        manches,d
                 LDA         manches,d
                 BR          verifNum


verifNum:        ANDA        1,i
                 CPA         0,i
                 BREQ        pair
                 BR          joueur1

pair:            LDA         manches,d
                 ADDA        1,i
                 STA         manches,d
                 BR          joueur1

joueur1:         STRO        msgJ,d
                 DECO        manches,d

STOP


msgLine:         .ASCII      "---------------------------------------------\n\x00"
msgB:            .ASCII      "---Bienvenue au jeu de roche-papier-ciseau---\n\x00"
msgJ:            .ASCII      "this is joueur 1 et manches est : "

manches: .BLOCK 2

.END