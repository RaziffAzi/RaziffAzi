; FILENAME: EXER18.ASM
; Programmer Name: Raziff D. Gumapon
; Date: September 20, 2024
; Description: This assembly language program will get string input and
; display the reverse of the string

.model small
.stack 100h
.data
    MAXIMUM_STRING_LENGTH EQU 1000
    StringToReverse db MAXIMUM_STRING_LENGTH DUP(?)
    ReverseString db MAXIMUM_STRING_LENGTH DUP(?)
.code
ProgramStart:
    mov ax,@data
    mov ds,ax  ; set DS to point to data segment

    mov ah, 3fh         ; DOS read from handle function
    mov bx, 0         ; standard input handle
    mov cx, MAXIMUM_STRING_LENGTH   ; read up to maximum number of characters

    mov dx, OFFSET StringToReverse  ; store the string here
    int 21h     ; get the string
    and ax,ax   ; were any characters read?
    jz Done     ; no, so you're done
    mov cx,ax   ; put string length in CX, where you can use it
                
    push cx    ; save the string length
    mov bx, offset StringToReverse
    mov si, offset ReverseString
    add si, cx
    dec si      ; point to the end of the reverse string buffer

ReverseLoop:
    mov al, [bx]      ; get the next character
    mov [si],al       ; store the characters in reverse order
    inc bx            ; point to the next xhracter
    dec si           ; point to the previous location in reverse buffer

    loop ReverseLoop       ; move next character if any
    pop cx                 ; get back the string length
    mov ah, 40h            ;DOS write from handle function f
    mov bx, 1              ; standard output handle
    mov dx, offset ReverseString   ; print this string
    int 21h                 ; print the reversed string

Done: 
    mov ah, 4ch          ; DONE terminate program function f
    int 21h             ; terminate the program
END ProgramStart