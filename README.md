# assembly
              .model small  //kích thước chương trình
              .stack 100h // khai báo kích thước đoạn ngăn xếp
              .data  //khai báo các dòng in nhập

              //in dòng xin chao
              nhan db "Xin chao$"


              //nhập số
              tb1 db "Nhap so thap phan: $"
              x dw ?
              y dw ?
              
              //khai báo con trỏ file
              f dw ?

              //khai báo đoạn mã
              .code

              main proc
              
                     mov ax, @data
                     mov ds, ax
                     mov es,ax

                     :hàm ngắt ah loại 1, để nhập vào 1 ký tự từ bàn phím
                     mov ah, 1
                     int 21h
                     mov s, al

                     :hàm ngắt ah loại 2, để in ra 1 ký tự
                     mov ah, 2
                     mov dl, mã_ascii_code (để xem mã bấm ascii code hiện mã hệ thập phân, bấm chuột trái 1 lần chuyển sang hệ hexa vd 35h)
                     int 21h

                     :hàm ngắt ah loại 9, để in ra 1 dòng ký tự
                     mov ax, @data
                     mov ds,ax
                     mov ah, 9
                     lea dx, nhan
                     int 21h
                     
                     ;hàm ngắt ah loại 10, để nhập chuỗi
                     mov ah,10
                     lea dx, chuoi
                     int 21h

                     ;hàm ngắt ah, 4ch để dừng chương trình
                     mov ah, 4ch
                     int 21h
                     
                     
                     ;thao tác với file
                     ;tạo file
                     mov ah, 3ch
                     mov cx,0  // tập tin có thuộc tính bình thường
                     lea dx, tenfile
                     int 21h
                     
                     ;ghi file
                     mov ah,40h
                     mov bx,f
                     mov cx,0
                     mov cl, dodaichuoi
                     lea dx, chuoi
                     int 21h
                     
                     ;mở file
                     mov ah,3dh
                     lea dx, tenfile
                     int 21h
                     
                     mov file,ax 
                     
                     ;docfile
                     mov ah,3fh
                     mov bx,file
                     mov cx, số kí tự cần đọc
                     lea dx, chuỗi đọc ra console
                     int 21h
                    
                      ;đóng file
                      mov ah,3eh
                      mov bx,f
                      int 21h
                      
                      ;đổi tên file
                      mov ah, 56h
                      lea dx,tencu
                      lea di, tenmoi
                      int 21h
                      
                     ;xóa file
                      mov ah, 41h
                      lea dx,ten
                      int 21h
                      
                     ;cộng
                     mov al,4
                     mov bl,5
                     add al, bl //lưu kết quả vào al

                     ;trừ
                     mov al,4
                     mov bl,5
                     sub al, bl //lưu kết quả vào al

                     ;nhân
                     mov al,4
                     mov bl,5
                     mul bl //mặc định lấy al nhân với thanh ghi khai báo, lưu kết quả vào al

                     ;chia
                     mov ax,20
                     mov bx,6
                     div bl //chia thanh ghi 8bit lấy bl, lưu kết quả phần nguyên lưu vào al, phần dư lưu ah
              chia thanh 16 lấy bx, nguyên lưu vào ax, dư lưu vào dx
                   ;vòng lặp, số vòng lập mặc định lấy từ cx
                     mov ax,0
                     mov bx,0
              tinhtong:
                     inc ax  // inc là ++, dev là --
                     add bx,ax
                     loop tinhtong


              thoat
                     ret //quay trở lại chương trình chính và thực hiện tiếp câu lệnh bên dưới


              main endp


              //tạo hàm
              nhapso proc
                     mov x,0
                     mov y,0
                      mov bx, 10 // để nhập số trong hệ thập phân
              nhap:
                     mov ah,1
                     int 21h
                     ;nhập đến khi enter mới dừng lại
                     cmp al,13
                     je thoat // neu nhập vào enter thì chạy hàm thoat
                     sub al, 30h  //trừ đi 30h để tính toàn đúng số nhập
                     xor ah, ah // xóa thanh ghi ah do dòng tiếp theo dùng ax cần 16bit nên cần xóa để dùng 16 bit của ax
                     mov y, ax
                     mov ax, x
                     mul bx //ax nhân với 10 để thành số hàng chục
                     add ax,y
                     mov x, ax
                     jmp nhap //quay lại nhập tiếp tục

                  ; so sánh 2 số
                  mov ah,1
                  mov al, 2
                  cmp ah,al

              nhapso endp
              end main


A - accumulator

B - base

C - counter

D - data
...

Cx là thanh ghi liên quan đến count

Si với di là source index với dest index, thường đc dùng trong string

IP là thanh ghi trỏ tới lệnh hiện tại

https://www.eecg.utoronto.ca/~amza/www.mindsec.com/files/x86regs.html
