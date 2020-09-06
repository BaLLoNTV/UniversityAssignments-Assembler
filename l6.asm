.MODEL small 
.STACK 100h 
.386 
.DATA 
sinput	db 10,13,'Enter string:  ',10,13,'$'
.CODE



public revs
revs proc near

    mov eax,0h;
    mov ebx,0h;
    mov edx,0h;
    mov ecx,0h;
    cld;
    mov ax,ds;
    mov es,ax;
    sub ax,ax;
    inc si;
    inc di;
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
    cmp al,24h;
    je erro;
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
    cmp al,24h;
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
erro:
ret
endp


end 