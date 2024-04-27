.MODEL SMALL
.STACK 100H

.DATA
INPUT_MSG DB "Enter the time in seconds up to 65535 = $"
OUTPUT_MSG DB 0DH,0AH,"The time in hh:mm:ss format is = $"
SEPARATOR DB  " : $"

.CODE
MAIN PROC
    MOV AX, @DATA             
    MOV DS, AX

    LEA DX, INPUT_MSG            
    MOV AH, 9
    INT 21H
    
    CALL INPUT
    PUSH AX
    
    LEA DX, OUTPUT_MSG          
    MOV AH, 9
    INT 21H

    POP AX               

    XOR DX, DX                   
    MOV CX, 3600                 
    DIV CX               
             
    CALL OUTPUT                 

    MOV AX, DX                   

    PUSH AX               

    LEA DX, SEPARATOR          
    MOV AH, 9
    INT 21H

    POP AX                       
    XOR DX, DX                 

    MOV CX, 60                  
    DIV CX                  
                
    CALL OUTPUT                            

    MOV BX, DX                

    LEA DX, SEPARATOR           
    MOV AH, 9
    INT 21H

    MOV AX, BX                  
               
    CALL OUTPUT         

    MOV AH,4CH
    INT 21H
    MAIN ENDP
    INCLUDE INPUT_9a.ASM
    INCLUDE OUTPUT_9a.ASM
END MAIN