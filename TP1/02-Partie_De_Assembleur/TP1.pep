BR msgDeb





msgDeb:          STRO        msgLine,d
                 STRO        msgB,d
                 STRO        msgLine,d
                 BR          prenNum



prenNum:         STRO        msgNum,d ;ERROR: Addressing mode required for this instruction.
                 DECI        manches,d
                 LDA         manches,d
                 BR          verifNum


verifNum:        ANDA        1,i
                 CPA         0,i
                 BREQ        pair
                 BR          manRest

pair:            LDA         manches,d
                 ADDA        1,i
                 STA         manches,d
                 BR          manRest

manRest:         STRO        msgRest1,d
                 DECO        manches,d
                 STRO        msgRest2,d



STOP


msgLine:         .ASCII      "---------------------------------------------\n\x00"
msgB:            .ASCII      "---Bienvenue au jeu de roche-papier-ciseau---\n\x00"
msgNum:          .ASCII      "Combien de manches voulez-vous jouer?\n\x00"
msgRest1:        .ASCII      "Il reste \x00"
msgRest2:        .ASCII      " manches(s) a jouer.\x00"

manches: .BLOCK 2

.END