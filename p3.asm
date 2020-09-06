.model  small;
    .stack  100h;
    .386;
    .data   ;
n equ 4
a db 1, 2, 3, 0
  db 2, 1, 0, 3
  db 3, 0, 1, 2
  db 0, 3, 2, 1
b db 0;
    .code   ;
    mov ax,@data;
    mov ds,ax;
    xor eax, eax
    xor ecx, ecx
    xor edx, edx    
    xor ebx, ebx

    push bp;
    mov bp,sp;
    mov ax,n;
    dec ax;
    push ax; bp-2 N-1
    push ax; bp-4
    inc ax;
    mul eax;
    push ax; bp-6 N*N
    mov ax,0;
    push ax; bp-8 0
    mov ax,[bp-6]; 
    dec ax;
    push ax; bp-10 n*n-1
    push ax; bp-12;
    mov dx,[bp-2];
m2:
    mov si,[bp-8];
    mov di,[bp-10];
    mov cx,[bp-2];
m1:
    mov al,[a+si];
    mov bl,[a+di];
    cmp al,bl;
    jne erro;
    add si,n;
    dec di;
    dec cx;
    cmp cx,0;
    ja m1;

    mov ax,[bp-8];
    inc ax;
    mov [bp-8],ax;
    mov ax,[bp-10];
    sub ax,n;
    mov [bp-10],ax;
    mov ax,[bp-2];
    dec ax;
    mov [bp-2],ax;
    sub ax,ax;
    dec dx;

    cmp dx,0;
    ja m2;
    mov b,1;
    mov ax,[bp-4];
    mov [bp-2],ax;
    mov [bp-8],ax;
    mov ax,[bp-6];
    sub ax,n;
    mov [bp-10],ax;

    mov dx,0;
    mov dx,[bp-2];
m4:
    mov si,[bp-8];
    mov di,[bp-10];
    mov cx,[bp-2];
m3:
    mov al,[a+si];
    mov bl,[a+di];
    cmp al,bl;
    jne erro;
    dec si;
    sub di,n;
    dec cx;
    cmp cx,0;
    ja m3;

    mov ax,[bp-8];
    add ax,n;
    mov [bp-8],ax;
    mov ax,[bp-10];
    inc ax;
    mov [bp-10],ax;
    mov ax,[bp-2];
    dec ax;
    mov [bp-2],ax;
    sub ax,ax;
    dec dx;

    cmp dx,0;
    ja m4;

    mov al,b;
    add al,2;
    mov b,al;
    
erro:
    mov ax,4c00h;
    int 21h;
    end
