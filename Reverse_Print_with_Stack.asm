;print 12345 as 54321
.model small
.stack 100h
.data 
n dw ?
.code
main proc
     
    mov ax,@data
    mov ds,ax
    mov n,0  
    
    input_loop:
    mov ah,1
    int 21h 
    cmp al,0dh
    je output_init 
    inc n
    mov bx,0
    mov bl,al 
    push bx
    jmp input_loop
    
    output_init:
    
    mov cx,n
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    output_loop:
    pop dx
    int 21h
    loop output_loop
    
    
    
    main endp
end main