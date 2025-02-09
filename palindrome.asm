.ORIG x3000

    ; load the location of string
    LD R1, STARTING 
    LD R2, STARTING
    AND R3, R3, #0 

READING ; reads current string character
    LDR R3, R2, #0 
    ADD R3, R3, #0 
    BRz SUBR2 
    ADD R2, R2, #1
    ADD R6, R6, #1 ; counter for length
    BRnp READING
    
SUBR2 ; to account for extra length from reading string
    ADD R2, R2, #-1
    ADD R6, R6, #-1
    
ENDOFSTRING ; 
    AND R3, R3, #0
    AND R4, R4, #0
    
    ; -R1 loaded into R4
    LDR R4, R1, #0
    NOT R4, R4
    ADD R4, R4, #1
    
    ; R2 loaded into R3
    LDR R3, R2, #0
    
    ; checking if same character
    AND R5, R5, #0
    ADD R5, R4, R3
    BRnp NOTPAL ; if not then go to NOTPAL
    
    ADD R2, R2, #-1 ; look at next character
    ADD R1, R1, #1 ; look at next character
    
    ADD R6, R6, #-1 ; decrement length counter
    BRz PAL
    BRnzp ENDOFSTRING

PAL ; string is palindrome
    AND R3, R3, #0
    ADD R3, R3, #1 
    STI R3, PALINDROME
    BRnzp DONE
    
NOTPAL ; string is not palindrome
    AND R3, R3, #0
    ADD R3, R3, #-1
    STI R3, PALINDROME
    
DONE ; exit program
    HALT

; data for program
STARTING .FILL x5000
PALINDROME .FILL x6000

.END
