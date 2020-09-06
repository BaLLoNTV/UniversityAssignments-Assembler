.model  small;
    .stack  100h;
    .386;
    .data   ;
a   dw  00010001111000100b;
    .code   ;
    mov ax,@data;
    mov ds,ax;
    mov cx,a;
    mov dx,00001111111111111b;
    mov bx,01010000000000000b;
    mov si,01110000000000000b;
    sub ax,ax;
m0:
    and cx,dx;
    or cx,bx;
    cmp cx,a;
    je m1;
    mov cx,a;
    jmp m3;
m1:
    cmp ax,13;
    ja m3; 
    xor cx,si;
    rol cx,3;
    mov a,cx;
    add ax,3;
m2:
    cmp ax,16;
    jb m0;
    jmp erro; 
 
m3:
    rol cx,1;
    mov a,cx;
    inc ax;
    jmp m2;
erro:
    mov ax,4c00h;
    int 21h;
    end
