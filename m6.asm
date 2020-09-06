.MODEL small 
.STACK 100h 
.386 
.DATA 
sinput	db 10,13,'Enter string:  ',10,13,'$'
.CODE

public menu
menu proc near
push ax;
push dx;
mov ah,9
mov dx,di;
int 21h
mov ah,0ah
mov dx,si;
int 21h 
mov [si],ax;
pop dx;
pop ax;
ret
endp

public ifs
ifs proc near
    push ax;
    mov ax,3d00h 
    mov dx,si;
    int 21h
    mov bx,ax;
    mov ah,3fh  
    inc di;
    mov dx,di
    mov cx,255;   
    int 21h
    mov cx,ax 
    pop si;  
    mov [si],cx;
 
    mov ah,3eh  
    int 21h
ret
endp

public ofs
ofs proc near
    push  ax;
    sub   ax,ax;
    mov   ah,3Ch
    xor   cx,cx
    mov   dx,si
    int   21h
    mov   bx,ax

    mov   ah,40h  
    pop  si;
    mov   cx,[si];
    mov   dx,di
    int   21h

    mov ah,3eh
    int 21h
ret
endp

public ics
ics proc near
    mov ah,9
    lea dx,sinput
    int 21h
    mov ah,0ah
    mov dx,si;
    int 21h 

    mov [si],ax;
ret
endp

public ocs
ocs proc near

    mov ah,9
    mov dx,si
    add si,2;
    int 21h
    mov ah, 10h
    int 16h
ret
endp

end 