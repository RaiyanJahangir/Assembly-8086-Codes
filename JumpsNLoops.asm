.model small
.stack 100h
.data 
   n db 0
   spc db 0
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    Input:
    mov ah,1
    int 21h
    mov n,al
    sub n,48
    
    
    Newline1:
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    outer_init:
    mov bl,1
    mov bh,n
    mov spc,bh
    dec spc
    
    outer_loop:
    cmp bl,n
    ja outer_exit 
    
    inner1_init:
    mov bh,1
    
    inner1_loop:
    cmp bh,spc
    ja inner2_init
    mov ah,2
    mov dl,' '
    int 21h
    inc bh
    jmp inner1_loop
    
    inner2_init:
    mov ch,0
    mov cl,bl
    
    inner2_loop:
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    mov dl,' '
    int 21h
    loop inner2_loop
    
    
    inc bl
    dec spc
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    jmp outer_loop
    
    
    outer_exit:
    
    
    main endp
end main