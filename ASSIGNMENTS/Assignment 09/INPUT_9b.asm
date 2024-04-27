INPUT PROC
    
    PUSH BX
    PUSH CX
    PUSH DX
    
    BEGIN:
    ;TOTAL = 0
    XOR BX,BX
   
    ;READ A CHARACTER
    MOV AH,1
    INT 21H    
    
    CMP AL,'-'
    JE BEGIN
    CMP AL,'+'
    JE BEGIN 
    
    
    REPEAT2:
    CMP AL,'0'
    JNGE NOT_DIGIT
    CMP AL,'9'
    JNLE NOT_DIGIT
    
    ;NOW CONVERT CHARACTER TO A DIGIT
    AND AX,000FH
    PUSH AX
    
    ;TOTAL = TOTALx10+DIGIT
    MOV AX,10
    MUL BX
    POP BX
    ADD BX,AX
    
    ;READ A CHARACTER
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JNE REPEAT2
    
    MOV AX,BX
    
    EXIT:
    POP DX
    POP CX
    POP BX
    RET
    
    ;IF ILLEGAL CHARACTER
    NOT_DIGIT:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    JMP BEGIN
    INPUT ENDP