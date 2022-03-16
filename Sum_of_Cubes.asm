;print a series 0+1+8+27+64+...    
;0^3 + 1^3 + 2^3 + ...
.model small
.stack 100h
.data  
n dw ?
.code    
cube proc
    
    mov ax,1
    mul cx
    mul cx
    mul cx
    add bx,ax   
    ret
    
    cube endp


main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    
    mov cx,0
    mov cl,al
    sub cl,48
    ;mov n,cx
    
    mov bx,0
    
    dec cx 
    
    find_sum:
    call cube
    loop find_sum   
    
    mov ax,bx
    print_dec:
    cmp ax,0
    jmp exit
    
    
    
    exit:
    
    main endp
end main