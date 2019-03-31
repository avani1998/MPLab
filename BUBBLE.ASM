assume cs:code,ds:data
data segment
        a       db      10h,60h,4h,2h,0h
        n       dw      n-a                     ;word
data ends
code segment
start:
        mov ax,data
        mov ds,ax
        mov bx,n
        dec bx
   next_pass:
        mov cx,bx
        mov ah,00
        lea si,a
   next_comp:
        mov al,[si]
        cmp al,[si+1]
        jle do_nothing
        xchg al,[si+1]
        mov [si],al
        mov ah,01
  do_nothing:
        inc si
        loop next_comp
        cmp ah,0
        je finish
        dec bx
        jnz next_pass
   finish:
        mov ah,4ch
        int 21h
    code ends
    end start
