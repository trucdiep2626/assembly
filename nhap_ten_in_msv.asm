.model small
.stack 100h
.data
    tb1 db "Nhap ho va ten: $"
    hoten db 100 dup("$")
    masv db "AT160705$"
    ten db "Tran Truc Diep",0
    tb2 db 10,13,"Ma sv: $"    
    tb3 db 10,13,"Sai ten $"
.code

main proc 
    
    mov ax, @data
    mov ds, ax     
    mov es,ax
    
    mov ah,9
    lea dx, tb1
    int 21h
    
    mov ah, 10
    lea dx, hoten
    int 21h
                 
    mov cx,14             
    lea si,hoten+2
    lea di,ten
    repe cmpsb
    je inkq
    
    mov ah,9
    lea dx, tb3
    int 21h
    
    jmp thoat
    
inkq:
    mov ah,9
    lea dx,tb2
    int 21h
    
    mov ah,9
    lea dx, masv
    int 21h
    
thoat:
    mov ah, 4ch
    int 21h
    
end main
 
    