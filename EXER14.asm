;FILENAME: EXER14.ASM
;Programmer Name: Raziff D. Gumapon
;Date; September 20,2024
;Description: This assembly language program will get character input and display back character input

.model small
.stack 200h
.DATA
    inputChar db ?  ; variable to store the input character
    inputMsg db 'Enter a character: $'
    outputMsg db 'You entered: $'

.code
MAIN:
    ; initialize the data segment
    mov ax, @data
    mov ds, ax
    
    ; display the input prompt message
    mov dx, offset inputMsg
    mov ah,09h
    int 21h

    ; read a character from the keyboard
    mov ah,01h
    int 21h
    mov inputChar, al

    ; display the output message
    mov dx, offset outputMsg
    mov ah,09h
    int 21h

    ; display the character back
    mov dl, inputChar
    mov ah, 02h
    int 21h

    ; exit program
    mov ax, 4Ch
    int 21h
END Main




