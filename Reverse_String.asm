;Code to reverse a binary string

mov al,82h   ;1000 0010 ==>0100 0001 =41h
xor bl,bl    ;bl will keep final result  
mov cl,8

loop_:

shl al,1
rcr bl,1   
loop loop_
