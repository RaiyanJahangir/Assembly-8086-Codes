;finding out factorial by recursion
.model small
.stack 100h
.data
    n dw 3
    
.code
main proc
    
    mov ax,@data
    mov ds,ax
    push n
    mov cx,n
    call fact  ;fact(3)
    
    mov ah,4ch
    int 21h
    
    main endp  
    
    
;factorial procedure    
fact proc  
    
    push bp
    mov bp,sp
    
    cmp [bp+4],1 ;check base condition n=1? 
    ; cmp cx,1
    je basecase
    
    dec cx ;n-1 
    push cx     ;for multiplication backwards
    call fact   ;fact(n-1)  
    ;pop bx
    mul [bp+4]
    jmp return 
    
    
    basecase:
    mov ax,1   ;store the factorial at ax      
    
    return:
    pop bp
    ret 2        
             
    fact endp
end main