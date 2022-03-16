;printing the binary value of a number

.model small
.stack 100h
.data


.code
main proc
    
    ;mov ah,1
    ;int 21h 
    
    ;mov bl,al
    ;sub bl,48  
    
    mov bl,255
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
      
    mov cx,8
    
    loop1:
    
    rol bl,1
    jc print1
    jnc print0
    
    print1:
    mov ah,2
    mov dl,'1'
    int 21h
    jmp exit
    
    print0:
    mov ah,2
    mov dl,'0'
    int 21h
      
    
    exit:
    
    loop loop1
    
    main endp
end main