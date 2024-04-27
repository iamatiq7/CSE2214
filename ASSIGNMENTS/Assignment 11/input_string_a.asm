READ_STR PROC
    ;Reads and stores a string
    ;input:DI offset of string
    ;output:DI offset of string
    ;BX:number of characters read
    PUSH AX
    PUSH DI
    CLD
    XOR BX,BX
    MOV AH,1
    INT 21H
    
    INPUT:
    CMP AL,0DH
    JE END_INPUT
    
    CMP AL,8H ;Compare with backspace button
    JNE CHECK_NO
    
    ;If backspace is pressed
    DEC DI
    DEC BX
    JMP READ 
    
    CHECK_NO:
    CMP AL,'0'
    JB READ
    CMP AL,':'
    JB LEGAL
    
    CHECK_CAPITAL:
    CMP AL,'A'
    JB READ
    CMP AL,'['
    JB LEGAL
    
    CHECK_SMALL:
    CMP AL,'a'
    JB READ
    CMP AL,'z'
    JA READ
    
    LEGAL:
    STOSB ;;Moves the content of AL to ES:DI & DI inc
    INC BX
    
    READ:
    INT 21H
    JMP INPUT
    
    END_INPUT:
    POP DI
    POP AX
    
    RET
    READ_STR ENDP
    