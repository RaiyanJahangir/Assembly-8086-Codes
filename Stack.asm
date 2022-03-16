;swap values with stack
.model small
.stack 100h
.data
.code
main proc
    
    mov ax,2
    mov dx,3
    
    push ax
    push dx
    pop ax
    pop dx
    
    
    main endp
end main