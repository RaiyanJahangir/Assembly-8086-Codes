.model small
.stack 100h

.data

a db 4  
str1 db 'Greater than 5$'   
str2 db 'Less than 5$'
str3 db 'Equal to 5$'

.code
main proc 
    
    mov ax,@data
    mov ds,ax  
    
    mov bl,1
    
    input:
    
    mov ah,1
    int 21h
    sub al,48
    
    
    cmp al,5
    ja above
    je equal 
    jmp below
    
    
    above:
    mov ah,9
    lea dx,str1  
    int 21h  
    jmp exit 
    
    equal: 
    mov ah,9
    lea dx,str3  
    int 21h  
    jmp exit 
    
    below:
    mov ah,9
    lea dx,str2
    int 21h
    
    
    exit:
    inc bl
    cmp bl,5
    je final_exit
    jmp input
              
    final_exit:
    
    main endp
end main