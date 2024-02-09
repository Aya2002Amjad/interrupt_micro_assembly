*https://drive.google.com/file/d/1Y6J6TzF0VTbDTuiAqbVab-iK1oZvH9k0/view?usp=sharing
*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    0
    DC.L  $00FFFFF0
    DC.L  $00000500
    
    ORG    $07C
    DC.L   $2000
    
    *RESET 
    
    ORG $500
     MOVEA.L  #$E00000,A3
     MOVE.L   #0,D1
     LEA     SEVEN_SEG_CODES ,A2
    
     MOVE    #13,D0
     LEA     START_TEXT,A1
     TRAP    #15
    
        BRA  XX1
       
invalid:  
           MOVE    #13,D0
           LEA     TEXT6,A1
           TRAP    #15
                      


XX1:       MOVE    #13,D0
           LEA     TEXT0,A1
           TRAP    #15
           LEA     $100,A1
           MOVE    #2,D0
           TRAP    #15
           
   
        MOVEA  A1,A4
        MOVE   #6,D1  
        LEA   TEXT4,A1
Loop2:  CMP.B (A4)+,(A1)+
        BNE    invalid
        SUB   #1,D1 
        BNE   Loop2
          
         MOVE    #13,D0
         LEA     TEXT3,A1
         TRAP    #15
         LEA     $100,A1
         MOVE    #2,D0
         TRAP    #15 
 
       MOVEA  A1,A4
       MOVE   #7,D1 
       LEA   TEXT5,A1
Loop3: CMP.B (A4)+,(A1)+
       BNE  invalid 
       SUB #1,D1
       BNE   Loop3
           
       MOVE    #13,D0
       LEA     TEXT7,A1
       TRAP    #15
      
     MOVE.B #$FF,$E00010
     BSR     DELAY
     MOVE.B #00,$E00010
     BSR     DELAY
     MOVE.B #$FF,$E00010
     BSR     DELAY
     MOVE.B #00,$E00010
     BSR     DELAY
     MOVE.B #$FF,$E00010
     
    
    MOVE    #$2000,SR
    
    
    BRA     START
    
 *LEVEL 7
    ORG  $2000
LEVEL_7_INTURRUPT:

    MOVE    #0,D1
    MOVE    #13,D0
    LEA     TEXT1,A1
    TRAP    #15
XX2: MOVE.L #$E00000,A3 
Loop4: MOVE    #3,D0
    TRAP    #15
    BSR     DELAY
    MOVE    #14,D0
    LEA     TEXT2,A1
    TRAP    #15
    BSR     DELAY
    MOVE.B  $E00000,$E00010
    MOVE.B  (A2,D1),(A3)
    ADDA.L  #2,A3
    BSR     DELAY 
    ADD.L   #1,D1
    CMPA.L  #$E00010, A3
    BEQ     XX2
    BRA     LOOP4
    BRA     START    
     
DELAY:   MOVE.L  #1000000,D5
LOOP1:    SUB.L   #1,D5
         BNE   LOOP1
         RTS
         
         
START_TEXT:  DC.B  'welcome frome hardwere reset ... ',CR,LF,BEL,0
TEXT0: DC.B  'Pleas enter name login ',CR,LF,0
TEXT3: DC.B  'Pleas enter password ',CR,LF,0
TEXT4: DC.B  'admain ',0
TEXT5: DC.B  'aya2002',0
TEXT6: DC.B  'invalid login or password message try again',CR,LF,0
TEXT7: DC.B  'welcome the user ',CR,LF,0
TEXT1:       DC.B   FF,'Welcome frome interrupt level_7 ....',0
TEXT2:        DC.B '.... ',0
SEVEN_SEG_CODES:  dc.b %1110110,%1111001,%0111000,%0111000,%10111111,%1110110,%1110111,%1101101,%1101101,%1110111,%1010100,%1101101,%1111101,%0000111,%1100110

     


     ORG $1000
   
START:                  ; first instruction of program


* Put program code here
      MOVE.L  #0,D6
LOOP: ADD.L  #1,D6
       BSR    DELAY
       BRA    LOOP


    SIMHALT             ; halt simulator

* Put variables and constants here
BEL  EQU   $07
BS   EQU   $08
HT   EQU   $09
LF   EQU   $0A
VT   EQU   $0B
FF   EQU   $0C
CR   EQU   $0D


    END    START        ; last line of source

  
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
