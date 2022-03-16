.model small
.stack 100h
.data 
n db ?
m db ?
p db ?
.code
main proc 
     

     mov ah,1
     int 21h
     sub al,48
     mov n,al
     mov m,al
     add m,al
     
     
     
     mov bh,0
     mov cl,n 
     mov p,0 
     ;add cl,cl
     
     
     outer:   
     
     mov ah,2
     mov dl,0dh
     int 21h
     mov dl,0ah
     int 21h
     
     
     
     cmp bh,n
     jl increment_p_decrease_space
     je inner_init
      
     sub p,1
     add cl,1
     jmp inner_init: 
     
     increment_p_decrease_space:
     add p,1
     sub cl,1
     
     inner_init: 
     
      inc bh
     cmp bh,m
     jg exit
     
     
     mov bl,0
     mov ch,0
     
     space:
     inc bl
     cmp bl,cl
     jg inner
     mov dl,' '
     int 21h 
     
     jmp space
     
     inner: 
     inc ch
     cmp ch,p
     jg outer
     
     
     
     
     
     
     
     mov dl,'*'
     int 21h 
     mov dl,' '
     int 21h
     jmp inner
     
     
     exit:
    
    main endp
end main