.model small     
.stack 100h
.data
    tb1 db "Nhap ma sv: $"
    str db 100 dup("$")
    masv db "AT160705",0
    hoten db "Tran Truc Diep $" 
    tb2 db 10,13,"Ho ten: $" 
    tb3 db 10,13,"Sai ma sinh vien $"
.code

main proc 
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    mov ah, 9
    lea dx, tb1
    int 21h
    
    mov ah,10
    lea dx, str
    int 21h
    
    mov cx,8
    lea si,str+2
    lea di,masv
    repe cmpsb
    je inkq
    mov ah,9
    lea dx,tb3
    int 21h
    jmp thoat   
    
inkq:
    mov ah,9
    lea dx,tb2
    int 21h
    
    mov ah,9
    lea dx,hoten
    int 21h
    
thoat:
    mov ah, 4ch
    int 21h
    
end main
    