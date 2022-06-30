.model small
.stack 100h
.data
    tb1 db "Nhap so: $"
    tb2 db 10,13,"He 16: $"
    tb3 db 10,13,"He 2: $"
    str db 100 dup("$") 
    num dw 0
.code
main proc
    mov ax, @data
    mov ds,ax
    
    mov ah,9
    lea dx, tb1
    int 21h
    
    mov ah,10
    lea dx,str     
    int 21h
    
    lea si,str
    mov ax,0
    mov bx,0
    mov dx,10
    mov cx,0
    mov cl,[si+1]
chuyenso:
    mov bl,[si+2]  
    sub bl,30h
    mul dl
    add al,bl
    inc si
    loop chuyenso      
    
    mov num,ax 
   
    mov ah,9
    lea dx, tb2
    int 21h  
    
      
    mov ax,num
    mov bx,16
    mov cx,0
    mov dx,0
chuyen16:   
    div bx
    push dx
    inc cx
    cmp ax,0
    je hienthi16  
    xor dx,dx
    jmp chuyen16
    
hienthi16:
    pop dx
    cmp dx,9
    ja inchu
    add dx,30h
    jmp in16
inchu:
    add dx,37h 
    
in16: 
    mov ah,2
    int 21h
    loop hienthi16
    
    
    mov ah,9
    lea dx, tb3
    int 21h    
    
    mov ax,num
    mov bx,2
    mov cx,0
    mov dx,0
    
chuyen2:
    div bx
    push dx
    inc cx
    cmp ax,0
    je hienthi2
    mov dx,0
    jmp chuyen2
    
hienthi2:
    pop dx   
    add dx,30h
    mov ah,2
    int 21h
    loop hienthi2
    
    
thoat:
    mov ah,4ch
    int 21h
    
end main