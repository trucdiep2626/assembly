.model small
.stack 100h
.data
    tb1 db "Nhap chuoi thuong: $"
    str db 100 dup("$")
    size db ?            
    enter db 10,13,"$"
.code    

main proc
    mov ax, @data
    mov ds,ax
    
    mov ah, 9
    lea dx, tb1
    int 21h
    
    lea si,str
    xor cx,cx
nhapchuoi:

    mov ah, 1  
    int 21h
    cmp al,13
    je inketqua
    mov [si], al
    
    inc si     
    inc cx
    jmp nhapchuoi
    
inketqua:
    mov ah, 9
    lea dx, enter
    int 21h  
    
    lea si,str
    inchuoi:
        mov ah,2
        mov bl,[si]  
        cmp bl, 32
        je skip
        sub bl,32  
    skip:    
        mov dl,bl
        int 21h    
        inc si
        loop inchuoi    
        
    mov ah,4ch
    int 21h
end main