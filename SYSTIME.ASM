assume cs:code
code segment
start:
        mov ah,2ch
        int 21h
        mov al,ch
        call hex_bcd
        call disp
        mov dl,':'
        mov ah,02
        int 21h
        mov al,cl
        call hex_bcd
        call disp
        mov ah,4ch
        int 21
hex_bcd proc
        push cx
        mov cl,al
        mov al,00
        mov ch,00
        cmp cl,00
        je stop
    next:
        add al,1
        daa
        loop next
   stop:
        pop cx
        ret
hex_bcd endp

disp proc
        push cx
        mov ah,00
        mov cl,04
        shl ax,cl
        shr al,cl
        add ax,3030h
        mov dl,ah
        push ax
        mov ah,02
        int 21h
        pop ax
        mov dl,al
        mov ah,02
        int 21h
        pop cx
        ret
disp endp
code ends
end start
