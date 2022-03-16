.model small
.stack 100h
.data
.code
main proc
    
    mov ax,2
    mov dx,3
    
    call proc1
    
    
    
    main endp  

proc1 proc
    
    push ax
    push dx
    pop ax
    pop dx
    
    ret
    
    proc1 endp
end main