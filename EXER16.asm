; FILENAME: EXER16.ASM
; Programmer Name: Raziff D. Gumapon
; Date: September 20, 2024
; Description: This assembly language program will get character input and
; determine if inout is 'y' or 'Y' to display good morning message
; else display good afternoon message.

.model small
.stack 200h
.data
    TimePrompt db 'Is it after 12 noon (Y/N)?$'
    GoodMorningMessage LABEL BYTE
        db 13,10, 'Good morning, world!', 13,10, '$'
    GoodAfternoonMessage LABEL BYTE
        db 13,10, 'Good afternoon, world!', 13, 10, '$'

.code
ProgramStart:
    mov ax,@data
    mov ds,ax                              ; set DS to point to data segment 
    mov dx, offset TimePrompt              ; point to the time prompt
    mov ah,9                               ; DOS print string function
    int 21h                                ; display time prompt

    mov ah, 1                              ; DOS get character function
    int 21h                                ; get single character response

    cmp al, 'y'                            ; typed lowercase 'y' for after noon?
    jz IsAfternoon                         ; jz = jump if zero. Yes, it's afternoon
       
    cmp al, 'Y'                            ; typed uppercase 'Y' for afternoon?
    jnz IsMorning                          ; no, it's before noon

IsAfternoon:
    mov dx, offset GoodAfternoonMessage    ; point to the afternoon greeting
    jmp DisplayGreeting                    ; point to the afternoon greeting

IsMorning:   
    mov dx, offset GoodMorningMessage      ; point to before noon greeting

DisplayGreeting:
    mov ah, 9                              ; DOS print string function
    int 21h                                ; display the greeting

    mov ah,4ch                             ; DOS terminate program function
    int 21h                                ; terminate program
END ProgramStart