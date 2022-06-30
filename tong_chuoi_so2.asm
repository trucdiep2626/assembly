.model small
.stack 100h
.data
   
    tb db 10,13,"Tong = $"
    str db 11,3,4,5,66 
.code

main proc
    
    mov ax,@data
    mov ds, ax
    
    mov cx,5
    
 tinhtong:
    mov ax,0
    mov bx,0
    lea si,str
    
    tinh:
       mov bl,[si]
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
    lea dx,tb
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