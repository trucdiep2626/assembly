.model small
.stack 100h
.data 
    tb1 db "Nhap chuoi: $"
    str db 100 dup("$")   
    tb2 db 10,13,"Tong so trong chuoi: $"
    tong dw 0   
    x dw 10 
    y dw 0
.code
main proc
    mov ax,@data
    mov ds, ax
    
    mov ah,9
    lea dx, tb1
    int 21h
    
    mov ah,10
    lea dx,str
    int 21h
    
    lea si,str
    mov cx,0
    mov cl,[si+1]
    
    mov ax,0
    mov bx,0
   
tachso:
    mov bl,[si+2]
    cmp bx,20h
    je chuyenso
    sub bx,30h
    mul x
    add ax,bx
    jmp lap1

chuyenso:
    push ax
    inc y
    mov ax,0
    mov bx,0
    
lap1:
    inc si
    loop tachso
       
             
    push ax
    inc y
    mov bx,0
    mov cx,y   
tinhtong:
    pop bx
    add tong,bx
    loop tinhtong
    
    
    mov ax,tong
    mov bx,10
    mov cx,0
    mov dx,0
chiaso:
    div bx
    push dx
    inc cx
    cmp ax,0
    je inkq
    mov dx,0
    jmp chiaso
    
inkq: 
    mov ah,9
    lea dx,tb2
    int 21h
    
    mov dx,0
    inso:
        pop dx
        add dx,30h
        mov ah,2
        int 21h
        loop inso
    
thoat:
    mov ah, 4ch
    int 21h
    
end main    