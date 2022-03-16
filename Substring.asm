.model small
.data 
str1 db 'raiyanjj$'  
str2 db 'yhnj$'     
c db 0  
i db 0   
j db 0
.code
 main proc
    mov ax,@data
    Mov ds, ax
    Mov es, ax
    
    call sub_check   
    
    mov dx,4ch
    int 21h
    main endp  
 
 sub_check proc    
    
    lea si,str1 
    lea di,str2 
    
    mov c,0 
    mov i,0 
    mov bl,8 ;str1 len   
    
    l1:
        cmp i,bl
        jge not_eq 
        mov cl,i 
        mov ch,0 
        lea si,str1
        jcxz  zz
    
    z: 
        inc si
        loop z 
        
    zz:
        lea di,str2 
        cld
        mov cx,4  ;str2 len
        inc i  
        
    caa:
        
        cmpsb ; match acc to str2 len 
        jne l1
        loop caa 
    
    mov ah,2
    mov dx,'y'
    int 21h
    jmp end
    
    not_eq: 
    mov ah,2
    mov dx,'n'
    int 21h 
    
    end:
sub_check endp   
 
 end main