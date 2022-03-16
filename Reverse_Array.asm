.data
arr dw 1,2,3,4,5 ,6
.code
main proc       
    
    mov ax,@data
    mov ds,ax      
    
    ;print
    lea si,arr
    mov cx,6
    print:
    mov bx,[si]
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h
    mov dl,' '
    int 21h
    add si,2
    loop print
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h  
    
    
    ;reverse array
    mov ax,0
    mov cx,3 
    lea si,arr   
    lea di,arr+10 
    
    rev_array:
    
          mov ax,[si]
          mov bx ,[di]
          xchg ax,bx
          
          mov [si],ax
          mov [di],bx    
          
          add si,2 
          sub di,2
          
          loop rev_array
     
     
     ;print reverse string
    lea si,arr
    mov cx,6
    print2:
    mov bx,[si]
    mov ah,2
    mov dl,bl   
    add dl,48
    int 21h
    mov dl,' '
    int 21h
    add si,2
    loop print2
    
    
    main endp
end main