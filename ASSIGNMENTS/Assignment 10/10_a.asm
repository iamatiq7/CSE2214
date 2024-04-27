.MODEL SMALL
.STACK 100H

.DATA
FOUR DB 4
CLASS DB 'MARY ALLEN  ', 67, 45, 98, 33
      DB 'SCOTT BAYLIS', 70, 56, 87, 44
      DB 'GEORGE FRANK', 82, 72, 89, 40
      DB 'SAM WONG    ', 78, 76, 92, 60

AVG DB 4 DUP (0)
NEWLINE DB 0DH,0AH,'$'


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DI,0
    
    
    MOV SI,12
    
    MOV CX,4
    
    ALL_AVG:
    XOR AX,AX
    XOR BX,BX
    
    FIND_AVG:
    XOR DH,DH
    MOV DL,CLASS[SI+BX]
    ADD AX,DX
    INC BX
    CMP BX,3
    JLE FIND_AVG
    
    DIV FOUR
    
    MOV AVG[DI],AL
    INC DI
    
    ADD SI,16
    LOOP ALL_AVG
    
    
    XOR BL,BL
    MOV CX,4
    
    MOV DI,0
    
    

    MOV SI,0
    
    PRINT:
    XOR BX,BX
    MOV AH,2
    PRINT_NAME:
    MOV DL,CLASS[SI+BX]
    INT 21H
    INC BX
    
    CMP BX,11
    JLE PRINT_NAME
    ADD SI,16
    MOV DL,"="
    INT 21H
    XOR AH,AH
    MOV AL,AVG[DI]
    INC DI
    CALL OUTPUT
    
    MOV AH,9
    LEA DX,NEWLINE
    INT 21H
    
    
    LOOP PRINT
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
INCLUDE OUTPUT.ASM
END MAIN