.model small
.stack 100h
.data
    tb1 db "Nhap ten file: $"   
    tb2 db 10,13,"Nhap ten moi: $"
    tencu db 100 dup(?),"$"
    tenmoi db 100 dup(?),"$"
.code                      

main proc   
    
    mov ax, @data
    mov ds,ax 
    mov es,ax
    
    mov ah,9
    lea dx , tb1
    int 21h
    
    lea si,tencu
    mov cx,0
    
    call nhap
    
    mov ah,9
    lea dx , tb2
    int 21h
    
    lea si,tenmoi
    mov cx,0
    
    call nhap    
    
    mov ah,56h
    lea dx, tencu
    lea di,tenmoi
    int 21h
    
    mov ah, 4ch
    int 21h
        

nhap proc
    mov ah,1
    int 21h
    cmp al,13  
    je thoat
    mov [si],al
    inc cx 
    inc si
    jmp nhap
    
    thoat:
    RET
    
nhap endp   

end main
    
    