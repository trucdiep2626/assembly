.model small
.stack 100h
.data

    tb1 db "Nhap chuoi so: $"
    str db 100 dup("$")
    tb2 db 10,13,"So cac so chia het cho 5: $" 
    dem dw 0
    
.code
main proc
    mov ax, @data
    mov ds,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
    
    lea si,str
    xor cx,cx
nhapchuoi:
    mov ah,1
    int 21h
    cmp al,13
    je kiemtra
    cmp al, 32
    je skip
    mov [si], al
    inc cx
    inc si
    
skip:
    jmp nhapchuoi    
    
    
kiemtra:
    lea si,str
    mov dx,0
    mov bx,5
    mov ax, 0
    lap:
        mov al,[si]
        sub al,30h
        div bx
        cmp dx,0
        jne kodem
        inc dem 
     kodem:
        inc si  
        mov dx,0
        loop lap 
        
    mov ah,9
    lea dx,tb2
    int 21h

     mov ax,dem
     mov bx,10
     mov cx,0
     mov dx,0
    chia:
        div bx
        push dx
        inc cx
        cmp ax,0
        je inkq
        mov dx,0
        jmp chia 

     inkq:
        mov ah,2
        pop dx
        add dx,30h
        int 21h
        loop inkq
        
        mov ah,4ch
        int 21h
        
end main                      