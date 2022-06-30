.model small
.stack 100h
.data      
    file dw ?
    tb1 db "Nhap ten file can doc: $"   
    tb2 db 10,13,"Du lieu tu file: $"
    chuoi db 100 dup("$")
    tenfile db 100 dup(?),"$"
.code

main proc 
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,tb1     
    int 21h
    
    lea si, tenfile
    mov cx,0
    
nhapten:
    mov ah,1
    int 21h
    cmp al,13
    je mofile  
    mov [si],al
    inc si
    inc cx
    jmp nhapten
    
mofile:   
    mov ax,0
    mov ah,3dh     
    
    lea dx,tenfile
    int 21h  
     
    mov file,ax
                  
docfile:
    mov ah,3fh
    mov bx,file
    mov cx,9
    lea dx,chuoi
    int 21h
    
dongfile:
    mov ah,3eh
    mov bx,file
    int 21h    
    
    mov ah,9
    lea dx, tb2
    int 21h
    
    mov ah,9
    lea dx,chuoi
    int 21h
    
    
    mov ah,4ch
    int 21h
    
end main