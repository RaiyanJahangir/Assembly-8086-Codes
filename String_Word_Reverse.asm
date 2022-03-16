.model small
.stack 100h
.data 
a db 100 dup(?)
cnt1 db 0
cnt2 db 0
.code
main proc 
    
    mov ax,@data
    mov ds,ax 
    
    lea si,a
    
    input:  
        
        mov ah,1
        int 21h  
        
        cmp al,0dh
        je popfromstack
        
        cmp al,' '
        je popfromstack   
        
        cmp al,'A'
        jl input
        
        cmp al,'Z'
        jle pushtostack
        
        cmp al,'a'
        jl input
        
        cmp al,'z'
        jle pushtostack   
        
        jmp input
    
        
    pushtostack:
    
        mov ah,0
        push ax
        inc cnt1
        jmp input
        
    popfromstack:
    
        cmp cnt1,0
        jle enterspace 
        
        pop bx
        mov a[si],bl     
        dec cnt1
        inc si    
        inc cnt2
        jmp popfromstack  
        
    enterspace:
    
        cmp al,0dh
        je start_print
        
        mov a[si],' '  
        inc si
        inc cnt2
        jmp input
    
        
    start_print:
                
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h   
        lea si,a
        
    print:
    
        cmp cnt2,0
        jle exit  
        
        mov dl,a[si]
        int 21h
        inc si
        dec cnt2
        jmp print
        
        
    exit:   
    
    
    
    mov ah,4ch
    int 21h
    
    main endp
end main