;Reversing a bit pattern
.model small
.stack 100h
.data
.code
main proc 
    
    mov ah,1
    int 21h
    
    mov bl,al   
    
    mov ah,2
    mov dl,0dh 
    int 21h
    mov dl,0ah
    int 21h 
    
    ;prints the original bits
    
    xor cx,cx
    mov cl,8
    
    check:
    test bl,10000000b
    jz zero
    
    mov dl,'1'
    int 21h
    jmp skip
    
    zero:
    mov dl,'0'
    int 21h
    
    skip:
    rol bl,1
    loop check
    
    
    mov dl,0dh 
    int 21h
    mov dl,0ah
    int 21h  
               
               
    ;reverse bit           
    xor cx,cx
    mov cl,8 
    mov bh,0    ;put the reverse pattern in bh
    
    check2:
    shl bl,1
    rcr bh,1
    loop check2
    
    mov bl,bh  ;puts the reverse pattern back to bl
    ;print the reverse pattern
    
    xor cx,cx
    mov cl,8
    check3:
    test bl,10000000b
    jz zero1
    
    mov dl,'1'
    int 21h
    jmp skip1
    
    zero1:
    mov dl,'0'
    int 21h
    
    skip1:
    rol bl,1
    loop check3
    
    
    
    
    main endp
end main