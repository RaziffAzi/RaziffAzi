; FILENAME: EXER20.ASM
; Programmer Name: Raziff D. Gumapon
; Date: September 22, 2024
; Description: Program checks if user input is 'A' or 'a' and displays corresponding message
.model small
.stack 200h
.data
    line1 db 'Enter a character: $'
    Yes db 'Yes, you have entered letter A.$'
    No db 'No, you have not entered letter A. You entered character $'
    period db '.$'
    input db ?
.code
ProgramStart:
    mov ax, @data
    mov ds, ax

    mov ah,09h
    lea dx, line1
    int 21h

    mov ah,01h
    int 21h
    mov input, al

    cmp al, 'A'
    jz isYes
    cmp al, 'a'
    jz isYes

    jmp isNo

isYes:
    mov ah,02h
    mov dl, 0dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h

    mov ah, 09h
    lea dx, Yes
    int 21h

    jmp Done

isNo:
    mov ah,02h
    mov dl, 0dh
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h

  
    mov ah, 09h
    lea dx, No
    int 21h

    mov ah, 02h
    mov dl, input
    int 21h

    mov ah, 09h
    lea dx, period
    int 21h

Done: 
    mov ah, 4ch
    int 21h
End ProgramStart