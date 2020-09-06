.model  small;
    .stack  100h;
    .386;
    .data   ;
path db "input.txt",0
path_out db "output.txt",0
b       db 5 dup ('$');
c       dw ?;
erv     db 'Net takoi komandi',10,13,'$'
dmenu   db '0: Zevershit rabotu. ',10,13
        db '1: Vvesti strocu s claviaturi. ',10,13
        db '2: Zagruzit strocu iz fila. ',10,13
        db 'Vvedite nomer comandi: ',10,13,'$'
sinput	db 10,13,'Enter string:  ',10,13,'$'
a       db 255 dup ('$')
buf label byte
    .code   ;
    mov ax,@data;
    mov ds,ax;

svvod:

    mov ah,9
    lea dx,dmenu
    int 21h


    mov ah,0ah
    lea dx,b;
    int 21h 
    mov b+1,0ah


    mov al,[b+2];
    
    cmp al,30h;
    je erro1;

    cmp al,31h;
    je klav1;
    
    cmp al,32h;
    je lfile;

    mov ah,9
    lea dx,erv
    int 21h
    
    jmp svvod;

lfile:
    mov ax,3d00h 
    lea dx,path
    int 21h
    mov bx,ax;
    mov ah,3fh  
    lea dx,a+1
    mov cx,255;   
    int 21h
    mov cx,ax   
    mov c,cx;
 
    mov ah,3eh  
    int 21h

jmp ptext;


klav1:   
    mov ah,9
    lea dx,sinput
    int 21h

    mov ah,0ah
    lea dx,a;
    int 21h 
    mov a+1,0ah


ptext:
    mov eax,0h;
    mov ebx,0h;
    mov edx,0h;
    mov ecx,0h;
    mov ax, offset a;
    cld;
    mov ax,ds;
    mov es,ax;
    sub ax,ax;
    lea si,a+1;
    lea di,a+1;
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
    cmp al,24h;
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

    mov cl,[b+2]
    cmp cl,31h
    jne efile;
    
    mov ah,9
    lea dx,a+1
    int 21h

    mov ah, 10h
    int 16h    

    jmp erro1;

efile:
    mov   ah,3Ch
    xor   cx,cx
    lea   dx,path_out
    int   21h
    mov   bx,ax

    mov   ah,40h  
    mov   cx,c
    lea   dx,a
    int   21h

    mov ah,3eh
    int 21h
    
erro1:
    mov ax,4c00h;
    int 21h;
    end
