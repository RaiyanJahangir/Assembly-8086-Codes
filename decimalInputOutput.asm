;decimal input and decimal output
.model small
.stack 100h
.data 
tmp dw ? 
minus db 0 
cnt db 0
.code
main proc 
    
    mov ax,@data
    mov ds,ax
    
    xor bx,bx
    xor ax,ax
    xor cx,cx
    xor dx,dx
    
    ;taking decimal input 
    
    
    
    input:
    mov ah,1
    int 21h
    
    cmp al,'-'   ;for negative number a - sign is needed
    je negative 
    jmp num_input
    
    negative:
    mov minus,1   ;minus is a flag to indicate that the given input number is minus    
    
    
    while:
    mov ah,1
    int 21h      ;ax=input
    
    cmp al,0dh   ;input stops with carriage return
    je input_end 
    
    num_input:
    ;at every input we store the value at bx
    sub al,48
    mov ah,0
    mov tmp,ax   ;tmp=ax
    mov ax,10    ;ax=10
    mul bx       ;ax=ax*bx
    add ax,tmp   ;ax=ax+tmp
    mov bx,ax    ;bx=ax (stored) 
    jmp while
    
    input_end:  
    
    ;newline
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
                                          
    cmp minus,0
    je stack_push
    
    mov dl,'-'
    int 21h
    
    ;put values in stack  
    stack_push:
    cmp bx,0
    je output
    
    mov tmp,bx;tmp=bx
    mov ax,bx ;ax=bx
    mov bx,10 ;bx=10 
    mov dx,0
    div bx    ;dx:ax/bx  dx has remainder, ax has quotient
    push dx   ;push dx to stack
    inc cnt   ;total no. of push  
    mov bx,ax ;bx=ax
    jmp stack_push 
    
    output:
    cmp cnt,0
    je exit 
    pop dx   ;put value in dx
    mov ah,2 
    add dl,48 ;print num char
    int 21h 
    dec cnt    ;this variable will be equal to zero when stack is empty
    jmp output
    
    exit:
    
    main endp
end main