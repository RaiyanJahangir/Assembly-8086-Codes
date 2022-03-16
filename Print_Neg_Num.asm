.model small
.stack 100h
.data 
n db ? 
cnt db ?
.code
main proc 
    
    mov ax,@data
    mov ds,ax
    
    mov ax,-1234   
    mov bx,ax 
    mov n,0 
    
    test bx,8000h
    jz pos 
    
    print_minus:
    mov ah,2
    mov dl,'-'
    int 21h
    and bx,7fffh
    xor bx,7fffh
    add bx,1  
    
    
    pos: 
    mov dx,0
    cmp bx,0
    je exit
    
    mov ax,bx
    mov cx,10
    div cx
    
    mov bx,ax
    add dx,48
    
    inc cnt
    push dx
    jmp pos
    
    exit:
    mov cx,0
    mov cl,cnt
    
    print: 
    mov ah,2
    pop dx
    int 21h
    loop print
    
    
    main endp
end main 

