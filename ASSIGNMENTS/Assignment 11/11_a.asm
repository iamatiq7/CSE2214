.MODEL SMALL
.STACK 100H

.DATA
INPUT_MSG DB "ENTER A STRING: $"
OUTPUT_MSGY DB 0DH,0AH,"IT IS A PALINDROME.$"
OUTPUT_MSGN DB 0DH,0AH,"IT IS NOT A PALINDROME.$"
INPUT_STR DB 80 DUP (0) 
REVERSED_STR DB 80 DUP (0)
NEW_LINE DB 0DH,0AH,'$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
    LEA DX,INPUT_MSG
    MOV AH,9
    INT 21H
    
    ;READ A STRING
    LEA DI,INPUT_STR
    CALL READ_STR
                 
    ;NEW LINE
    LEA DX,NEW_LINE
    MOV AH,9
    INT 21H 
                              
    ;DISPLAY A STRING
    LEA SI,INPUT_STR
    CALL DISP_STR
    
    LEA DI,REVERSED_STR
    MOV CX,BX
    MOV SI,BX
    DEC SI
    
    REVERSE:
    MOV AL,INPUT_STR[SI]
    STOSB
    DEC SI
    LOOP REVERSE
    
    
    ;NEW LINE
    LEA DX,NEW_LINE
    MOV AH,9
    INT 21H 
                              
    ;DISPLAY A STRING
    LEA SI,REVERSED_STR
    CALL DISP_STR
    
    
    CLD
    LEA SI,INPUT_STR
    LEA DI,REVERSED_STR
    MOV CX,BX
    
    CHECK:
    CMPSB
    JNZ NO
    LOOP CHECK
    
    LEA DX,OUTPUT_MSGY
    MOV AH,9
    INT 21H
    JMP EXIT1
    
    NO:
    LEA DX,OUTPUT_MSGN
    MOV AH,9
    INT 21H    
    
 
    EXIT1:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
INCLUDE input_string_a.asm
INCLUDE output_string_a.asm
END MAIN
    
