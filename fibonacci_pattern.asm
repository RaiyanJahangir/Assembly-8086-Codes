;fibonacci pattern
.model small 
.stack 100h
.data
x db ?
y db ?
z db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    sub al,48
    mov bl,al
    
    mov ch,0
    
    outer:
        inc ch
        cmp ch,bl
        jg exit
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h
        
        mov x,0
        mov y,1
        mov cl,0
        mov dl,'1'
        int 21h
        mov dl,' '
        int 21h
        
        inner:
            mov z,0
            mov bh,x
            add z,bh
            mov bh,y
            add z,bh
            
            inc cl
            cmp cl,ch
            jge outer
            mov dl,z
            add dl,48
            int 21h
            mov dl,' ' 
            int 21h  
            
            mov x,bh
            mov bh,z
            mov y,bh
            jmp inner
     exit:       
    
    
    main endp
end main