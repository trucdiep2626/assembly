.model small
.stack 100h
.data

    tb1 db "Nhap chuoi so: $"
    str db 100 dup("$")
    tb2 db 10,13,"So cac so chia het cho 5: $" 
    dem dw 0
    y dw 10
.code

main proc
    
    mov ax, @data
    mov ds,ax
    
    mov ah,9
    lea dx, tb1
    int 21h
    
    mov ah,10
    lea dx, str
    int 21h
    
    lea si, str
    mov cx,0
    mov cl, [si+1]
    mov ax,0
    mov bx,0
    
tachso:
    mov bl,[si+2]
    cmp bx,20h
    je kiemtra
    sub bx,30h
    mul y
    add ax,bx 
    cmp cx,1
    je kiemtra
    jmp skip
    
kiemtra:
    mov bx,5
    div bx
    cmp dx,0
    je chiahet
    jne kochiahet
        
chiahet:
    inc dem

    
kochiahet:  
    
    mov dx,0   
    mov ax,0
    jmp skip
    
skip:
    inc si
    loop tachso    
    
    
    mov ax,dem
    mov bx,10
    mov cx,0
    mov dx,0
chiakq:
    div bx
    push dx
    inc cx
    cmp ax,0
    je inkq
    mov dx,0
    jmp chiakq
    
inkq:
    mov ah, 9
    lea dx,tb2
    int 21h
    
    mov dx,0
    inso:
        pop dx
        add dx,30h
        mov ah,2
        int 21h
        loop inso
        
    mov ah, 4ch
    int 21h     

        
end main                      