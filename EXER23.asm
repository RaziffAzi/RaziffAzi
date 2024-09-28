; FILENAME: EXER23.ASM
; Programmer Name: Raziff D. Gumapon
; Date: September 22, 2024
; This program simulates an ATM main menu where the user can select 
; different banking services and receive corresponding feedback.

.model small
.stack 200h
.data
    line1 db 'Cebu Institute of Technology - University$'
    line2 db 13,10,'Automated Teller Machine$'
    line3 db 13,10,10,'Main Menu$'
    line4 db 13,10,'1. Balance Inquiry$'
    line5 db 13,10,'2. Withdrawal$'
    line6 db 13,10,'3. Deposit$'
    line7 db 13,10,'4. Transfer$'
    line8 db 13,10,'5. Bill Payment$'
    line9 db 13,10,'6. Change Pin$'
    line10 db 13,10,'7. Exit$'
    line11 db 13,10,'Enter number of your choice: $'
    input db ?
    line12 db 13,10,10,'You have chosen 1 Balance Inquiry.$'
    line13 db 13,10,10,'You have chosen 2 Withdrawal.$'
    line14 db 13,10,10,'You have chosen 3 Deposit.$'
    line15 db 13,10,10,'You have chosen 4 Transfer.$'
    line16 db 13,10,10,'You have chosen 5 Bill Payment.$'
    line17 db 13,10,10,'You have chosen 6 Change Pin.$'
    line18 db 13,10,10,'Exiting....$'
    line19 db 13,10,10,'Thank you for banking with us!$'
    line20 db 13,10,'Copyright 2024$'    
    line21 db 13,10,'Programmer: RAZIFF DURANGPARANG GUMAPON$'
    invalid db 13,10,10, 'Invalid Choice!$'
.code
ProgramStart:
    mov ax,@data
    mov ds,ax

    mov ah,09h
    lea dx,line1
    int 21h

    mov ah,09h
    lea dx,line2
    int 21h

    mov ah,09h
    lea dx,line3
    int 21h

    mov ah,09h
    lea dx,line4
    int 21h

    mov ah,09h
    lea dx,line5
    int 21h

    mov ah,09h
    lea dx,line6
    int 21h

    mov ah,09h
    lea dx,line7
    int 21h

    mov ah,09h
    lea dx,line8
    int 21h

    mov ah,09h
    lea dx,line9
    int 21h

    mov ah,09h
    lea dx,line10
    int 21h

    mov ah,09h
    lea dx,line11
    int 21h

    mov ah,1
    int 21h
    mov input, al

    cmp al, '1'
    jz Is1

    cmp al, '2'
    jz Is2

    cmp al, '3'
    jz Is3

    cmp al, '4'
    jz Is4

    cmp al, '5'
    jz Is5

    cmp al, '6'
    jz Is6

    cmp al, '7'
    jz Is7

    cmp al, '1'
    jmp InvalidChoice
Is1: 
    mov ah,09h
    lea dx,line12
    int 21h

    jmp ThankYou

Is2: 
    mov ah,09h
    lea dx,line13
    int 21h

    jmp ThankYou

Is3: 
    mov ah,09h
    lea dx,line14
    int 21h

    jmp ThankYou

Is4: 
    mov ah,09h
    lea dx,line15
    int 21h

    jmp ThankYou

Is5: 
    mov ah,09h
    lea dx,line16
    int 21h

    jmp ThankYou

Is6: 
    mov ah,09h
    lea dx,line17
    int 21h

    jmp ThankYou

Is7: 
    mov ah,09h
    lea dx,line18
    int 21h

    jmp ThankYou

InvalidChoice:
    mov ah,09h
    lea dx,invalid
    int 21h

ThankYou:
    mov ah,09h
    lea dx,line19
    int 21h

    mov ah,09h
    lea dx,line20
    int 21h

    mov ah,09h
    lea dx,line21
    int 21h

Done: 
    mov ah,4ch
    int 21h
END ProgramStart