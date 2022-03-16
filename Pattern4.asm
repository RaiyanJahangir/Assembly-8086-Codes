.model small
.stack 100h
.data 
n db ?
m db ?
p db ? 
a db ?
.code
main proc 
     
     mov ax,@data
     mov ds,ax

     mov ah,1
     int 21h
     sub al,48
     mov n,al
     mov m,al
     add m,al
     dec m
     
     
     mov bh,0
     mov cl,n 
     mov p,-1
     
     
     outer:   
     
     mov ah,2
     mov dl,0dh
     int 21h
     mov dl,0ah
     int 21h
     
     inc bh
     cmp bh,m
     jg exit
     
     cmp bh,n
     jle increment_p_decrease_space
      
     sub p,2
     add cl,1
     jmp inner_init: 
     
     increment_p_decrease_space:
     add p,2
     sub cl,1
     
     inner_init: 
     
     mov dh,p
     inc dh
     shr dh,1
     mov a,dh
     
     
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
     
     cmp ch,1
     je print_star 
     
     cmp ch,p
     je print_star
     
     
     cmp ch,a
     je print_star
     
     mov dl,' '
     int 21h
     jmp inner
     
     
     
     print_star:
     mov dl,'*'
     int 21h
     jmp inner
     
     
     exit:
    
    main endp
end main