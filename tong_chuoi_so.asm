.model small
.stack 100h
.data
    tb1 db "Nhap so: $"
    tb2 db 10,13,"Tong = $"
    str db 100 dup("$")
.code

main proc
    
    mov ax,@data
    mov ds, ax
    
    mov ah,9
    lea dx,tb1
    int 21h    
    
    lea si, str
    xor cx,cx
    
nhap:
    mov ah,1
    int 21h
    cmp al,13
    je tinhtong 
    mov [si],al
    inc si
    inc cx
    jmp nhap
    
tinhtong:
    mov ax,0
    mov bx,0
    lea si,str
    
    tinh:
       mov bl,[si]
       sub bl,30h
       add al,bl
       inc si
       xor bx,bx
       loop tinh
    
    
    mov dx,0
    mov bx,10
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
     mov ah,9
     lea dx,tb2
     int 21h
     
     inso:
        mov ah,2
        pop dx   
        add dx,30h
        int 21h
        loop inso
        
    mov ah,4ch
    int 21h
    
end main   