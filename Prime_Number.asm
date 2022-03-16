;1-10

;prime no??

;AX=3

;prime no??

; loop1:
; 2 to n-1  
; bl=2
; div bl -->AX/BL remainder->ah
; ah==0??
; bl++
; ax=var1 

prime:
; dl=al
; dl=dl+30h
; ah=2
; int 21h

not_prime:
;code for not prime
;do nothing