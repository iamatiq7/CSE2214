OUTPUT PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    END_IF1:
    ;GET DECIMAL DIGITS
    XOR CX,CX
    MOV BX,10D
    
    REPEAT1:
    XOR DX,DX
    DIV BX
    PUSH DX
    INC CX
    
    OR AX,AX
    JNE REPEAT1
    
    MOV AH,2
    
    PRINT_LOOP:
    POP DX
    OR DL,30H
    INT 21H
    LOOP PRINT_LOOP
    
    ;END
    POP DX
    POP CX
    POP BX
    POP AX
    RET
    
    OUTPUT ENDP