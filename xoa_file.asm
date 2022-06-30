.model small
.stack 100h
.data
    ten db "data2.txt",0
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah, 41h
    lea dx,ten
    int 21h
    
    mov ah,4ch
    int 21h
    
end main