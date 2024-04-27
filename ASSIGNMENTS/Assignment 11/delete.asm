DELETE PROC
;SI -> OFFSET OF THE STRING
;BX -> LENGTH OF THE STRING
;S -> POSITION
;N ->  NO OF BYTE TO DELETED

    PUSH BX
    PUSH SI
    PUSH DI
        
      
    CLD
    MOV CX,BX ;-> CX = LENGTH OF THE STRING
    XOR BH,BH ;->BH = 0
    MOV BL,S  ;->BL = S    ->   BX = S
    LEA SI,STRING ;SI -> STRING(0)
    LEA DI,STRING ;DI -> STRING(0)
    SUB CX,BX ; CX = CX - S(POSITION)
    ADD SI,BX ; SI -> SI + POSITION
    ADD DI,BX ; DI -> SI + POSITION
    XOR BH,BH ; BH = 0
    MOV BL,N  ; BL = NO OF BYTE TO DELETED     -> BX =  NO OF BYTE TO DELETED
    ADD SI,BX ; SI -> SI +  NO OF BYTE TO DELETED
    
    
    REMOVE:
    MOVSB
    LOOP REMOVE
    
    
    EXIT1:
    POP DI
    POP SI
    POP BX
    
    RET
    DELETE ENDP
