.model small
.stack 100h
.data
    tb1 db "Nhap ten file: $"
    tenfile db 30 dup(?),'$'
    tb2 db 10,13,"Nhap noi dung file: $"
    noidung db 100 dup("$")
    f dw ?
    
.code

main proc
    
    mov ax, @data
    mov ds,ax
    
    mov ah, 9
    lea dx, tb1
    int 21h

    lea si,tenfile                    
    mov cx,0
    
nhapten:
    mov ah,1
    int 21h
    cmp al,13
    je taofile 
    mov [si],al
    inc si
    inc cx
    jmp nhapten
            
            
            
    
    taofile:
        mov ax,0
        
        mov cx,0  
        lea dx,tenfile
        mov ah,3Ch  
        int 21h    
        
        mov f,ax     

    
    mov ah,9
    lea dx,tb2
    int 21h
    
    mov ah,10
    lea dx,noidung
    int 21h  
    
    lea si,noidung
    
    
    mov ax,0
    mov ah,40h
                 
    mov cx,0
    mov cl, [si+1]
    lea dx,[si+2]  
    mov bx,f
    int 21h   
    
    ;dong file
    mov ah,3eh
    mov bx,f
    int 21h
    
    mov ah, 4ch
    int 21h
    
end main
    
       
