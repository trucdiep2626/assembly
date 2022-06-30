.model small
.stack 100h
.data
    tb1 db "Nhap chuoi: $"      
    tb2 db 10,13,"So am: $"
    tb3 db 10,13,"So duong: $"
    str db 100 dup("$")
    am dw 0
    duong dw 0
.code

main proc
    
    mov ax, @data
    mov ds,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
    
    mov ah,10
    lea dx,str
    int 21h
                 
    mov cx,0
    lea si,str
    mov cl,[si +1]
    mov bx,0
    mov ax,0
tachso:       
    mov al,[si+2]
    cmp bx,0
    je xetso
    
    cmp al, 20h
    je dauso
    jmp skip
    
dauso:
    mov bx,0
    jmp skip            

xetso:
    cmp al,2Dh
    je demam
    jne demduong    
     
     
demam:
    inc am
    mov bx,1 
    jmp skip

demduong:
    inc duong
    mov bx,1   
    jmp skip
    
skip:
    inc si
    loop tachso         
    

    mov ah,9
    lea dx,tb2
    int 21h
    
    mov ax,am
    mov bx,10
    mov cx,0
    mov dx,0
chiaam:
    div bx
    push dx
    inc cx
    cmp ax,0
    je inam
    mov dx,0
    jmp chiaam
    
inam:
    pop dx
    add dx,30h
    mov ah,2
    int 21h
    loop inam     
    
    mov ah,9
    lea dx,tb3
    int 21h
    
    mov ax,duong
    mov bx,10
    mov cx,0
    mov dx,0
chiaduong:
    div bx
    push dx
    inc cx
    cmp ax,0
    je induong
    mov dx,0
    jmp chiaduong
    
induong:
    pop dx
    add dx,30h
    mov ah,2
    int 21h
    loop induong
    
    mov ah,4ch
    int 21h
    
end main