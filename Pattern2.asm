.model small
.stack 100h
.data
.code
main proc
    
    mov ah,1
    int 21h
    sub al,48
    mov cl,al
    
    mov bh,0
    
    outer:
    inc bh
    cmp bh,cl
    jg exit
    mov ah,2
    mov dl,0dh    
    int 21h
    mov dl,0ah
    int 21h
    
    mov bl,bh
    mov dh,bh
    add dh,dh
    dec dh
    
    inner:
    cmp bl,dh
    jg outer
    mov dl,bl
    add dl,48
    int 21h   
    mov dl,' '
    int 21h
    inc bl
    jmp inner
     
    
    exit:
    
    
    main endp
end main