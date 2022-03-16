;string concatenation
.model small
.stack 100h

.data
str1 db 'CSE-19'   
str2 db 'MIST-'     


.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    lea si, str1
    lea di, [str2+5]
    
    CLD
    
    mov cx, 6
    
    copy:
    movsb
    loop copy
    
    lea di, str2
    mov cx, 11
    mov ah, 2
    
    print:
    mov dl, [di]
    
    int 21h
    inc di
    loop print
    
    main endp
end main