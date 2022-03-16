;The program first takes an input from 0 to 9 that determines the number of executions of the program
;Then it takes an character input (Let n)
;The program determines whether n is odd or even
;It shows an invalid message is n is not a digit

.model small
.stack 100h
.data
msg1 db 'Enter the number of execution (0 to 9): $'
msg2 db 'Enter a digit: $'
str1 db ' is odd$' 
str2 db ' is even$'
str3 db ' is not a digit$'
str4 db 'Case No $'
caseno db 1

.code
main proc
    mov ax,@data
    mov ds,ax
     
    ;Showing Message 1
    MOV ah,9
    LEA dx, msg1
    INT 21h
    
    ;Taking input: How many times want to execute the process
    MOV ah,1
    INT 21h 
    SUB al,48
    MOV cl, al ;cl stores the number of loop count
    
    ;Print newline
    NewLine_0:
    MOV ah,2
    MOV dl, 0dh
    INT 21h
    MOV dl, 0ah
    INT 21h 
    
    LOOP_BEGIN:
    cmp cl,0
    JE EXIT:
    DEC cl 
    
    ;Showing Message 2
    MOV ah,9
    LEA dx, msg2
    INT 21h
    
    ;Input
    MOV ah,1
    INT 21h 
    MOV bl,al ; Input is stored at bl
    
    ;Newline
    NewLine_1:
    MOV ah,2
    MOV dl, 0dh
    INT 21h
    MOV dl, 0ah
    INT 21h
    
    ;Printing Case No with message
    MOV ah,9
    LEA dx, str4
    INT 21h 
    
    mov ah,2
    mov dl,caseno
    add dl,48
    INT 21H
    INC caseno
    
    ;Printing ': '
    mov dl,':'
    INT 21h
    mov dl, ' '
    INT 21h
    
    ;Printing the character
    mov dl,bl
    mov ah,2
    INT 21h
    
    ;Checkings
    CMP bl, '0'
    JE EVEN
    cmp bl, '2'
    JE EVEN
    cmp bl, '4'
    JE EVEN
    cmp bl, '6'
    JE EVEN
    cmp bl, '8'
    JE EVEN
    cmp bl, '9'
    JA NOT_A_DIGIT
    cmp bl, '0'
    JB NOT_A_DIGIT
    
    ODD:
    MOV ah,9
    LEA dx, str1
    INT 21h
    JMP NEWLINE_2
    
    EVEN:
    MOV ah,9
    LEA dx, str2
    INT 21h
    JMP NEWLINE_2
    
    NOT_A_DIGIT:
    MOV ah,9
    LEA dx, str3
    INT 21h
    
    ;Newline
    NEWLINE_2:
    MOV ah,2
    MOV dl,0dh
    INT 21h
    MOV dl, 0ah
    INT 21h
    jmp LOOP_BEGIN:
    
    EXIT:
    
    main endp
end main