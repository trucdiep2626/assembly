.model small
.stack 100h
.data
    tb1 db "Nhap so duong nho hon hoac bang 8: $"  
    enter db 10,13,"$"
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah,9
    lea dx, tb1
    int 21h
    
    mov ah, 1
    int 21h
    
    sub al,30h
    mov cl,al
    
    mov bl,1
    mov al,1
giaithua:
    mul bl
    cmp cl,bl
    je chiakq
    inc bl
    jmp giaithua
    
chiakq:
    mov bx,10
    mov dx,0
    mov cx,0
    chia:
        div bx
        push dx
        inc cx
        cmp ax,0
        je inkq
        xor dx,dx
        jmp chia
        
inkq:
    
    mov ah, 9
    lea dx,enter
    int 21h
    mov dx,0
    
    ingiaithua:
        pop dx
        add dx,30h
        mov ah,2
        int 21h
        dec cx
        cmp cx,0
        je thoat
        jmp ingiaithua
        
thoat:
    mov ah,4ch
    int 21h
    
end main
        
    
