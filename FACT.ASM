assume cs:code,ds:data
data segment
                n       db      "Enter the number$"
              res       db      ?
data ends
code segment
start:
        mov ax,data
        mov ds,ax
        lea dx,n
        mov ah,9     ;display "enter the number"
        int 21h
        mov ah,8    ;input from user
        int 21h
        call fact
        mov ah,4ch
        int 21h
fact proc near
        cmp al,00
        je cal
        push ax
        dec al
        call fact
        pop ax
        mul res
        mov res,al
        ret
    cal:
        mov res,01
        ret
        fact endp
code ends
end start
