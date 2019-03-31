assume cs:code,ds:data
data segment
        str1     db      "mom"
        n       dw      n-str1            ;important n is word
        str2    db      5 dup(?)
        msg1    db      "String is palindrome$"
        msg2    db      "string is not palindrome$"
data ends
code segment
start:
        mov ax,data
        mov ds,ax
        mov es,ax
        mov cx,n
        mov si,n
        dec si
        lea di,str2
    again:
        mov al,[si]
        mov [di],al
        dec si
        inc di
        loop again
        lea si,str1
        lea di,str2
        cld
        mov cx,n
        repe cmpsb
        jnz failed
        lea dx ,msg1
        jmp display
  failed:
        lea dx,msg2
   display:
        mov ah,9
        int 21h
        mov ah,4ch
        int 21h
   code ends
   end start
