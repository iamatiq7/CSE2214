.MODEL SMALL
.STACK 100H

.DATA
INPUT_MSG DB "ENTER A STRING: $"
INPUT_S DB 0DH,0AH,"ENTER POSITION: $"
INPUT_N DB 0DH,0AH,"ENTER NUMBER OF BYTE: $"
OUTPUT_MSG DB 0DH,0AH,"RESULTED STRING: $"
STRING DB 80 DUP (0)
NEW_LINE DB 0DH,0AH,'$'
S DB ?
N DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
    LEA DX,INPUT_MSG
    MOV AH,9
    INT 21H
    
    ;READ A STRING
    LEA DI,STRING
    CALL READ_STR
    
    LEA DX,INPUT_S
    MOV AH,9
    INT 21H
    
    ;READ S
    CALL INPUT_DEC
    MOV S,AL
    
    LEA DX,INPUT_N
    MOV AH,9
    INT 21H
    
    ;READ N
    CALL INPUT_DEC    
    MOV N,AL
    
            
    XOR AH,AH
    MOV AL,S        
    CMP AX,BX
    JG OUTPUT
    
    CMP N,0
    JE OUTPUT
    
    
    
    LEA SI,STRING
    CALL DELETE 
    
    
    OUTPUT:
    LEA DX,OUTPUT_MSG
    MOV AH,9
    INT 21H
    
    LEA SI,STRING
    CALL DISP_STR
    
    
    ;RETURN TO OS
    MOV AH,4CH
    INT 21H
    MAIN ENDP
INCLUDE input_string_b.asm
INCLUDE input_dec.asm
INCLUDE output_string_b.asm
INCLUDE delete.asm
END MAIN
    
    
    