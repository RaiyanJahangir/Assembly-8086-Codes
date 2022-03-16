.model small
.stack 100h
.data
.code
main proc
    
    mov ah,1
    int 21h
    sub al,48
    
    mov cl,al
    mov bh,al 
    inc bh
    
    outer: 
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h 
        
        cmp bh,0
        jl exit 
        mov bl,0
        dec bh
    
    inner:
        inc bl 
        cmp bl,bh
        jg outer
        mov dl,bl
        add dl,48
        int 21h 
        mov dl,' '
        int 21h
        jmp inner
    
    
    exit:
    
    
    main endp
end main