.model small
.stack 100h
.data
.code
main proc   
         
    ;;;Calculating Factorial     
    ;;;5!=5*4*3*2*1
    
    mov cx,5
    mov al,1
    factorial:
    
    mul cl  ;ax=al*cl
    loop factorial
    
    main endp
end main