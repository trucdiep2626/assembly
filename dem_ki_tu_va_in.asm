.model small
.stack 100h
.data

    tb1 db "Nhap chuoi: $"      
    tb2 db 10,13,"So ki tu cua chuoi: $"
    str db 100 dup("$")
    size db ? 
    enter db 10,13,"$"
.code
main proc 
    
    mov ax, @data
    mov ds, ax
                
    mov ah, 9
    lea dx, tb1
    int 21h
    
    lea si, str
    xor cx,cx
    
nhapchuoi:
    mov ah, 1
    int 21h
    cmp al, 13
    je  sokitu
    mov [si], al
    inc si
    inc cx
    jmp nhapchuoi  
    
sokitu:
    mov size, cl
    mov al, cl
    
    mov ah,0
    xor cx,cx 
    
    lap:
              
        xor dx,dx
        mov bx,10
        div bx   
        push dx
        inc cx
        cmp ax, 0
        je inketqua
        jmp lap
        
inketqua:
     mov ah, 9
     lea dx, tb2
     int 21h       
inso:
    mov ah, 2
    pop bx
    add bx,30h
    mov dl, bl
    int 21h
    loop inso
 
    mov ah,9
    lea dx,enter
    int 21h
    
    lea si,str
    mov cl,size           
inchuoi:
    mov ah,2
    mov dl, [si] 
    int 21h  
    inc si
    loop inchuoi
    
thoat:
    mov ah, 4ch
    int 21h    