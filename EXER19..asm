; FILENAME: EXER19.ASM
; Programmer Name: Raziff D. Gumapon
; Date: September 20, 2024
; Description: This assembly language program will get 3 char inputs and
; display them
.model small
.stack 200h
.data
line1 db 'Enter first character: $'
    line2 db 'Enter second character: $'
    line3 db 'Enter third character: $'
    line4 db 'The first character is $'
    period db '.$'
    line5 db 'The second character is $'
    line6 db 'The third character is $'
    first db ?
    second db ?
    third db ?
.code
    
ProgramStart:
    mov ax, @data
    mov ds, ax

    lea dx, line1
    mov ah,09h
    int 21h

   
    mov ah,01h
    int 21h
    mov first, al

    mov ah,02h
    mov dl, 0dh
    int 21h

    mov ah,02h
    mov dl, 0Ah
    int 21h

    lea dx, line2
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    mov second, al

    mov ah,02h
    mov dl, 0dh
    int 21h

    mov ah,02h
    mov dl,0Ah
    int 21h

    mov ah,09h
    lea dx, line3
    int 21h

mov ah,01h
    int 21h
    mov third, al

mov ah,02h
    mov dl, 0dh
    int 21h

    mov dl,0Ah
    int 21h
    
    mov ah, 09h
    lea dx, line4
    int 21h

    mov dl, first
    mov ah, 02h
    int 21h


    mov ah, 09h
    lea dx, period
    int 21h

    mov ah,02h
    mov dl, 0Ah
    int 21h

    mov ah, 09h
    lea dx, line5
    int 21h

    mov dl, second
    mov ah, 02h
    int 21h

    mov ah, 09h
    lea dx, period
    int 21h

    mov ah,02h
    mov dl, 0Ah
    int 21h

    mov ah, 09h
    lea dx, line6
    int 21h

    mov dl, third
    mov ah, 02h
    int 21h

    mov ah, 09h
    lea dx, period
    int 21h

    mov ah,02h
    mov dl, 0Ah
    int 21h

    mov ax, 4Ch
    int 21h
END ProgramStart