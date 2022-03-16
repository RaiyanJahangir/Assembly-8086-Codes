.model small
.stack 100h

.data

.code

main proc     
    
    mov ah,1     ;input
    int 21h      ;execute
    
    mov bl,al
    
    mov ah,2     ;output
    mov dl,0dh   ;carriage ret
    int 21h      ;execute
    mov dl,0ah   ;line feed
    int 21h      ;execute
               
    mov ah,2     ;output
    ;mov dl,al  
    mov dl,bl
    int 21h      ;execute

    main endp
end main