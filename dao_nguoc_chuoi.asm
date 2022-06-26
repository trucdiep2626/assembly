.model small
.stack 100h
.data
    tb1 db "Nhap chuoi: $"
    str db 100 dup("$")
    enter db 10,13,"$"
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah,9
    lea dx, tb1
    int 21h

    
    xor cx,cx
        
nhapchuoi:
    mov ah,1
    int 21h
    cmp al,13
    je inketqua  
    mov ah,0
    push ax      
    inc cx
    jmp nhapchuoi

inketqua:
    mov ah,9
    lea dx, enter
    int 21h
    
    inchuoi:
        mov ah,2
        pop dx
        int 21h
        loop inchuoi  
        
    mov ah,4ch
    int 21h
end main