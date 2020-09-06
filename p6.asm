.MODEL small 
.STACK 100h 
.386 
.DATA 
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
a       db 0ffh
        db 254 dup ('$')
buf label byte
.CODE 
extrn menu:proc 
call near ptr menu 
extrn ifs:proc 
call near ptr ifs 
extrn ofs:proc
call near ptr ofs
extrn ics:proc
call near ptr ics
extrn ocs:proc
call near ptr ocs
extrn revs:proc
call near ptr revs


begin: 
    mov ax, @data 
    mov ds, ax 
    mov es, ax 

    lea di,dmenu;
    lea si,b;
    call menu;
    mov al,[b+2];
    cmp al,30h;
    je erro1;
    cmp al,31h;
    je klav;
    cmp al,32h;
    je file;
    
file:
    lea di,a;
    lea si,path;
    lea ax,c;
    call ifs;
    lea si,a;
    lea di,a;
    call revs;
    lea di,a+1;
    lea si,path_out;
    lea ax,c;
    call ofs;
    jmp erro1;
klav:
    lea si,a;
    call ics;
    lea si,a;
    lea di,a;
    call revs;
    lea si,a;
    call ocs;
    jmp erro1;

erro1:  
    mov ah, 4ch 
    int 21h 
end begin 