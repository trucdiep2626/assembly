.model small
.stack 100h
.data
    tb1 db "Nhap chuoi: $"
    str db 100 dup("$")
    tb2 db 10,13,"Nhap ky tu: $"
    char db ?       
    tb3 db 10,13,"Khong co ky tu $"
    tb4 db 10,13,"So ky tu trong chuoi $"     
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, tb1
    int 21h

    lea si,str
    xor cx,cx    
nhapchuoi:
    mov ah, 1
    int 21h
    cmp al,13
    je nhapkitu 
    mov [si],al
    inc cx
    inc si
    jmp nhapchuoi
    
nhapkitu:
    mov ah,9
    lea dx, tb2
    int 21h
    
    mov ah,1
    int 21h
    mov char, al
    
    lea si,str
    xor ax,ax
timkiem:    
    mov al,[si]
    cmp char,al
    jne ko
    inc bl
    
ko:
    inc si
    loop timkiem            
           
inketqua:
    cmp bl,0
    je khongtrung
    jmp cotrung
    



khongtrung:
    mov ah,9
    lea dx, tb3
    int 21h     
    jmp thoat
    
cotrung:
    mov ah,9
    lea dx, tb4
    int 21h  
    
    
    mov ax,bx
    mov bx,10 
    mov cx,0    
    mov dx,0
insotrung:
    div bx
    push dx 
    inc cx
    cmp ax,0
    je inso       
    xor dx,dx
    jmp insotrung
    
    inso:      
        pop bx
        mov ah,2
        add bx,30h
        mov dx,bx
        int 21h
        dec cx
        cmp cx,0
        jne inso
        
        
    
thoat:    
    mov ah, 4ch
    int 21h
    
end main
    