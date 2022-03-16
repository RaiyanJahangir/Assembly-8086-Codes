;printing hex value
.model small
.stack 100h
.data
.code
main proc 
    
    mov ah,1
    int 21h 
    
    
    xor bx,bx 
    
    mov ah,0
    mov bx,ax    ;store the char input in bx
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    shl bx,4     ;4 shift left to take 4 LSB of blt to bh
    
    mov dl,bh    ;takes value of bh to dl to print 
    cmp dl,10
    je a         ; for 10, we print A and similarly ...
    cmp dl,11
    je b
    cmp dl,12
    je c
    cmp dl,13
    je d
    cmp dl,14
    je e
    cmp dl,15
    je f
    
    jmp num       ;if value is <=9 just print char value
    
    a:
    mov dl,'A'
    int 21h
    jmp done
    
    b:
    mov dl,'B'
    int 21h
    jmp done
    
    c:
    mov dl,'C'
    int 21h
    jmp done
    
    d:
    mov dl,'D'
    int 21h
    jmp done
    
    e:
    mov dl,'E'
    int 21h
    jmp done
    
    f:
    mov dl,'F'
    int 21h
    jmp done
    
    num:
    add dl,48        ;add 48 and print ascii value
    int 21h
    
    done:
    
    mov bh,0          ;printing second part
    shl bx,4          ;again 4 shift left to take 4 LSB of blt to bh
    
    mov dl,bh         ;same procedure again to print the msb value
    cmp dl,10
    je a1
    cmp dl,11
    je b1
    cmp dl,12
    je c1
    cmp dl,13
    je d1
    cmp dl,14
    je e1
    cmp dl,15
    je f1
    
    jmp num1
    
    a1:
    mov dl,'A'
    int 21h
    jmp done1
    
    b1:
    mov dl,'B'
    int 21h
    jmp done1
    
    c1:
    mov dl,'C'
    int 21h
    jmp done1
    
    d1:
    mov dl,'D'
    int 21h
    jmp done1
    
    e1:
    mov dl,'E'
    int 21h
    jmp done1
    
    f1:
    mov dl,'F'
    int 21h
    jmp done1
    
    num1:
    add dl,48
    int 21h
    
    done1:
    
    main endp
end main