.MODEL SMALL
.STACK 100H

.DATA
INPUT    DB  'PLEASE ENTER SOME TEXT (SEPARATE BY BLANKS END WITH CARRIAGE RETURN ) $'
REVERSE  DB  0DH,0AH,'REVERSER FORM : $'

COUNT     DW  0

.CODE
MAIN PROC
    
    MOV AX, @DATA              
    MOV DS, AX
     
     
    LEA DX, INPUT               
    MOV AH, 9
    INT 21H

    XOR CX, CX             
    MOV AH, 1                    

    NO_ENTER:                      
    INT 21H                   

    CMP AL, 0DH            
    JE ENTER_PRESSED        

    PUSH AX                 
    INC CX                  
    JMP NO_ENTER                   

    ENTER_PRESSED:                  

    MOV BX, 50H            

    XCHG BX, SP            

    PUSH 0020H                   
     
                                  
    XCHG BX, SP            
    INC COUNT                    

    LOOP_1:                     
    POP DX                    

    XCHG BX, SP                

    PUSH DX                   
    
    XCHG BX, SP                
    INC COUNT                  
    LOOP LOOP_1               

    
    LEA DX, REVERSE           
    MOV AH, 9
    INT 21H

    MOV CX, COUNT               
    MOV COUNT, 0                

    PUSH 0020H                   
    INC COUNT                    

    RESULT:                  
    XCHG BX, SP               

    POP DX                     

    XCHG BX, SP                

    CMP DL, 20H            
    JNE NO_SPACE         

    MOV AH, 2                  

    LOOP_2:                  
    POP DX                    
    INT 21H                 

    DEC COUNT                
    JNZ LOOP_2             

    MOV DX, 0020H              

    NO_SPACE:            

    PUSH DX                   
    INC COUNT                 
    LOOP RESULT             
     
    EXIT:  
     
    MOV AH, 4CH               
    INT 21H
   MAIN ENDP
END MAIN