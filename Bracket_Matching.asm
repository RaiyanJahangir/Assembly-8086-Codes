.model small
.stack 1000h
.data 
msg1 db "Balanced$"
msg2 db "Not Balanced$"  
flag db 1
cnt db 0
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    xor bx,bx
    xor cx,cx
    xor dx,dx
    
    ;take input    
    mov cx,8
    input:
    
    mov ah,1
    int 21h   
    
    cmp al,'('
    je push_it 
    cmp al,'{'
    je push_it
    cmp al,'['
    je push_it
    
    cmp al,')'
    je check_first_bracket
    cmp al,'}'
    je check_second_bracket
    cmp al,']'
    je check_third_bracket
    
    
    
    push_it:
    mov ah,0
    push ax 
    inc cnt
    jmp end_of_loop    
    
    
    check_first_bracket:
    xor bx,bx
    cmp cnt,0
    je not_balanced
    pop bx
    dec cnt
    cmp bl,'{'
    je not_balanced 
    cmp bl,'['
    je not_balanced 
    jmp end_of_loop
    
    check_second_bracket:
    xor bx,bx 
    cmp cnt,0
    je not_balanced
    pop bx 
    dec cnt
    cmp bl,'('
    je not_balanced
    cmp bl,'['
    je not_balanced
    jmp end_of_loop
    
    check_third_bracket:
    xor bx,bx 
    cmp cnt,0
    je not_balanced
    pop bx 
    dec cnt
    cmp bl,'('
    je not_balanced
    cmp bl,'{'
    je not_balanced
    jmp end_of_loop
    
    
    not_balanced:
    mov flag,0   
    
    end_of_loop:
    
    
    loop input 
    
    ;prints the condition of parenthesis
    print:
    
    ;newline
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h 
    xor dx,dx
    
    ;checks balanced or not
    cmp flag,1
    je print_balanced   
    
    
    mov ah,9
    lea dx,msg2
    int 21h
    jmp exit
    
    
    print_balanced:
    mov ah,9
    lea dx,msg1
    int 21h  
    
    exit:
    
    
    main endp
end main