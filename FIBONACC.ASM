assume cs:code,ds:data
data segment
        fibo    db      10 dup(?)
        n       db      0Fh
data ends
code segment
start:
        mov ax,data
        mov ds,ax
        lea si,fibo
        mov al,00h
        mov [si],al
        inc si
        mov bl,01h
        mov [si],bl
        inc si
        mov cl,n
        sub cl,2
        mov ch,00
     again:
        add al,bl
        mov [si],al
        inc si
        xchg  al,bl
        loop again
        mov ah,4ch
        int 21h
code ends
end start
