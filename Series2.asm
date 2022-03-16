;6 5 3 0 -4 -9 -15
.model small
.stack 100h
.data   
n db 0
tmp db 0 
a dw 10    ;to divide by 10  
cnt db 0   
b dw 6
.code
main proc 
    
    mov ax,@data
    mov ds,ax  
    
    xor bx,bx
    xor cx,cx
    xor dx,dx
    
    ;multi_digit input
    input:
    mov ah,1
    int 21h   
    cmp al,0dh
    je end_input
    sub al,48
    mov tmp,al
    mov ah,0
    mov al,n
    mul a
    add al,tmp
    mov n,al
    jmp input
    
    end_input:
    
    ;input is kept in b
    ;newline
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    mov cl,0
    
    
    series_loop:
    inc cl
    cmp cl,n
    jg exit    
    
    mov dx,0 ;dx=0 
    mov ax,b ;ax=b 
    
    cmp b,0
    jg pos 
    je b_is_zero
    
    mov ah,2
    mov dl,'-'
    int 21h
    mov ax,b
    and ax,7fffh
    xor ax,7fffh
    inc ax
    jmp pos   
    
    b_is_zero:
    mov ah,2
    mov dl,'0'
    int 21h
    mov dl,' '
    int 21h
    sub b,cx
    jmp series_loop
    
    pos:   ;positive number
    
      
    mov cnt,0
    
    while: 
    cmp ax,0
    je stack_pop
    mov dx,0
    div a ;dx:ax/a; a=10
    push dx ;dx has remainder
    inc cnt  
    mov dx,0
    jmp while
    
    stack_pop:
    cmp cnt,0
    je end_pop
    pop dx
    mov ah,2
    add dl,48
    int 21h
    dec cnt
    jmp stack_pop
    
    end_pop:
    mov dl,' '
    int 21h
    mov ch,0  
    sub b,cx
    jmp series_loop 
    
    
    exit:
    
    main endp
end main