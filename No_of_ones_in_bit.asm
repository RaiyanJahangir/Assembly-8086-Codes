;Counting number of 1's in an ascii value
.model small
.stack 100h
.data
.code
main proc
    
    xor bh,bh  ;keeps value of 1s       
    xor cx,cx
    
    mov ah,1
    int 21h
    
    mov bl,al
    
    mov cl,8
    
    
    check: 
    rol bl,1
    jc one
    
    jmp skip
    
    
    one:   
    inc bh  
    
    skip:
    
    
    loop check  
    
   
    
    mov ah,2
    int 21h
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    mov dl,bh
    int 21h
    
    
    main endp
end main