.model small
.stack 100h
.data 
arr dw 8,1,7,2,9 
n db 5 

.code
main proc    
   mov ax,@data
   mov ds,ax
   
   mov si,0
   mov cl,0 ; i
   mov bl,0 ; j
   
       
   outer:
   dec n    
   cmp cl,n
   je exit:
    
   inc n 
   mov bl,cl
   inc bl   
   
   inner:
   mov bh,0
   mov di,bx
   add di,di
   
   mov dx,arr[si]
   cmp dx,arr[di]
   jg swap:
   jmp extra:
   
   
   swap:  
   xchg dx,arr[di]
   mov arr[si],dx  
   
   extra:
   inc bl
   cmp bl,n
   jl inner:
   
   inc cl
   add si,2    
   jmp outer:
    
   
   exit: 
      
   mov ah,2
   mov dl,10
   int 21h
   mov dl,13
   int 21h               
   
   mov si,0
   mov cx,5  
   mov ah,2
   print:
   mov dx, arr[si]  
   add dl,48
   int 21h
   add si,2  
   
   mov dl,' '
   int 21h    
   loop print:              
   
   
   
main endp
end main    



; for (int i=0;i<n;i++)
;   for(int j=0;j<n;j++){
;       if(arr[i]>arr[j])
;           swap(arr[i],arr[j])
;   }
; }