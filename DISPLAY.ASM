assume cs:code
code segment
start:
        mov ah,00h
        mov al,02h
        int 10h
        mov ah,02                       ;Set cursor
        mov dh,12d                      ;Row 12
        mov dl,40d                      ;Column 40
        int 10h
        mov al,'X'                      ;character to display
        mov bl,8ch                      ;attribute
        mov cl,1                        ;number of times to display 
        mov ah,9                        ;bios call todisplay character with attributes
        int 10h
        mov ah,07
        int 21h                         ;wait for key press
        mov ah,4ch
        int 21h
code ends
end start
