.data
arr dw 10,20,30,40,50

.code
main proc
    
    mov ax,@data
    mov ds,ax   
    
    lea si,arr  ;starting address of arr kept at si
    
    mov cx,5     
    mov bx,0
    sum_array:
    add bx,[si] ;1st element kept at ax
    add si,2    ;word array so added 2
    loop sum_array
    
    mov ah,4ch
    int 21h
    main endp
end main