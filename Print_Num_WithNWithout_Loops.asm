;Program for printing prime numbers from 0 to 10
.model small
.stack 100h
.data 
n db ?
.code
main proc
    
    mov ax,@data
    mov ds,ax  
    
    ;with a loop instruction
    mov n,2 
    
    outer:
    cmp n,9
    jg outer_end 
    
    mov bx,0
    mov bl,n
    mov cl,bl
    dec cl 
    
    inner:
    cmp cl,1
    jle prime
    mov ax,bx
    div cl
    cmp ah,0
    jz outer_last
    
    loop inner    ;loop instruction here
   
    
    prime:
    mov ah,2
    mov dl,n
    add dl,48
    int 21h
    mov dl, ' '
    int 21h
    jmp outer_last
    
    
    outer_last:
    inc n
    jmp outer 
    
    
    outer_end:
   
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    ;without any loop instruction  
    
    mov n,2 
    
    outer2:
    cmp n,9
    jg outer_end2 
    
    mov bx,0
    mov bl,n
    mov cl,bl
    dec cl 
    
    inner2:
    cmp cl,1
    jle prime2
    mov ax,bx
    div cl
    cmp ah,0
    jz outer_last2
    
    dec cl
    jmp inner2:
   
    
    prime2:
    mov ah,2
    mov dl,n
    add dl,48
    int 21h
    mov dl, ' '
    int 21h
    jmp outer_last2
    
    
    outer_last2:
    inc n
    jmp outer2 
    
    
    outer_end2:
    
    
    main endp
end main