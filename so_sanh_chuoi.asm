.model small
.stack 100h
.data
    tb1 db "Nhap chuoi 1: $"
    tb2 db 10,13,"Nhap chuoi 2: $"
    str1 db 100 dup("100")
    str2 db 100 dup("100")   
    tb3 db 10,13,"Hai chuoi khac nhau $"
    tb4 db 10,13,"Hai chuoi giong nhau $"
    
.code
main proc
    mov ax, @data
    mov ds,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
    
    lea si, str1
    xor cx,cx
    
nhapchuoi1:
    mov ah,1
    int 21h
    cmp al,13
    je nhapchuoi2
    mov [si],al
    inc si
    inc cx
    jmp nhapchuoi1
    
nhapchuoi2:
    mov ah,9
    lea dx,tb2
    int 21h
    
    lea di, str2
    xor bx,bx
    
nhap2:
    mov ah,1
    int 21h
    cmp al,13
    je sosanhdodai
    mov [di],al
    inc di
    inc bx
    jmp nhap2
    
sosanhdodai:
    
    cmp cx,bx
    jne khonggiong  
    xor ax,ax
    xor dx,dx  
    lea si, str1
    lea di,str2
    sosanh:   
       
        mov al,[si]
        mov dl,[di]
        cmp al,dl
        jne khonggiong      
        inc si
        inc di
        loop sosanh    
        
        
giong:
    mov ah,9
    lea dx,tb4
    int 21h
    jmp thoat 
    
khonggiong:
    mov ah,9
    lea dx,tb3
    int 21h
    jmp thoat
    
        
    

thoat:
    mov ah,4ch
    int 21h