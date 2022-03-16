.model small
.stack 100h
.data
cnt db ? 
x dw ? 
y dw ?
.code
main proc 
    
    mov ax,@data
    mov ds,ax
    
    mov ax,1234
    mov cnt,0
    mov x,10
    
    mov bx,ax
    mov cx,0
    
    test bx,8000h
    jz pos 
    
    put_minus:
    mov ah,2
    mov dl,'-'
    int 21h
    and bx,7fffh
    xor bx,7fffh
    add bx,1
    
    
    pos:
    mov dx,0
    cmp bx,0
    je print
    
    mov ax,bx
    div x
    
    mov bx,ax
    
    inc cnt
    mov y,dx
    
    mov ax,10
    mul cx
    mov cx,ax
    add cx,y
    
    jmp pos
    
    print:
    mov dx,0
    cmp cx,0
    je exit 
    
    mov ax,cx
    div x
    mov cx,ax
    
    mov ah,2
    add dx,48
    int 21h
    jmp print
    
    
    exit:
    
    
    main endp
end main