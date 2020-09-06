.model  small;
    .stack  100h;
    .386;
    .data   ;
a   db 'a a,vfgd; hgjh',10, 13 
    db ' sdfs,fghh; dafa',10, 13
    db ' abc,; cba ;,',10, 13
    db '  123 ;, ; ,, 678 ',10, 13 
    .code   ;
    mov ax,@data;
    mov ds,ax;
    xor eax,eax;
    xor ebx,ebx;
    mov ax, offset a;
    cld;
    lea di,a;
    mov ax,ds;
    mov es,ax;
    sub ax,ax;
    mov si,0;
m1:
    cmp bx,1;
    jne m4
    mov cx,si;
    dec cx;
    mov di,dx;
m6:
    pop ax;
    stosb;    
    inc dx;
    cmp cx,dx;
    ja m6;
m4:
    mov bx,0;
m2:
    lodsb
    cmp al,20h;
    je m1;
    cmp al,2ch;
    je m1;
    cmp al,3bh;
    je m1;
    cmp al,0dh;
    je m1;
    cmp al,0ah;
    je m1;
    cmp al,00h;
    je erro;
    
    cmp bx,0;
    jne m3
    mov dx,si;
    dec dx;
    mov bx,1;
m3:
    push ax;
    jmp m2;

    jmp erro;


    
erro:
erro1:
    
    mov ax,4c00h;
    int 21h;
    end
