.data 
str db 'ABC'
.code
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    lea di,str
    
    mov al,'B'
    CLD
    
    mov cx,3
    repe scasb
    je found
    
    not_found:
    mov dx,0
    jmp end_
    
    found:
    mov dx,1
    
    end_:
    
    main endp
end main