assume cs:code,ds:data
assume cs:code,ds:data
disp macro msg
        lea dx,msg
        mov ah,9
        int 21h
endm
data segment
        pwd1    db      "good"
        len1    db      len1-pwd1
        pwd2    db      10 dup(?)
        len2    db      ?
        msg1    db      0ah,0dh,"Enter the password$"
        msg2    db      0ah,0dh,"Wrong Password entered 3 times.Keyboard locked$"
        msg3    db      0ah,0dh,"Password matched$"
        msg4    db      0ah,0dh,"Password did not match$"
data ends
code segment
start:
        mov ax,data
        mov ds,ax
        mov es,ax
        mov bl,0
  rpt:
        call readpwd
        call matchpwd
        inc bl
        cmp bl,3
        jb rpt
        disp msg2
        mov ah,4ch
        int 21h                                 ;important
   readpwd proc near
        disp msg1
        lea si,pwd2
        mov bh,0
     again:
        mov ah,8
        int 21h
        cmp al,0dh
        je next
        mov [si],al
        inc si
        inc bh
        mov dl,'*'
        mov ah,2
        int 21h
        jmp again                           ;Important
    next:
         mov len2,bh
         ret
         readpwd endp             ;imp
   matchpwd proc near
          mov cl,len1
          cmp cl,len2
          je matchstr
          jmp mismatch
     matchstr:
        lea si,pwd1
        lea di,pwd2
        mov ch,0
        cld
        repe cmpsb
        jnz mismatch
        disp msg3
        mov ah,4ch
        int 21h
    mismatch:
        disp msg4
        ret
    matchpwd endp
code ends
end start
