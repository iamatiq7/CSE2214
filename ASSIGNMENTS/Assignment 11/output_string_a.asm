DISP_STR PROC
    ;Displays a string
    ;input:SI -> offset of string and BX -> no of characters to display
    ;output:none
    
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    
    MOV CX,BX
    JCXZ EXIT
    
    CLD
    MOV AH,2
    PRINT:
    LODSB  ;; Load string byte from DS:SI to AL & SI inc
    MOV DL,AL
    INT 21H
    LOOP PRINT
    
    EXIT:
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
    
    RET
    DISP_STR ENDP